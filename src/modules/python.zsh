MINIMA_PYTHON_PREFIX="${MINIMA_PYTHON_PREFIX="via "}"
MINIMA_PYTHON_SUFFIX="${MINIMA_PYTHON_SUFFIX=" "}"
MINIMA_PYTHON_SYMBOL="${MINIMA_PYTHON_SYMBOL="🐍 "}"
MINIMA_PYTHON_COLOR="${MINIMA_PYTHON_COLOR="yellow"}"

minima_module_python() {
  [[ -f .python-version || -f requirements.txt || -f pyproject.toml || -n *.py(#qN^/) ]] || return
  minima::is_exists python || return

  local python_version=$(python --version 2>/dev/null | awk '{print $2}')

  minima::module \
    "$MINIMA_PYTHON_COLOR" \
    "$MINIMA_PYTHON_PREFIX" \
    "${MINIMA_PYTHON_SYMBOL}${python_version}" \
    "$MINIMA_PYTHON_SUFFIX"
}
