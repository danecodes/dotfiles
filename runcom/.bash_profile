# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Shell

if [ -n "$ZSH_VERSION" ]; then
   SHELL_ZSH=true
   SHELL_BASH=false
elif [ -n "$BASH_VERSION" ]; then
   SHELL_BASH=true
   SHELL_ZSH=false
fi

# OS
OS="OSX"

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

#READLINK=$(which greadlink || which readlink)
if $SHELL_BASH; then
    CURRENT_SCRIPT=$BASH_SOURCE
else
    CURRENT_SCRIPT=$0
fi

DOTFILES_DIR="$HOME/.dotfiles"

# Finally we can source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function*,path,env,alias,completion,grep,prompt,custom}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.osx; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

#custom files for hulu
for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.hulu; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if $SHELL_BASH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.*.bash; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if $SHELL_ZSH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.*.zsh; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

# Set LSCOLORS

#eval "$(dircolors "$DOTFILES_DIR"/system/.dir_colors)"

# Hook for extra/custom stuff

EXTRA_DIR="$HOME/.extra"

if [ -d "$EXTRA_DIR" ]; then
    for EXTRAFILE in "$EXTRA_DIR"/runcom/*.sh; do
        [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
    done
fi

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export

export SHELL_BASH SHELL_ZSH OS DOTFILES_DIR EXTRA_DIR
