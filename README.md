# Minima ZSH Theme

![Screenshot](screenshot.png)

## Installation

### [oh-my-zsh]

Clone this repo:

```zsh
git clone https://github.com/eduardnikolenko/minima.git "$ZSH_CUSTOM/themes/minima"
```

Symlink `minima.zsh-theme` to your oh-my-zsh custom themes directory:

```zsh
ln -s "$ZSH_CUSTOM/themes/minima/minima.zsh-theme" "$ZSH_CUSTOM/themes/minima.zsh-theme"
```

Set `ZSH_THEME="minima"` in your `.zshrc`

## Customization

### Order

```zsh
MINIMA_PROMPT_ORDER=(
  user
  host
  dir
  git
  node
  npm
  php
  python
  docker
  exec_time
  line_sep
  jobs
  exit_code
  char
)
```

### Module `char`

| Variable                    | Default |
| :-------------------------- | :-----: |
| `MINIMA_CHAR_PREFIX`        |         |
| `MINIMA_CHAR_SUFFIX`        |         |
| `MINIMA_CHAR_SYMBOL`        | `❯❯❯ `  |
| `MINIMA_CHAR_COLOR_SUCCESS` | `green` |
| `MINIMA_CHAR_COLOR_FAILURE` | `red`   |

### Module `dir`

| Variable            | Default |
| :------------------ | :-----: |
| `MINIMA_DIR_PREFIX` | `at `   |
| `MINIMA_DIR_SUFFIX` |         |
| `MINIMA_DIR_COLOR`  | `cyan`  |

### Module `docker`

| Variable                | Default |
| :---------------------- | :-----: |
| `MINIMA_DOCKER_PREFIX`  | `on `   |
| `MINIMA_DOCKER_SUFFIX`  |         |
| `MINIMA_DOCKER_SYMBOL`  | `🐳 `    |
| `MINIMA_DOCKER_COLOR`   | `blue`  |
| `MINIMA_DOCKER_VERBOSE` | `false` |

### Module `exec_time`

| Variable                  | Default  |
| :------------------------ | :------: |
| `MINIMA_EXEC_TIME_PREFIX` | `took `  |
| `MINIMA_EXEC_TIME_SUFFIX` |          |
| `MINIMA_EXEC_TIME_COLOR`  | `yellow` |

### Module `exit_code`

| Variable                  | Default |
| :------------------------ | :-----: |
| `MINIMA_EXIT_CODE_PREFIX` |         |
| `MINIMA_EXIT_CODE_SUFFIX` |         |
| `MINIMA_EXIT_CODE_SYMBOL` | `✘`     |
| `MINIMA_EXIT_CODE_COLOR`  | `red`   |

### Module `git`

Git section is consists with `git_branch` and `git_status` subsections. It is shown only in Git repositories.

| Variable            | Default |
| :------------------ | :-----: |
| `MINIMA_GIT_PREFIX` | `on `   |
| `MINIMA_GIT_SUFFIX` |         |
| `MINIMA_GIT_SYMBOL` |         |
| `MINIMA_GIT_COLOR`  | `white` |

#### Module `git_branch`

| Variable                   | Default   |
| :------------------------- | :-------: |
| `MINIMA_GIT_BRANCH_PREFIX` |           |
| `MINIMA_GIT_BRANCH_SUFFIX` |           |
| `MINIMA_GIT_BRANCH_SYMBOL` | ` `      |
| `MINIMA_GIT_BRANCH_COLOR`  | `magenta` |

#### Module `git_status`

| Variable                      | Default |
| :---------------------------- | :-----: |
| `MINIMA_GIT_STATUS_PREFIX`    | ` [`    |
| `MINIMA_GIT_STATUS_SUFFIX`    | `] `    |
| `MINIMA_GIT_STATUS_COLOR`     | `red`   |
| `MINIMA_GIT_STATUS_UNTRACKED` | `?`     |
| `MINIMA_GIT_STATUS_ADDED`     | `+`     |
| `MINIMA_GIT_STATUS_MODIFIED`  | `!`     |
| `MINIMA_GIT_STATUS_RENAMED`   | `»`     |
| `MINIMA_GIT_STATUS_DELETED`   | `✘`     |
| `MINIMA_GIT_STATUS_STASHED`   | `$`     |
| `MINIMA_GIT_STATUS_UNMERGED`  | `=`     |
| `MINIMA_GIT_STATUS_AHEAD`     | `⇡`     |
| `MINIMA_GIT_STATUS_BEHIND`    | `⇣`     |

### Module `go`

| Variable           | Default |
| :----------------- | :-----: |
| `MINIMA_GO_PREFIX` | `via `  |
| `MINIMA_GO_SUFFIX` |         |
| `MINIMA_GO_SYMBOL` | `🐹 `    |
| `MINIMA_GO_COLOR`  | `cyan`  |

### Module `host`

| Variable             | Default |
| :------------------- | :-----: |
| `MINIMA_HOST_PREFIX` | `at `   |
| `MINIMA_HOST_SUFFIX` |         |
| `MINIMA_HOST_COLOR`  | `blue`  |

### Module `jobs`

| Variable             | Default |
| :------------------- | :-----: |
| `MINIMA_JOBS_PREFIX` |         |
| `MINIMA_JOBS_SUFFIX` |         |
| `MINIMA_JOBS_SYMBOL` | `✦`     |
| `MINIMA_JOBS_COLOR`  | `blue`  |

### Module `line_sep`

### Module `node`

| Variable             | Default |
| :------------------- | :-----: |
| `MINIMA_NODE_PREFIX` | `via `  |
| `MINIMA_NODE_SUFFIX` |         |
| `MINIMA_NODE_SYMBOL` | `⬢ `    |
| `MINIMA_NODE_COLOR`  | `green` |

### Module `npm`

| Variable            | Default |
| :------------------ | :-----: |
| `MINIMA_NPM_PREFIX` | `with ` |
| `MINIMA_NPM_SUFFIX` |         |
| `MINIMA_NPM_SYMBOL` | `𝕟𝕡𝕞 ` |
| `MINIMA_NPM_COLOR`  | `red`   |

### Module `npm_package`

| Variable                    | Default |
| :-------------------------- | :-----: |
| `MINIMA_NPM_PACKAGE_PREFIX` | `is `   |
| `MINIMA_NPM_PACKAGE_SUFFIX` |         |
| `MINIMA_NPM_PACKAGE_SYMBOL` | `📦 `    |
| `MINIMA_NPM_PACKAGE_COLOR`  | `red`   |

### Module `php`

| Variable            | Default |
| :------------------ | :-----: |
| `MINIMA_PHP_PREFIX` | `via `  |
| `MINIMA_PHP_SUFFIX` |         |
| `MINIMA_PHP_SYMBOL` | `🐘 `    |
| `MINIMA_PHP_COLOR`  | `blue`  |

### Module `python`

| Variable               | Default    |
| :--------------------- | :--------: |
| `MINIMA_PYTHON_PREFIX` | `via `     |
| `MINIMA_PYTHON_SUFFIX` |            |
| `MINIMA_PYTHON_SYMBOL` | `🐍 `       |
| `MINIMA_PYTHON_COLOR`  | `yellow`   |

### Module `user`

| Variable             | Default  |
| :------------------- | :------: |
| `MINIMA_USER_PREFIX` |          |
| `MINIMA_USER_SUFFIX` |          |
| `MINIMA_USER_COLOR`  | `yellow` |

## License

MIT © [Eduard Nikolenko](https://github.com/eduardnikolenko)
