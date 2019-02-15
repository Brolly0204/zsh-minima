MINIMA_GO_PREFIX="${MINIMA_GO_PREFIX="via "}"
MINIMA_GO_SUFFIX="${MINIMA_GO_SUFFIX=" "}"
MINIMA_GO_SYMBOL="${MINIMA_GO_SYMBOL="🐹 "}"
MINIMA_GO_COLOR="${MINIMA_GO_COLOR="cyan"}"

minima_module_go() {
  [[ -f go.mod || -d Godeps || -f glide.yaml || -n *.go(#qN^/) || -f Gopkg.yml || -f Gopkg.lock \
    || ( $GOPATH && "$PWD/" =~ "$GOPATH/" ) ]] || return

  minima::is_exists go || return

  local go_version=$(go version | awk '{ if ($3 ~ /^devel/) {print $3 ":" substr($4, 2)} else {print "v" substr($3, 3)} }')

  minima::module \
    "$MINIMA_GO_COLOR" \
    "$MINIMA_GO_PREFIX" \
    "${MINIMA_GO_SYMBOL}v${go_version}" \
    "$MINIMA_GO_SUFFIX"
}
