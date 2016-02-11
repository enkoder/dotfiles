#!/bin/bash

print_step() {
    name=$(basename $0)
    printf "\n\e[1;35m$name: $1\e[0m\n"
}

print_warning() {
    printf "\e[1;33m$1\e[0m\n"
}

print_error() {
    printf "\n\e[1;31mError: $1\e[0m\n"
}

print_usage() {
    print_warning "Usage: install.sh [-f]"
}

print_step "Installing dotfiles"
if [ ! -z "$1" ]; then
    if [ "$1" = '-f' ]; then
        FORCE_LINK=true
        print_warning "Removing and linking exisiting files!"
    else
        print_usage
    fi
else
    FORCE_LINK=
fi


print_step "Linking all dotfiles"
source install/link.sh $FORCE_LINK

if [ ! -d ~/.vim-tmp ]; then
    print_step "creating vim directories"
    mkdir -p ~/.vim-tmp
fi

print_step "Configuring zsh as default shell"
chsh -s $(which zsh)

print_step "Done"

