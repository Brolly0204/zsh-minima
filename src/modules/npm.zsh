MINIMA_NPM_PREFIX="${MINIMA_NPM_PREFIX="with "}"
MINIMA_NPM_SUFFIX="${MINIMA_NPM_SUFFIX=" "}"
MINIMA_NPM_SYMBOL="${MINIMA_NPM_SYMBOL="npm "}"
MINIMA_NPM_COLOR="${MINIMA_NPM_COLOR="red"}"

minima_module_npm() {
  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return
  minima::is_exists npm || return

  local npm_version=$(npm -v 2>/dev/null)

  minima::module \
    "$MINIMA_NPM_COLOR" \
    "$MINIMA_NPM_PREFIX" \
    "${MINIMA_NPM_SYMBOL}${npm_version}" \
    "$MINIMA_NPM_SUFFIX"
}
