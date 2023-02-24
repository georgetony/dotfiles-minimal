# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Function to check if current user is root
is_user_root () { [ "$(id -u)" -eq 0 ]; } 

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) to UNLIMITED
HISTSIZE=
HISTFILESIZE=
HISTTIMEFORMAT="%F %r "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[38;2;0;150;0m\]\u@\h\[\033[00m\]:\[\033[38;2;0;0;255m\]\w\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w '
fi

# Change to red if the current user is root
if is_user_root; then
    PS1="\[\e[01;31m\]\e[00m\]"
    PS1='\[\033[38;2;255;0;0m\]\u@\h\[\033[00m\]:\[\033[38;2;0;0;255m\]\w\[\033[00m\] \$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Tony added the following to set some aliases.
alias la='ls -lah'
alias lah='ls -lah'
alias latr='ls -lahtr'
alias ..='cd ..'
alias gc='git commit'
alias gl='git log'
alias gs='git status'
alias gaa='git add --all'

# This will print a tree of the current folder
alias tree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g"'


# Aliases for Tmux
alias tma='tmux attach -d -t '
alias tml='tmux list-sessions'
alias tmn='tmux -2 new -s '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Copy current directory to clipboard
alias cpwd="pwd | xclip -selection clipboard"

# Display current git branch on prompt.
# Save prompt so far to a temp variable
PS1_TEMP=$PS1

function parse_git_branch() {
    local branch
    branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
    if [ -n "$branch" ]; then
        if git diff-index --quiet HEAD --; then
            echo "\[\e[32m\]($branch)\[\e[0m\]"
        else
            echo "\[\e[31m\]($branch)\[\e[0m\]"
        fi
    fi
}
PROMPT_COMMAND='PS1="$PS1_TEMP$(parse_git_branch) $ "'
# End of git branch on prompt

export DISPLAY=:0
export PATH=$PATH:/sbin
# Adding location of snap packages
export PATH=$PATH:/snap/bin
# Adding /home/olimex/.local/bin to path. This is used by PIP
export PATH=$PATH:~/.local/bin

# For NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# For Rust and Cargo?
. "$HOME/.cargo/env"
