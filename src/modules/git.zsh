MINIMA_GIT_ENABLE="${MINIMA_GIT_ENABLE=true}"
MINIMA_GIT_PREFIX="${MINIMA_GIT_PREFIX="on "}"
MINIMA_GIT_SUFFIX="${MINIMA_GIT_SUFFIX=""}"
MINIMA_GIT_SYMBOL="${MINIMA_GIT_SYMBOL=" "}"
MINIMA_GIT_COLOR="${MINIMA_GIT_COLOR="white"}"

source "$MINIMA_ROOT/modules/git_branch.zsh"
source "$MINIMA_ROOT/modules/git_status.zsh"

minima_module_git() {
  [[ MINIMA_GIT_ENABLE == false ]] && return

  local git_branch="$(minima_module_git_branch)"
  local git_status="$(minima_module_git_status)"

  [[ -z $git_branch ]] && return

  minima::module \
    "$MINIMA_GIT_COLOR" \
    "$MINIMA_GIT_PREFIX" \
    "${git_branch}${git_status}" \
    "$MINIMA_GIT_SUFFIX"
}
