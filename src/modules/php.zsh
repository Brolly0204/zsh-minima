MINIMA_PHP_ENABLE="${MINIMA_PHP_ENABLE=true}"
MINIMA_PHP_PREFIX="${MINIMA_PHP_PREFIX="via "}"
MINIMA_PHP_SUFFIX="${MINIMA_PHP_SUFFIX=" "}"
MINIMA_PHP_SYMBOL="${MINIMA_PHP_SYMBOL="PHP: "}"
MINIMA_PHP_COLOR="${MINIMA_PHP_COLOR="blue"}"

minima_module_php() {
  [[ $MINIMA_PHP_ENABLE == false ]] && return

  [[ -n *.php(#qN^/) || -f composer.json ]] || return

  minima::is_exists php || return

  local php_version=$(php -v 2>&1 | grep --color=never -oe "^PHP\s*[0-9.]\+" | awk '{print $2}')

  minima::module \
    "$MINIMA_PHP_COLOR" \
    "$MINIMA_PHP_PREFIX" \
    "${MINIMA_PHP_SYMBOL}v${php_version}" \
    "$MINIMA_PHP_SUFFIX"
}
