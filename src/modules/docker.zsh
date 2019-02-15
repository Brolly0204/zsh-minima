MINIMA_DOCKER_PREFIX="${MINIMA_DOCKER_PREFIX="on "}"
MINIMA_DOCKER_SUFFIX="${MINIMA_DOCKER_SUFFIX=" "}"
MINIMA_DOCKER_SYMBOL="${MINIMA_DOCKER_SYMBOL="🐳 "}"
MINIMA_DOCKER_COLOR="${MINIMA_DOCKER_COLOR="blue"}"
MINIMA_DOCKER_VERBOSE="${MINIMA_DOCKER_VERBOSE=false}"

minima_module_docker() {
  [[ -f Dockerfile || -f docker-compose.yml ]] || return

  minima::is_exists docker || return

  local compose_exists=false
  if [[ -n "$COMPOSE_FILE" ]]; then
    local separator=${COMPOSE_PATH_SEPARATOR:-":"}
    local filenames=("${(@ps/$separator/)COMPOSE_FILE}")

    for filename in $filenames; do
      if [[ ! -f $filename ]]; then
        compose_exists=false
        break
      fi
      compose_exists=true
    done

    [[ "$compose_exists" == false ]] && return
  fi

  [[ "$compose_exists" == true ]] || return

  local docker_version=$(docker version -f "{{.Server.Version}}" 2>/dev/null)
  [[ -z $docker_version ]] && return

  [[ $MINIMA_DOCKER_VERBOSE == false ]] && docker_version=${docker_version%-*}

  if [[ -n $DOCKER_MACHINE_NAME ]]; then
    docker_version+=" via ($DOCKER_MACHINE_NAME)"
  fi

  minima::module \
    "$MINIMA_DOCKER_COLOR" \
    "$MINIMA_DOCKER_PREFIX" \
    "${MINIMA_DOCKER_SYMBOL}v${docker_version}" \
    "$MINIMA_DOCKER_SUFFIX"
}
