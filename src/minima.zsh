if [[ -z "$MINIMA_ROOT" ]]; then
  if [[ "${(%):-%N}" == '(eval)' ]]; then
    if [[ "$0" == '-antigen-load' ]] && [[ -r "${PWD}/minima.zsh" ]]; then
      export MINIMA_ROOT=$PWD
    else
      print -P "%F{red}You must set MINIMA_ROOT to work from within an (eval).%f"
      return 1
    fi
  else
    export MINIMA_ROOT=${${(%):-%x}:A:h}
  fi
fi

if [ -z "$MINIMA_PROMPT_ORDER" ]; then
  MINIMA_PROMPT_ORDER=(
    user
    host
    dir
    git
    go
    node
    npm
    yarn
    npm_package
    php
    python
    docker
    exec_time
    line_sep
    jobs
    exit_code
    char
  )
fi

source "$MINIMA_ROOT/utils.zsh"

for module in $MINIMA_PROMPT_ORDER; do
  if [[ -f "$MINIMA_ROOT/modules/$module.zsh" ]]; then
    source "$MINIMA_ROOT/modules/$module.zsh"
  elif minima::is_defined "minima_module_$module"; then
    continue
  else
    echo "Module '$module' have not been loaded."
  fi
done

minima_prompt() {
  RETVAL=$?

  echo -n "\n"
  minima::compose_prompt $MINIMA_PROMPT_ORDER
}

minima_ps2() {
  RETVAL=$?

  local char="${MINIMA_CHAR_SYMBOL_SECONDARY="$MINIMA_CHAR_SYMBOL"}"
  minima::module "$MINIMA_CHAR_COLOR_SECONDARY" "$char"
}

minima_setup() {
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  prompt_opts=(cr percent sp subst)

  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  # Add exec_time hooks
  add-zsh-hook preexec minima::exec_time_preexec_hook
  add-zsh-hook precmd minima::exec_time_precmd_hook

  # Configure vcs_info helper for potential use in the future
  add-zsh-hook precmd minima::exec_vcs_info_precmd_hook
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  PROMPT='$(minima_prompt)'
  PS2='$(minima_ps2)'
}

minima_setup "$@"
