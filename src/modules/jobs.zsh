MINIMA_JOBS_PREFIX="${MINIMA_JOBS_PREFIX=""}"
MINIMA_JOBS_SUFFIX="${MINIMA_JOBS_SUFFIX=" "}"
MINIMA_JOBS_SYMBOL="${MINIMA_JOBS_SYMBOL="✦"}"
MINIMA_JOBS_COLOR="${MINIMA_JOBS_COLOR="blue"}"

minima_module_jobs() {
  local jobs=$( jobs -d | awk '!/pwd/' | wc -l | tr -d " ")

  [[ $jobs -gt 0 ]] || return

  minima::module \
    "$MINIMA_JOBS_COLOR" \
    "$MINIMA_JOBS_PREFIX" \
    "${MINIMA_JOBS_SYMBOL}${jobs}" \
    "$MINIMA_JOBS_SUFFIX"
}
