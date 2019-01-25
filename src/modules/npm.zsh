MINIMA_NPM_ENABLE="${MINIMA_NPM_ENABLE=true}"
MINIMA_NPM_PREFIX="${MINIMA_NPM_PREFIX="with "}"
MINIMA_NPM_SUFFIX="${MINIMA_NPM_SUFFIX=" "}"
MINIMA_NPM_SYMBOL="${MINIMA_NPM_SYMBOL="NPM: "}"
MINIMA_NPM_COLOR="${MINIMA_NPM_COLOR="red"}"

minima_module_npm() {
  [[ $MINIMA_NPM_ENABLE == false ]] && return

  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return

  local npm_version

  if minima::is_exists npm; then
    npm_version=$(npm -v 2>/dev/null)
  fi

  [[ $npm_version == "" ]] && return

  minima::module \
    "$MINIMA_NPM_COLOR" \
    "$MINIMA_NPM_PREFIX" \
    "${MINIMA_NPM_SYMBOL}v${npm_version}" \
    "$MINIMA_NPM_SUFFIX"
}
