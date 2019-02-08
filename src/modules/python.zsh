MINIMA_PYTHON_PREFIX="${MINIMA_PYTHON_PREFIX="via "}"
MINIMA_PYTHON_SUFFIX="${MINIMA_PYTHON_SUFFIX=" "}"
MINIMA_PYTHON_SYMBOL="${MINIMA_PYTHON_SYMBOL="Python: "}"
MINIMA_PYTHON_COLOR="${MINIMA_PYTHON_COLOR="yellow"}"

minima_module_python() {
  [[ -n "$PYENV_VERSION" || -f .python-version || -f requirements.txt || -f pyproject.toml || -n *.py(#qN^/) ]] || return

  minima::is_exists pyenv || return

  local python_status=${$(pyenv version-name 2>/dev/null)//:/ }

  minima::module \
    "$MINIMA_PYTHON_COLOR" \
    "$MINIMA_PYTHON_PREFIX" \
    "${MINIMA_PYTHON_SYMBOL}${python_status}" \
    "$MINIMA_PYTHON_SUFFIX"
}
