# enkoders dotfiles

This repo contains all of my important dotfiles that configures
my development environment. I realize I have gone full neckbeard
by running Arch and using vim as my editor but it rally has forced
me to stop being lazy and become a better programmer.

## cloning
I prefer to clone this repo into a dotfile like folder so it doesn't
clutter my home directory.

```
git clone https://github.com/enkoder/dotfiles ~/.dotfiles
cd .dotfiles
```

## Installing

Installing is easy, just run the folowing command
```
./insall.sh [force]
```

This script will clone any necessary repos, run the link.sh script, and change
my shell to the beloved zsh. By adding `force` as a param any symlink or file will
be removed as the install script is traversing repo.

## install/link.sh
This script will traverse through this repo finding any files that end in .symlink.
These files then get symlinked to my HOME directory which makes esiting and improving these
files very easy. For example if I need to make a change in my init.vim script, I make the changes
in dotfiles repo and source the file again in vim and the change will be reflected in vim.

## config folder
Config behaves differently than the symlink files because I want to maintain the folder structure.
So I symlink ALL folders in config instead of the files.



