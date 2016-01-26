if sys=="win32"
  source $VIM/vimfiles/myvim/funs_common.vim
  source $VIM/vimfiles/myvim/funs_tdf.vim
  source $VIM/vimfiles/myvim/funs_script.vim
  source $VIM/vimfiles/myvim/funs_note.vim
elseif sys=="unix"
  source ~/.vim/myvim/funs_common.vim
  source ~/.vim/myvim/funs_tdf.vim
  source ~/.vim/myvim/funs_script.vim
  source ~/.vim/myvim/funs_note.vim
elseif sys=="mac"
  source ~/vimfiles/myvim/funs_common.vim
  source ~/vimfiles/myvim/funs_tdf.vim
  source ~/vimfiles/myvim/funs_script.vim
  source ~/vimfiles/myvim/funs_note.vim
endif



" =======================================================================
" Common Function
" =======================================================================
" add the line number at the beginning of every line
command! Setnu   :call Setnu()
" add the time to the current line
command! Addtime :call Addtime()

" =======================================================================
" Script Convenint
" =======================================================================
" create the Tcl proc syntax
command! Tclproc :call Tcl_proc()
" create the Perl sub syntax
command! Perlsub :call Perl_sub()
" Vimscript which create the Traversal-All-Lines script
command! VimSTAL call Vimscript_traversalalllines()

" =======================================================================
" Tdf Editor Command
" =======================================================================
command! -nargs=+ -complete=command TdfSC  call Tdfedit_swapcell(<f-args>)
command! -nargs=+ -complete=command TdfSC2 call Tdfedit_swapcell2(<f-args>)
command! -nargs=+ -complete=command TdfAN  call Tdfedit_addnew(<f-args>)
command! TdfPL call Tdfedit_prioritize("left")
command! TdfPR call Tdfedit_prioritize("right")
command! TdfPT call Tdfedit_prioritize("top")
command! TdfPB call Tdfedit_prioritize("bottom")
command! TdfPA call Tdfedit_prioritizeall()



