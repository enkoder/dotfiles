#!/usr/bin/env zsh

set -e

DOTFILES=$HOME/.dotfiles

# Will remove existing fiiles/symlinks prior to symlinking
FORCE=$1

print_step "Creating symlinks"
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ ! -z $FORCE ] && [ -e $target ]; then
        printf "~${target#$HOME} already exists... Removing.\n"
        rm -f $target
    fi

    if [ -e $target ]; then
        printf "~${target#$HOME} already exists... Skipping.\n"
    else
        printf "Creating symlink for $file\n"
        ln -s $file $target
    fi
done


print_step  "installing to ~/.config"
if [ ! -d $HOME/.config ]; then
    printf "Creating ~/.config\n"
    mkdir -p $HOME/.config
fi

for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ ! -z $FORCE ] && [ -e $target ]; then
        printf "~${target#$HOME} already exists... Removing.\n"
        rm -f $target
    fi

    if [ -e $target ]; then
        printf "~${target#$HOME} already exists... Skipping.\n"
    else
        printf "Creating symlink for $config\n"
        ln -s $config $target
    fi
done

