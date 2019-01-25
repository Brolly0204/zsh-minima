MINIMA_EXEC_TIME_ENABLE="${MINIMA_EXEC_TIME_ENABLE=true}"
MINIMA_EXEC_TIME_PREFIX="${MINIMA_EXEC_TIME_PREFIX="took "}"
MINIMA_EXEC_TIME_SUFFIX="${MINIMA_EXEC_TIME_SUFFIX=" "}"
MINIMA_EXEC_TIME_COLOR="${MINIMA_EXEC_TIME_COLOR="yellow"}"

display_time() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf '%ds' $S
}

minima_module_exec_time() {
  [[ $MINIMA_EXEC_TIME_ENABLE == false ]] && return

  minima::module \
    "$MINIMA_EXEC_TIME_COLOR" \
    "$MINIMA_EXEC_TIME_PREFIX" \
    "$(display_time $minima_exec_time_duration)" \
    "$MINIMA_EXEC_TIME_SUFFIX"
}
