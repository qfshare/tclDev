# dotfiles

Linux dot configure files

Because of submodule usage, please add recursive to clone submodule at the same time.

    git clone --recursive https://github.com/xoit/dotfiles.git

Or if you want to update all the submodules and submodules in submodules. Use below command.

    git submodule foreach --recursive git submodule init
    git submodule foreach --recursive git submodule update

# Structure

Use a shell scirpt to manage the dot files.

And each tool has a folder, and all files listed in the folder.

Configure all the dot files using below command.

    ./conf.sh

## Sync up

If your server could not reach the internet. Here is a way.

 * A computer which could access your server and internet.
 * A virutal machine

Let's start.

 1. login to your virtual machine. I am using Virtual Box, which is free. And the software has GPL license.
 2. setup your git repository, sync with github or other git server on the internet.
 3. now you can make full use of open source material, like vim plugins or oh-my-zsh and etc.
 4. then copy all the latest file to your private git repository, which is syncing with your server.
 5. remove all .git* files in this submodule.
 6. sync the latest file with your own server.

# Shell
Main shrc is just an entrance to the .shell folder and the main configure settings are in the user.cshrc or user.zshrc and etc.

And user.shrc is empty to let you add more.

And current repository ignore all the files start with user*.

## cshell
All cshell recommended settings are not included in the repository.
### Recommended

## zshell
All cshell recommended settings are not included in the repository.
### Recommended

## tclsh

## psh

## bash

# Vim

And the setting of the plugins are in the vimrc files.

## plugins
 * http://github.com/vim-scripts/Align
 * http://github.com/vim-scripts/Auto-Parirs
 * http://github.com/vim-scripts/a.vim
 * http://github.com/vim-scripts/bufexplorer.zip
 * http://github.com/vim-scripts/ccvext.vim
 * http://github.com/vim-scripts/indentLine.vim
 * http://github.com/vim-scripts/Mark--Karkat
 * http://github.com/vim-scripts/minibufexplorerpp
 * http://github.com/vim-scripts/neocomplcache
 * http://github.com/scrooloose/nerdcommenter
 * http://github.com/scrooloose/nerdtree
 * http://github.com/vim-scripts/snipMate
 * http://github.com/vim-scripts/SrcExpl
 * http://github.com/vim-scripts/surround.vim
 * http://github.com/vim-scripts/Syntastic
 * http://github.com/vim-scripts/TxtBrowser
 * http://github.com/vim-airline/vim-airline
 * http://github.com/vimgineers/vim-hugefile
 * http://github.com/VundleVim/Vundle
 * http://github.com/vim-scripts/ZoomWin
 * https://github.com/mileszs/ack.vim
 * https://github.com/vim-scripts/AuthorInfo
 * https://github.com/vim-scripts/foldutil.vim
 * https://github.com/vim-scripts/genutils
 * https://github.com/vim-scripts/grep.vim
 * https://github.com/c9s/gsession.vim
 * https://github.com/vim-scripts/imaps.vim
 * https://github.com/jeetsukumaran/vim-markology
 * https://github.com/ervandew/supertab
 * https://github.com/Lokaltog/vim-powerline
 * https://github.com/stephenmckinney/vim-solarized-powerline
 * https://github.com/Shougo/neobundle.vim

## Theme
 * http://github.com/vim-scripts/Wombat
 * https://github.com/jdkanani/vim-material-theme
 * https://github.com/gosukiwi/vim-atom-dark
 * https://github.com/NLKNguyen/papercolor-theme
 * https://github.com/chriskempson/vim-tomorrow-theme


# Tmux

# Screen

# Ftp
