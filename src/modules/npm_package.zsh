MINIMA_NPM_PACKAGE_ENABLE="${MINIMA_NPM_PACKAGE_ENABLE=true}"
MINIMA_NPM_PACKAGE_PREFIX="${MINIMA_PACKAGE_PACKAGE_PREFIX="is "}"
MINIMA_NPM_PACKAGE_SUFFIX="${MINIMA_PACKAGE_PACKAGE_SUFFIX=" "}"
MINIMA_NPM_PACKAGE_SYMBOL="${MINIMA_PACKAGE_PACKAGE_SYMBOL="📦 "}"
MINIMA_NPM_PACKAGE_COLOR="${MINIMA_PACKAGE_PACKAGE_COLOR="red"}"

minima_module_npm_package() {
  [[ $MINIMA_NPM_PACKAGE_ENABLE == false ]] && return

  local npm_package_version

  if [[ -f package.json ]] && minima::is_exists npm && minima::is_exists node; then
    npm_package_version=$(node -p "require('./package.json').version" 2> /dev/null)
  fi

  [[ -z $npm_package_version || "$npm_package_version" == "null" || "$npm_package_version" == "undefined" ]] && return

  minima::module \
    "$MINIMA_NPM_PACKAGE_COLOR" \
    "$MINIMA_NPM_PACKAGE_PREFIX" \
    "${MINIMA_NPM_PACKAGE_SYMBOL}v${npm_package_version}" \
    "$MINIMA_NPM_PACKAGE_SUFFIX"
}
