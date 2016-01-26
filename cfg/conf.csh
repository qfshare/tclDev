#!/bin/csh
# Check the dotfile directory.
set cur_dir=`pwd`
set scrdir=`dirname $0` ;
cd $scrdir ;
set dotdir=`pwd` ;
#set dotdir=`dirname $dotdir` ;

echo dot file directory is $dotdir

set myalias=`whoami`
set myfull=`fullnameofuser $myalias`

# Set the git configure user name and mail
set gitfold=$dotdir/gitfiles ;
cp $gitfold/gitconfig ~/gitconfig_tmp
find ~/gitconfig_tmp | xargs perl -pi -e "s/Lifeng Li/$myfull/"
find ~/gitconfig_tmp | xargs perl -pi -e "s/lfli/$myalias/"

echo "\nHi, $myfull\n"
echo "  INFO: Use Dot Files Used In: $gitfold"

# Copy and setup the dot files
cd ~
rm -fr .vim
ln -s $dotdir/vimfiles .vim

rm -fr .vimrc
ln -s $dotdir/vimfiles/myvim/vimrc .vimrc

rm -fr .gvimrc
ln -s $dotdir/vimfiles/myvim/gvimrc .gvimrc

rm -fr .viminfo
ln -s $dotdir/vimfiles/myvim/viminfo .viminfo

rm -fr .synopsys_dc.setup
ln -s $dotdir/edafiles/synopsys_dc.setup .synopsys_dc.setup
touch $dotdir/edafiles/user_dc.setup

rm -fr .synopsys_icc.tcl
ln -s $dotdir/edafiles/synopsys_icc.setup .synopsys_icc.tcl
touch $dotdir/edafiles/user_icc.setup

rm -fr .synopsys_icc2.tcl
ln -s $dotdir/edafiles/synopsys_icc.setup .synopsys_icc2.tcl
touch $dotdir/edafiles/user_icc2.setup

rm -fr .synopsys_pt.setup
ln -s $dotdir/edafiles/synopsys_pt.setup .synopsys_pt.setup
touch $dotdir/edafiles/user_pt.setup

rm -fr .screenrc
ln -s $dotdir/dotfiles/screenrc .screenrc

rm -fr .shell
ln -s $dotdir/shellfiles .shell

rm -fr .cshrc
ln -s $dotdir/shellfiles/cshrc .cshrc
touch $dotdir/shellfiles/user.cshrc

rm -fr .pshrc
ln -s $dotdir/shellfiles/pshrc .pshrc

rm -fr .psh
ln -s $dotdir/shellfiles/psh .psh

rm -fr .tclshrc
ln -s $dotdir/shellfiles/tclshrc .tclshrc

rm -fr .tmux.conf
ln -s $dotdir/tmuxfiles/tmux.conf .tmux.conf

rm -fr .tmux
ln -s $dotdir/tmuxfiles .tmux

rm -fr .tmux.theme.conf
ln -s $dotdir/tmuxfiles/tmux.theme.conf .tmux.theme.conf

rm -fr .zshrc
ln -s $dotdir/shellfiles/zshrc .zshrc

rm -fr .oh-my-zsh
ln -s $dotdir/shellfiles/oh-my-zsh .oh-my-zsh

rm -fr .gitconfig
mv ~/gitconfig_tmp .gitcofig

#rm -fr .unison
#cp -fr $cur_dir/unisonfiles .unison

rm -fr .netrc
rm -fr .netrc.bak
cp -fr $dotdir/dotfiles/netrc .netrc

rm -fr .gitignore*
ln -s $dotdir/gitfiles/gitignore .gitignore

rm -fr .Xdefault
ln -s $dotdir/dotfiles/Xdefault .Xdefault

rm -fr .Xresources
ln -s $dotdir/dotfiles/Xresources .Xresources

rm -fr .hgrc
ln -s $dotdir/dotfiles/hgrc .hgrc

# Source user.csh
touch $dotdir/user.csh
source $dotdir/user.csh

cd $cur_dir
echo "  INFO: Replace Dot Files Done"
echo "  INFO: Config Finish, source ~/.cshrc to load new configure."
