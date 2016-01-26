"===== TDF Edit Functions ==================================================

" ==========================================================================
" TDF file: Swap the reference name between a and b line 
" ==========================================================================
function! Tdfedit_swapcell(a,b)
let astr=split(getline(a:a),' ')
let bstr=split(getline(a:b),' ')

let tstr=astr[1]
let astr[1]=bstr[1]
let bstr[1]=tstr

call setline(a:a,join(astr,' '))
call setline(a:b,join(bstr,' '))
endfunction

function! Tdfedit_swapcell2(a,b)
let aqr=split(a:a,',')
let bqr=split(a:b,',')
let cnum=1
while cnum<=line("$")
  let cstr=split(getline(cnum),' ')
  if len(cstr)>=4
    if ("\"".aqr[0]."\"")==cstr[2] && aqr[1]==cstr[3]
      let aline=cnum
    endif
    if ("\"".bqr[0]."\"")==cstr[2] && bqr[1]==cstr[3]
      let bline=cnum
    endif
  endif
  let cnum=cnum+1
endwhile
call Tdfedit_swapcell(aline,bline)
endfunction

" ==========================================================================
" TDF file: Prioritize the pad cells list
"
" left right top bottom & all
" ==========================================================================
function! Tdfedit_prioritize(padside)
let cnum=1
let snum=1
while cnum<=line("$")
  let cstr=split(getline(cnum),' ')
  if len(cstr)>=4
    if cstr[2] == "\"".a:padside."\""
      let cstr[3]=snum
      call setline(cnum,join(cstr,' '))
      let snum=snum+1
    endif
  endif
  let cnum=cnum+1
endwhile
endfunction

function! Tdfedit_prioritizeall()
call Tdfedit_prioritize("left")
call Tdfedit_prioritize("right")
call Tdfedit_prioritize("top")
call Tdfedit_prioritize("bottom")
endfunction

" ============================================================
" Add New pad cell
" ============================================================
function! Tdfedit_addnew(ref,edge)
call append(line("."),"pad"." \"".a:ref."\" \"".a:edge."\" 0")
endfunction

