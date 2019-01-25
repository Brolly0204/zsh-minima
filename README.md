# Minima ZSH Theme

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

### Module `git`

Git section is consists with `git_branch` and `git_status` subsections. It is shown only in Git repositories.

| Variable            | Default |
| :------------------ | :-----: |
| `MINIMA_GIT_ENABLE` | `true`  |
| `MINIMA_GIT_PREFIX` | `on·`   |
| `MINIMA_GIT_SUFFIX` |         |
| `MINIMA_GIT_SYMBOL` |         |
| `MINIMA_GIT_COLOR`  | `white` |

#### Module `git_branch`

| Variable                   | Default   |
| :------------------------- | :-------: |
| `MINIMA_GIT_BRANCH_ENABLE` | `true`    |
| `MINIMA_GIT_BRANCH_PREFIX` |           |
| `MINIMA_GIT_BRANCH_SUFFIX` | ` `       |
| `MINIMA_GIT_BRANCH_SYMBOL` | ` `      |
| `MINIMA_GIT_BRANCH_COLOR`  | `magenta` |

#### Module `git_status`

| Variable                      | Default |
| :---------------------------- | :-----: |
| `MINIMA_GIT_STATUS_ENABLE`    | `true`  |
| `MINIMA_GIT_STATUS_PREFIX`    | `·[`    |
| `MINIMA_GIT_STATUS_SUFFIX`    | `]`     |
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

## License

MIT © [Eduard Nikolenko](https://github.com/eduardnikolenko)
