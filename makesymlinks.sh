#!/usr/bin/env bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

DIR="$HOME/dotfiles"                    # dotfiles directory
OLDDIR="$HOME/dotfiles_old"             # old dotfiles backup directory
files=".vimrc .vim"                 # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $OLDDIR"
    if [ -e $file ]; then
        echo "    moving $file"
        mv $file "$OLDDIR"
    else
        echo "    not moving nonexistent $file"
    fi
    echo "Creating symlink to $file in home directory."
    rm -f $HOME/$file && ln -s {$DIR,$HOME}/$file
done
