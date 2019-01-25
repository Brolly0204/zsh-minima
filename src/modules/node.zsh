MINIMA_NODE_ENABLE="${MINIMA_NODE_ENABLE=true}"
MINIMA_NODE_PREFIX="${MINIMA_NODE_PREFIX="via "}"
MINIMA_NODE_SUFFIX="${MINIMA_NODE_SUFFIX=" "}"
MINIMA_NODE_SYMBOL="${MINIMA_NODE_SYMBOL="⬢ "}"
MINIMA_NODE_COLOR="${MINIMA_NODE_COLOR="green"}"

minima_module_node() {
  [[ $MINIMA_NODE_ENABLE == false ]] && return

  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return

  local node_version

  if minima::is_exists nvm; then
    node_version=$(nvm current 2>/dev/null)
    [[ $node_version == "system" || $node_version == "node" ]] && return
  elif minima::is_exists nodenv; then
    node_version=$(nodenv version-name)
    [[ $node_version == "system" || $node_version == "node" ]] && return
  elif minima::is_exists node; then
    node_version=$(node -v 2>/dev/null)
  else
    return
  fi

  [[ $node_version == "" ]] && return

  minima::module \
    "$MINIMA_NODE_COLOR" \
    "$MINIMA_NODE_PREFIX" \
    "${MINIMA_NODE_SYMBOL}${node_version}" \
    "$MINIMA_NODE_SUFFIX"
}
