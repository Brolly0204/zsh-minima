MINIMA_GIT_STATUS_PREFIX="${MINIMA_GIT_STATUS_PREFIX=" "}"
MINIMA_GIT_STATUS_SUFFIX="${MINIMA_GIT_STATUS_SUFFIX=""}"
MINIMA_GIT_STATUS_SYMBOL_UNTRACKED="${MINIMA_GIT_STATUS_SYMBOL_UNTRACKED="?"}"
MINIMA_GIT_STATUS_SYMBOL_ADDED="${MINIMA_GIT_STATUS_SYMBOL_ADDED="+"}"
MINIMA_GIT_STATUS_SYMBOL_MODIFIED="${MINIMA_GIT_STATUS_SYMBOL_MODIFIED="!"}"
MINIMA_GIT_STATUS_SYMBOL_RENAMED="${MINIMA_GIT_STATUS_SYMBOL_RENAMED="»"}"
MINIMA_GIT_STATUS_SYMBOL_DELETED="${MINIMA_GIT_STATUS_SYMBOL_DELETED="✘"}"
MINIMA_GIT_STATUS_SYMBOL_STASHED="${MINIMA_GIT_STATUS_SYMBOL_STASHED="$"}"
MINIMA_GIT_STATUS_SYMBOL_UNMERGED="${MINIMA_GIT_STATUS_SYMBOL_UNMERGED="="}"
MINIMA_GIT_STATUS_SYMBOL_AHEAD="${MINIMA_GIT_STATUS_SYMBOL_AHEAD="⇡"}"
MINIMA_GIT_STATUS_SYMBOL_BEHIND="${MINIMA_GIT_STATUS_SYMBOL_BEHIND="⇣"}"
MINIMA_GIT_STATUS_COLOR="${MINIMA_GIT_STATUS_COLOR="#FFC125"}"

minima_module_git_status() {
  minima::is_git || return

  local INDEX=$(command git status --porcelain -b 2> /dev/null)
  local git_status=""

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_UNTRACKED$git_status"
  fi

  # Check for staged files
  if $(echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_ADDED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_MODIFIED$git_status"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_RENAMED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_DELETED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_STASHED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^AA ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^DD ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^[DA]U ' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_UNMERGED$git_status"
  fi

  # Check whether branch is ahead
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_AHEAD$git_status"
  fi

  # Check whether branch is behind
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    git_status="$MINIMA_GIT_STATUS_SYMBOL_BEHIND$git_status"
  fi

  [[ $git_status == "" ]] && return

  minima::module \
    "$MINIMA_GIT_STATUS_COLOR" \
    "$MINIMA_GIT_STATUS_PREFIX" \
    "$git_status" \
    "$MINIMA_GIT_STATUS_SUFFIX"
}
