minima::is_defined() {
  typeset -f + "$1" &> /dev/null
}

minima::is_exists() {
  command -v $1 > /dev/null 2>&1
}

minima::is_git() {
  [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

minima::compose_prompt() {
  setopt EXTENDED_GLOB
  setopt LOCAL_OPTIONS

  for module in $@; do
    if minima::is_defined "minima_module_$module"; then
      minima_module_$module
    else
      minima::module 'red' '' "'$module' not found" ''
    fi
  done
}

minima::module() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  echo -n "%{%B%}"        # set bold
  echo -n "$prefix"
  echo -n "%{%b%}"        # unset bold
  echo -n "%{%B$color%}"  # set color
  echo -n "$content"      # section content
  echo -n "%{%b%f%}"      # unset color
  echo -n "%{%B%}"        # reset bold, if it was disabled before
  echo -n "$suffix"
  echo -n "%{%b%}"        # unset bold
}

minima::exec_time_preexec_hook() {
  [[ $MINIMA_EXEC_TIME_ENABLE == false ]] && return
  minima_exec_time_start=$(date +%s)
}

minima::exec_time_precmd_hook() {
  [[ $MINIMA_EXEC_TIME_ENABLE == false ]] && return
  [[ -n $minima_exec_time_duration ]] && unset minima_exec_time_duration
  [[ -z $minima_exec_time_start ]] && return
  local minima_exec_time_stop=$(date +%s)
  minima_exec_time_duration=$(( $minima_exec_time_stop - $minima_exec_time_start ))
  unset minima_exec_time_start
}

minima::exec_vcs_info_precmd_hook() {
  [[ $MINIMA_GIT_BRANCH_ENABLE == false ]] && return
  vcs_info
}
