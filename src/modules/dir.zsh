MINIMA_DIR_ENABLE="${MINIMA_DIR_ENABLE=true}"
MINIMA_DIR_PREFIX="${MINIMA_DIR_PREFIX="in "}"
MINIMA_DIR_SUFFIX="${MINIMA_DIR_SUFFIX=" "}"
MINIMA_DIR_COLOR="${MINIMA_DIR_COLOR="cyan"}"

minima_module_dir() {
  [[ $MINIMA_DIR_ENABLE == false ]] && return

  minima::module \
    "$MINIMA_DIR_COLOR" \
    "$MINIMA_DIR_PREFIX" \
    "%0~" \
    "$MINIMA_DIR_SUFFIX"
}
