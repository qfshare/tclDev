"===== TDF Edit Functions ==================================================

" ==========================================================================
" TDF file: Swap the reference name between a and b line 
" ==========================================================================
function! AddNote(a,b)
  let curr_line=line(".")
  call append(curr_line   , "###########################################")
  call append(curr_line+1 , "### NoteID	20101012164601")
  call append(curr_line+2 , "### NoteType	Tool")
  call append(curr_line+3 , "### NoteVersion	1.0")
  call append(curr_line+4 , "### NoteRelate	Project")
  call append(curr_line+5 , "### NoteTitle	Buffer IO")
  call append(curr_line+6 , "### NoteEnd")
  call append(curr_line+7 , "###########################################")

endfunction


