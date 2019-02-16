MINIMA_NPM_PACKAGE_PREFIX="${MINIMA_PACKAGE_PACKAGE_PREFIX="is "}"
MINIMA_NPM_PACKAGE_SUFFIX="${MINIMA_PACKAGE_PACKAGE_SUFFIX=" "}"
MINIMA_NPM_PACKAGE_SYMBOL="${MINIMA_PACKAGE_PACKAGE_SYMBOL="📦 "}"
MINIMA_NPM_PACKAGE_COLOR="${MINIMA_PACKAGE_PACKAGE_COLOR="red"}"

minima_module_npm_package() {
  [[ -f package.json ]] || return
  minima::is_exists node || return
  minima::is_exists npm || return

  local npm_package_version=$(node -p "require('./package.json').version || ''" 2> /dev/null)

  [[ $npm_package_version == "" ]] && return

  minima::module \
    "$MINIMA_NPM_PACKAGE_COLOR" \
    "$MINIMA_NPM_PACKAGE_PREFIX" \
    "${MINIMA_NPM_PACKAGE_SYMBOL}${npm_package_version}" \
    "$MINIMA_NPM_PACKAGE_SUFFIX"
}
