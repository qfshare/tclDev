
" Tcl
"=========================================================================
function! Tcl_proc()
  let curr_line=line(".")
  call append(curr_line   , "#----------------------------------------")
  call append(curr_line+1 , "# Description:")
  call append(curr_line+2 , "#----------------------------------------")
  call append(curr_line+3 , "proc pName { args {_debug 0}} {")
  call append(curr_line+4 , " ")
  call append(curr_line+5 , " ")
  call append(curr_line+6 , " ")
  call append(curr_line+7 , " ")
  call append(curr_line+8 , "##--------------------")
  call append(curr_line+9 , "## debug and return")
  call append(curr_line+10, "##--------------------")
  call append(curr_line+11, " if (_debug) {")
  call append(curr_line+12, "   puts")
  call append(curr_line+13, " } else {")
  call append(curr_line+14, "   return")
  call append(curr_line+15, " }")
  call append(curr_line+16, "}")
endfunction

" =======================================================================
" Perl
" =======================================================================
function! Perl_sub()
  let curr_line=line(".")
  call append(curr_line   , "#----------------------------------------")
  call append(curr_line+1 , "# Description:")
  call append(curr_line+2 , "#----------------------------------------")
  call append(curr_line+3 , "proc pName { args {_debug 0}} {")
  call append(curr_line+4 , " ")
  call append(curr_line+5 , " ")
  call append(curr_line+6 , " ")
  call append(curr_line+7 , " ")
  call append(curr_line+8 , "end sub")
endfunction

" =======================================================================
" Vimscript
" =======================================================================
function! Vimscript_traversalalllines()
let cline=line(".")
call append(cline  ,"let cnum=1")
call append(cline+1,"while cnum<=line(\"$\")")
call append(cline+2,"  \"Your Function Here")
call append(cline+3,"  \"cnum is the current line number")
call append(cline+4,"  let cnum=cnum+")
call append(cline+5,"endwhile")
endfunction

function! Vimscript_sectioncomments()
  let curr_line=line(".")
  call append(curr_line   , "#---------------------------------------------------------------------------------------")
  call append(curr_line+1 , "# Desc: ")
  call append(curr_line+2 , "#---------------------------------------------------------------------------------------")
  let gotoLn=curr_line+2
  exe 'normal '.gotoLn.'G'
  startinsert!
endfunction

function! Vimscript_proccomments()
  let curr_line=line(".")
  call append(curr_line   , "#=== PROC ==============================================================================")
  call append(curr_line+1 , "# Desc: ")
  call append(curr_line+2 , "#=======================================================================================")
" call append(curr_line+3 , "proc pName {args} {")
" call append(curr_line+4 , " ")
" call append(curr_line+5 , " ")
" call append(curr_line+6 , " ")
" call append(curr_line+7 , " ")
" call append(curr_line+8, "}")
  let gotoLn=curr_line+2
  exe 'normal '.gotoLn.'G'
  startinsert!
endfunction
command! -nargs=0 VimscriptSectionComments :call Vimscript_sectioncomments()
command! -nargs=0 VimscriptProcComments :call Vimscript_proccomments()
nmap <F5> :VimscriptSectionComments<cr>
nmap <F6> :VimscriptProcComments<cr>

function! Checklist_Template()
  let curr_line=line(".")
  call append(curr_line   , "# {{{ <flag: -lfli>")
  call append(curr_line+1 , "set Utility_CmdStr( ) {")
  call append(curr_line+2 , "\#\#\#\#\# input interactive with CheckList Utility")
  call append(curr_line+3 , "  if {[my_check_var Utility_DB(conf,name) -nomsg]==\"CheckList\"} {")
  call append(curr_line+4 , "    set Utility_DB(tvar,output_dir) $Utility_DB(conf,orgdir) ;")
  call append(curr_line+5 , "    set Utility_DB(tvar,myscr_dir) $Utility_DB(conf,myexec_location) ;")
  call append(curr_line+6 , "  } elseif {[my_check_var Utility_DB(conf,name) -nomsg]==\"OtherUtility\"} {")
  call append(curr_line+7 , "    puts \"OtherUtility setting\" ;")
  call append(curr_line+8, "  } else {")
  call append(curr_line+9 , "    set Utility_DB(tvar,output_data) ./dataout ;")
  call append(curr_line+10 , "    set Utility_DB(tvar,myscr_dir) ./scr ;")
  call append(curr_line+11 , "  }")
  call append(curr_line+12 , "\# main function start")
  call append(curr_line+13 , "")
  call append(curr_line+14 , "")
  call append(curr_line+15 , "")
  call append(curr_line+16 , "\# main function end")
  call append(curr_line+17 , "\#\#\#\#\# output interactive with CheckList Utility  ")
  call append(curr_line+18 , "  if {[my_check_var Utility_DB(conf,name)]==\"CheckList\"} {")
  call append(curr_line+19 , "    save_checklist_data -flag    \" \" \\")
  call append(curr_line+20 , "                        -status  \"none\" \\")
  call append(curr_line+21 , "                        -comment \" \" ;")
  call append(curr_line+22 , "    save_checklist_data -tofile ;")
  call append(curr_line+23 , "  }")
  call append(curr_line+24 , "}")
  call append(curr_line+25 , "# }}}")
  let gotoLn=curr_line+1
  exe 'normal '.gotoLn.'G'
  startinsert!
endfunction
command! -nargs=0 ChecklistTemplate :call Checklist_Template()
nmap <F7> :ChecklistTemplate<cr>


