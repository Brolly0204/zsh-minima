MINIMA_USER_ENABLE="${MINIMA_USER_ENABLE=true}"
MINIMA_USER_PREFIX="${MINIMA_USER_PREFIX="with "}"
MINIMA_USER_SUFFIX="${MINIMA_USER_SUFFIX=""}"
MINIMA_USER_COLOR="${MINIMA_USER_COLOR="yellow"}"

minima_module_user() {
  [[ $MINIMA_USER_ENABLE == false ]] && return

  minima::module \
    "$MINIMA_USER_COLOR" \
    "$MINIMA_USER_PREFIX" \
    '%n' \
    "$MINIMA_USER_SUFFIX"
}
