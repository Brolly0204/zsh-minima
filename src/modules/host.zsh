MINIMA_HOST_ENABLE="${SPACESHIP_HOST_ENABLE=true}"
MINIMA_HOST_PREFIX="${SPACESHIP_HOST_PREFIX="at "}"
MINIMA_HOST_SUFFIX="${SPACESHIP_HOST_SUFFIX=""}"
MINIMA_HOST_COLOR="${SPACESHIP_HOST_COLOR="blue"}"

minima_module_host() {
  [[ $MINIMA_HOST_ENABLE == false ]] && return

  minima::module \
    "$MINIMA_HOST_COLOR" \
    "$MINIMA_HOST_PREFIX" \
    "%m" \
    "$MINIMA_HOST_SUFFIX"
}