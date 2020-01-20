MINIMA_YARN_PREFIX="${MINIMA_YARN_PREFIX="with "}"
MINIMA_YARN_SUFFIX="${MINIMA_YARN_SUFFIX=" "}"
# MINIMA_YARN_SYMBOL="${MINIMA_YARN_SYMBOL="🚀 "}"
MINIMA_YARN_SYMBOL="${MINIMA_YARN_SYMBOL="yarn "}"
MINIMA_YARN_COLOR="${MINIMA_YARN_COLOR="cyan"}"

minima_module_yarn() {
  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return
  minima::is_exists yarn || return

  local yarn_version=$(yarn -v 2>/dev/null)

  minima::module \
    "$MINIMA_YARN_COLOR" \
    "$MINIMA_YARN_PREFIX" \
    "${MINIMA_YARN_SYMBOL}${yarn_version}" \
    "$MINIMA_YARN_SUFFIX"
}
