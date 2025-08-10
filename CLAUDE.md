# CLAUDE.md - Dotfiles Repository Context

## Project Overview
This is a minimal dotfiles repository designed for Ubuntu/Debian servers and development environments. It provides essential configurations for bash, Vim, and tmux with a focus on developer productivity.

## Installation Method
The repository uses a symlink-based approach via `makesymlinks.sh`:
- Backs up existing dotfiles to `~/dotfiles_old`
- Creates symlinks from home directory to this repository
- Manages: `.bashrc`, `.profile`, `.vim`, `.vimrc`, `.tmux.conf`

## Key Components

### Bash Configuration (.bashrc)
- **Prompt**: Color-coded with git branch status (green=clean, red=dirty)
- **History**: Unlimited with timestamps, no duplicates
- **Aliases**: Git shortcuts (gc, gs, gl), tmux helpers (tma, tmn, tml), navigation aids
- **Integration**: NVM, Claude CLI, custom PATH additions

### Vim Configuration (.vimrc)
- **Leader**: Comma (,)
- **Plugins**: CtrlP, NERDTree, vim-surround, copilot.vim, taglist
- **Features**: Relative line numbers, no swap files, smart indentation (4 spaces)
- **Key mappings**: ,w (save), ,h/j/k/l (window nav), F3 (buffer toggle)

### Tmux Configuration (.tmux.conf)
- **Prefix**: Default Ctrl-b
- **Navigation**: Vim-style pane movement (h/j/k/l)
- **Splits**: V (vertical), H (horizontal) - inherit current directory
- **Features**: 256-color support, UTF-8, window cycling with Ctrl+arrows

## Development Workflow
1. Git integration in bash prompt shows repository status
2. Vim configured for efficient code editing with plugins
3. Tmux enables persistent terminal sessions
4. Aliases streamline common operations

## Testing/Linting Commands
No specific test or lint commands found in the repository. Ask user for preferred commands if needed.

## Important Notes
- Repository uses vim-plug for Vim plugin management
- IntelliJ IDEA Vim support via .ideavimrc
- DISPLAY=:99 set for headless testing (Xvfb/Playwright)
- Safe installation preserves existing configurations

## Repository Structure
```
dotfiles/
├── .bashrc           # Shell configuration and aliases
├── .vimrc            # Vim editor configuration
├── .tmux.conf        # Terminal multiplexer configuration
├── .profile          # Shell profile (sources .bashrc)
├── .ideavimrc        # IntelliJ IDEA Vim configuration
├── .gitignore        # Git ignore rules
├── .vim/             # Vim plugins and configurations
├── README.md         # Installation instructions
└── makesymlinks.sh   # Installation script
```