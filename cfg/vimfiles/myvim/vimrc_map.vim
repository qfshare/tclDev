nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

map <leader>s :source $VIM/vimrc.my<cr>

map <F12> :bn<cr>
map <F11> :bp<cr>
map <leader>bd :bdelete<cr>

map <leader>tn :tabnew%<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <leader>cd :cd %:p:h<cr>
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

map <leader>2html :source $VIMRUNTIME/syntax/2html.vim<cr>

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

imap <m-2> <esc>$a
imap <m-1> <esc>0i

vnoremap $1 <esc>`>a)<esc`<i(<esc>

map 0 ^
nmap <M-j> mz:m+<cr>`z
nmap <M-j> mz:m+<cr>`z


cnoremap $h e ~/

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
