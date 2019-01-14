MINIMA_GIT_BRANCH_ENABLE="${MINIMA_GIT_BRANCH_ENABLE=true}"
MINIMA_GIT_BRANCH_PREFIX="${MINIMA_GIT_BRANCH_PREFIX=""}"
MINIMA_GIT_BRANCH_SUFFIX="${MINIMA_GIT_BRANCH_SUFFIX=""}"
MINIMA_GIT_BRANCH_SYMBOL="${MINIMA_GIT_BRANCH_SYMBOL=""}"
MINIMA_GIT_BRANCH_COLOR="${MINIMA_GIT_BRANCH_COLOR="magenta"}"

minima_module_git_branch() {
  [[ $MINIMA_GIT_BRANCH_ENABLE == false ]] && return

  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"

  minima::module \
    "$MINIMA_GIT_BRANCH_COLOR" \
    "$MINIMA_GIT_BRANCH_PREFIX" \
    "${git_current_branch}" \
    "$MINIMA_GIT_BRANCH_SUFFIX"
}
