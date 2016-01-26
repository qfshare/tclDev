" ========================================================================
" Set numbers at every line in your text content
" ========================================================================
function! FontSize(s)
if Mysys()=="win32"
  set guifont=Inconsolata:h`a:s`
elseif Mysys()=="unix"
  set guifont=Monospace\ `a:s`
elseif Mysys()=="mac"
  set guifont=Monospace\ `a:s`
endif

endfunction

function! CamShow()
set background=light
colorscheme solarized
if Mysys()=="win32"
  set guifont=Inconsolata:h20
elseif Mysys()=="unix"
  set guifont=Monospace\ 20
elseif Mysys()=="mac"
  set guifont=Monospace\ 20
endif
endfunction

function! Setnu()
%s/^/\t/
$
let ends=line(".")
let nums=1
1
while nums<=ends
let line=getline(".")
let line=substitute(line,$,nums,"")
call setline(".",line)
+
let nums=nums+1
endwhile
endfunction

" ==========================================================================
" Add the current time in the current place
" ==========================================================================
function! Addtime()
let curr_time=strftime("%c")
call append(line(".")-1,curr_time)
endfunction

" ==========================================================================
"Auto completion using the TAB key
"This function determines, wether we are on
"the start of the line text(then tab indents)
"or if we want to try auto completion
"===========================================================================
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction


function! DelLineByLine()
    let cur_line=line(".")
    if cur_line%2==1 
        d
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Last changeÓÃµ½µÄº¯Êý£¬·µ»ØÊ±¼ä£¬ÄÜ¹»×Ô¶¯µ÷ÕûÎ»ÖÃ  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
function! TimeStamp(...)  
    let sbegin = ''  
    let send = ''  
    let pend = ''  
    if a:0 >= 1  
        let sbegin = '' . a:1  
        let sbegin = substitute(sbegin, '*', '\\*', "g")  
        let sbegin = sbegin . '\s*'  
    endif  
    if a:0 >= 2  
        let send = '' . a:2  
        let pend = substitute(send, '*', '\\*', "g")  
    endif  
    let pattern = '  LastChange: .\+' . pend  
    "let pattern = 'LAST CHANGE: .\+' . pend  
    let pattern = '^\s*' . sbegin . pattern . '\s*$'  
    let now = strftime('%Y-%m-%d %H:%M:%S',localtime())  
  
    let row = search(pattern, 'n')  
    if row  == 0  
        let now = a:1 . '  LastChange:  ' . now . send  
        "let now = a:1 . 'LAST CHANGE:  ' . now . send  
        call append(2, now)  
    else  
        let curstr = getline(row)  
  
        let col = match( curstr , 'Last')  
        let now = a:1 . '  LastChange:  ' . now . send  
        "let now = a:1 . 'LAST CHANGE:  ' . now . send  
        call setline(row, now)  
    endif  
endfunction  
  
"" Last Change:  2010-07-29 18:50:39  
"au BufWritePre _vimrc call TimeStamp('" ')  
  
" * Last Change:  2010-07-29 18:50:39  
"au BufWritePre *.js,*.css call TimeStamp(' * ')  
  
"# Last Change:  2010-07-29 18:50:39  
"au BufWritePre *.rb,*.py,*.sh,*.tcl,*.icctl,*.pttl,*.dctl call TimeStamp('# ')
