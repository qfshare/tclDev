set vim_plugin_list {
  https://github.com/vim-scripts/Align
  https://github.com/vim-scripts/Auto-Pairs
  https://github.com/vim-scripts/a.vim
  https://github.com/vim-scripts/bufexplorer.zip
  https://github.com/vim-scripts/ccvext.vim
  https://github.com/Yggdroot/indentLine
  https://github.com/vim-scripts/Mark--Karkat
  https://github.com/vim-scripts/minibufexplorerpp
  https://github.com/vim-scripts/neocomplcache
  https://github.com/scrooloose/nerdcommenter
  https://github.com/scrooloose/nerdtree
  https://github.com/vim-scripts/snipMate
  https://github.com/vim-scripts/SrcExpl
  https://github.com/vim-scripts/surround.vim
  https://github.com/vim-scripts/Syntastic
  https://github.com/vim-scripts/TxtBrowser
  https://github.com/vim-airline/vim-airline
  https://github.com/vimgineers/vim-hugefile
  https://github.com/VundleVim/Vundle.vim
  https://github.com/vim-scripts/ZoomWin
  https://github.com/mileszs/ack.vim
  https://github.com/vim-scripts/AuthorInfo
  https://github.com/vim-scripts/foldutil.vim
  https://github.com/vim-scripts/genutils
  https://github.com/vim-scripts/grep.vim
  https://github.com/c9s/gsession.vim
  https://github.com/vim-scripts/imaps.vim
  https://github.com/jeetsukumaran/vim-markology
  https://github.com/ervandew/supertab
  https://github.com/Lokaltog/vim-powerline
  https://github.com/stephenmckinney/vim-solarized-powerline
  https://github.com/Shougo/neobundle.vim
}

set vim_theme_list {
  https://github.com/vim-scripts/Wombat
  https://github.com/jdkanani/vim-material-theme
  https://github.com/gosukiwi/vim-atom-dark
  https://github.com/NLKNguyen/papercolor-theme
  https://github.com/chriskempson/vim-tomorrow-theme

}

set sh_list {
  https://github.com/robbyrussell/oh-my-zsh
  https://github.com/gnp/psh
}

set tmux_list {
  http://github.com/tmux-plugins/tpm
  http://github.com/tmux-plugins/tmux-sensible
  http://github.com/tmux-plugins/tmux-sidebar
}

set start_itm Align ;
set start 1 ;

set bundle_dir vimfiles/bundle ;
foreach itm [concat $vim_plugin_list $vim_theme_list] {
  if {[regexp $start_itm $itm]} {set start 1}
  puts [file tail $itm]
  if {$start==0} {continue}
  exec git submodule add --force ${itm}.git $bundle_dir/[file tail $itm] ;
}

set sh_dir shellfiles
foreach itm [concat $sh_list] {
  if {[regexp $start_itm $itm]} {set start 1}
  puts [file tail $itm]
  if {$start==0} {continue}
  exec git submodule add --force ${itm}.git $sh_dir/[file tail $itm] ;
}

set tmux_dir tmuxfiles
foreach itm [concat $tmux_list] {
  if {[regexp $start_itm $itm]} {set start 1}
  puts [file tail $itm]
  if {$start==0} {continue}
  exec git submodule add --force ${itm}.git $tmux_dir/plugins/[file tail $itm] ;
}

