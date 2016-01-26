"=========================================
"       __|__        |            |      
"   \   __|__     ---|---       \ | /    
"      ___|___   ____|____   |---------| 
"   \  |-----|       |       |  |---|  | 
"      | --- |  -----|-----  |  |___|  | 
"   /  | ---_|       |       |        _| 
"                                         
"         http://www.qfshare.com         
"=========================================
"  by lilfieng < leelifeng at gmail.com >
"  version 1.0                            
"  last change 23/12/10 16:33:46 
"=========================================
winpos 235 235
set lines=25 columns=108
colo peachpuff
set autoindent 
"-----------------------------------------
" General setting
"-----------------------------------------
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" = compatible with vi
set nocompatible

" = keep 50 history
set history=50

" = fix bs in vim
set bs=2

" = filetype plugin enabled
filetype plugin on
" = indent setting
filetype indent on
" = atuto load the file when changed
set autoread

" = use mouse when in term
set mouse=a

" = map the shortcut key beginner
let mapleader =","
let g:mapleader =","

" = Statusline
set scrolloff=7
set laststatus=2
"set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c
set statusline=\%F%m%r%h\ %w\ \ \ Line:\ %l/%L:%c

"-------Window and ColorScheme------
if has("gui_running")
  set guioptions-=m "To Remove menubar
  set guioptions-=T  "To  Remove toolbar
 "set guioptions-=r "To Remove v_scroll bar 

 "colorscheme github
  colorscheme wombat
 "colorscheme CodeFactoryv3
 "colorscheme ego
 "colorscheme trogdor
  set guifont=Monospace\ 14
 "set gfn=:h16

else 
  "set background=#c7edcc
  colorscheme wombat
endif

" = Syntax Enable
syntax enable
syntax on


autocmd bufenter * :syntax sync fromstart

"if has("gui_running")
"  set cursorline
"  hi cursorline guibg=#333333
"  set cursorcolumn
"  hi cursorcolumn guibg=#333333
"endif

" = FileFormats
set ffs=unix,dos,mac

" = buffer
try
  set switchbuf=usetab
  set showtabline=2
catch
endtry

" = backups
set nobackup
set nowritebackup
set noswapfile

" = fix the backspace
set backspace=eol,start,indent

" = line break
set linebreak
set textwidth=0

" = wrap
set wrap

" = abbreve menu
set completeopt=menu

" = map and abbrev files for vim
" == iabc command to delete all abbrevs in insert mode
if Mysys()=="win32"
  source $VIM/vimfiles/myvim/vimrc_map.vim
  source $VIM/vimfiles/myvim/vimrc_abbrev.vim
elseif Mysys()=="unix"
  source ~/.vim/myvim/vimrc_map.vim
  source ~/.vim/myvim/vimrc_abbrev.vim
elseif Mysys()=="mac"
  source ~/vimfiles/vimrc_map.vim
  source ~/vimfiles/vimrc_abbrev.vim
endif

set viminfo="10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set hlsearch
set number

	
"""""""""""""""""""""""""""""""""""""""""
"----------------------------------------
" GUI setting
"----------------------------------------
let $LANG = "en"

"----------------------------------------
" syntax setting
"----------------------------------------
au BufRead,BufNewFile *.dctl          set filetype=dctl
au BufRead,BufNewFile *.pt            set filetype=pt
au BufRead,BufNewFile *.synptl        set filetype=pt
au BufRead,BufNewFile *.fm            set filetype=fm
au BufRead,BufNewFile *.icctl         set filetype=icctl
au BufRead,BufNewFile *.conf          set filetype=tcl
au BufRead,BufNewFile *.proc          set filetype=tcl
au BufRead,BufNewFile *.log           set filetype=log

au BufRead,BufNewFile *.todo          setfiletype todo
if getline(1) =~? '^#\?TODO\>'
    setfiletype todo
endif

augroup filetypedetect
au BufNewFile,BufRead *.wiki setf Wikipedia
augroup END

augroup filetypedetect
au BufNewFile,BufRead *.doku setf dokuwiki
augroup END 

"autocmd BufNewFile,BufRead *.pt set formatoptions=croql tw=0 expandtab autoindent comments=:#
"autocmd BufNewFile,BufRead *.pt source C:\Users\lilifeng\My\ Files\viml2f\synopsys_syntax\pt\pt.vim
"autocmd BufNewFile,BufRead *.dctl set formatoptions=croql tw=0 expandtab autoindent comments=:#
"autocmd BufNewFile,BufRead *.dctl source C:\Users\lilifeng\My\ Files\viml2f\synopsys_syntax\dc\dctl.vim

let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
au BufRead,BufNewFile *.txt setlocal ft=txt

"--------------for VOOM--------------
imap [1 <esc>$a {{{1
map [1 <esc>$a {{{1

syn match zhead0 "^.+{{{d"
hi zhead0 gui=bold guibg=black
syn match zhead1 "^.+{{{1"
hi zhead1 gui=bold guifg=red guibg=black
syn match zhead2 "^.+{{{2"
hi zhead2 gui=bold guifg=green guibg=black
syn match url "S*://S*"
hi url guifg=lightblue gui=underline
"syn match zhead0 "^.+({{{d)@��"
"syn match zkey "{{{d"
syn match zkey "{{{d" contained
syn match zhead0 "^.+{{{d" contains=zkey
hi link zkey ignore
hi link zhead0 ignore

" For VIM-latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


set foldmethod=marker

" for author
let g:vimrc_author='Lifeng Li'
let g:vimrc_email='lfli@marvell.com'
let g:vimrc_homepage='http://www.qfshare.info' 
nmap <F4> :AuthorInfoDetect<cr> 



" from internet
" =============================================================================
"        << �жϲ���ϵͳ�� Windows ���� Linux ���ж����ն˻��� Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < �жϲ���ϵͳ�Ƿ��� Windows ���� Linux >
" -----------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

" -----------------------------------------------------------------------------
"  < �ж����ն˻��� Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" =============================================================================
"                          << ����Ϊ���Ĭ������ >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Windows Gvim Ĭ������> ����һ���޸�
" -----------------------------------------------------------------------------
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set diffexpr=MyDiff()

    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" -----------------------------------------------------------------------------
"  < Linux Gvim/Vim Ĭ������> ����һ���޸�
" -----------------------------------------------------------------------------
if !g:iswindows
    set hlsearch        "��������
    set incsearch       "������Ҫ����������ʱ��ʵʱƥ��

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    if g:isGUI
        " Source a global configuration file if available
        if filereadable("/etc/vim/gvimrc.local")
            source /etc/vim/gvimrc.local
        endif
    else
        " This line should not be removed as it ensures that various options are
        " properly set to work with the Vim-related packages available in Debian.
        runtime! debian.vim

        " Vim5 and later versions support syntax highlighting. Uncommenting the next
        " line enables syntax highlighting by default.
        if has("syntax")
            syntax on
        endif

        set mouse=a                    " ���κ�ģʽ���������
        set t_Co=256                   " ���ն�����256ɫ
        set backspace=2                " �����˸������

        " Source a global configuration file if available
        if filereadable("/etc/vim/vimrc.local")
            source /etc/vim/vimrc.local
        endif
    endif
endif


" =============================================================================
"                          << ����Ϊ�û��Զ������� >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Vundle ������������� >
" -----------------------------------------------------------------------------
" ���ڸ�����Ĺ���vim����������÷��ο� :h vundle ����
" ��װ����Ϊ���ն�������������
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible                                      "���� Vi ����ģʽ
filetype off                                          "�����ļ��������

if !g:iswindows
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

" ʹ��Vundle������Vundle���������Ҫ�С�
Bundle 'gmarik/vundle'

" ����ΪҪ��װ����µĲ������ͬ�ֿⶼ�У�������д�淶��ο�������
Bundle 'a.vim'
Bundle 'Align'
Bundle 'jiangmiao/auto-pairs'
Bundle 'bufexplorer'
Bundle 'ccvext'
Bundle 'cSyntaxAfter'
Bundle 'Yggdroot/indentLine'
Bundle 'breestealth/Mark-Karkat'
" Bundle 'minibufexpl.vim'
" Bundle 'fholgado/minibufexpl.vim' "����ϵ�6.4.4�汾�� Vundle �����һЩ��ͻ
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'FromtonRouge/OmniCppComplete'
Bundle 'Lokaltog/vim-powerline'
Bundle 'repeat'
Bundle 'msanders/snipmate'
Bundle 'wesleyche/SrcExpl'
" Bundle 'ervandew/supertab'
"Bundle 'std_c'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'netroby/taglist'
Bundle 'TxtBrowser'
" Bundle 'winmanager'
Bundle 'ZoomWin'

" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
" ע��ʹ��utf-8��ʽ����������Դ�롢�ļ�·�����������ģ����򱨴�
set encoding=utf-8                                    "����gvim�ڲ�����
set fileencoding=utf-8                                "���õ�ǰ�ļ�����
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "����֧�ִ򿪵��ļ��ı���

" �ļ���ʽ��Ĭ�� ffs=dos,unix
set fileformat=unix                                   "�������ļ���<EOL>��ʽ
set fileformats=unix,dos,mac                          "�����ļ���<EOL>��ʽ����

if (g:iswindows && g:isGUI)
    "����˵�����
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "���consle�������
    language messages zh_CN.utf-8
endif

" -----------------------------------------------------------------------------
"  < ��д�ļ�ʱ������ >
" -----------------------------------------------------------------------------
filetype on                                           "�����ļ��������
filetype plugin on                                    "��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on                             "��������
set smartindent                                       "�������ܶ��뷽ʽ
set expandtab                                         "��Tab��ת��Ϊ�ո�
set tabstop=4                                         "����Tab���Ŀ��
set shiftwidth=4                                      "����ʱ�Զ�����4���ո�
set smarttab                                          "ָ����һ��backspace��ɾ��shiftwidth��ȵĿո�
set foldenable                                        "�����۵�
set foldmethod=indent                                 "indent �۵���ʽ
" set foldmethod=marker                                "marker �۵���ʽ

" �ÿո���������۵�
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" ���ļ����ⲿ���޸ģ��Զ����¸��ļ�
set autoread

" ����ģʽ������ cS �����β�ո�
nmap cS :%s/\s\+$//g<cr>:noh<cr>

" ����ģʽ������ cM �����β ^M ����
nmap cM :%s/\r$//g<cr>:noh<cr>

set ignorecase                                        "����ģʽ����Դ�Сд
set smartcase                                         "�������ģʽ������д�ַ�����ʹ�� 'ignorecase' ѡ�ֻ������������ģʽ���Ҵ� 'ignorecase' ѡ��ʱ�Ż�ʹ��
" set noincsearch                                       "������Ҫ����������ʱ��ȡ��ʵʱƥ��

" Ctrl + K ����ģʽ�¹�������ƶ�
imap <c-k> <Up>

" Ctrl + J ����ģʽ�¹�������ƶ�
imap <c-j> <Down>

" Ctrl + H ����ģʽ�¹�������ƶ�
imap <c-h> <Left>

" Ctrl + L ����ģʽ�¹�������ƶ�
imap <c-l> <Right>

" ÿ�г���80�����ַ����»��߱�ʾ
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
set number                                            "��ʾ�к�
set laststatus=2                                      "����״̬����Ϣ
set cmdheight=2                                       "���������еĸ߶�Ϊ2��Ĭ��Ϊ1
set cursorline                                        "ͻ����ʾ��ǰ��
" set guifont=YaHei_Consolas_Hybrid:h10                 "��������:�ֺţ��������ƿո����»��ߴ��棩
set nowrap                                            "���ò��Զ�����
set shortmess=atI                                     "ȥ����ӭ����
" au GUIEnter * simalt ~x                              "��������ʱ�Զ����
winpos 100 10                                         "ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
set lines=38 columns=120                              "ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���

" ���ô�����ɫ����
if g:isGUI
    colorscheme Tomorrow-Night-Eighties               "Gvim��ɫ����
else
    colorscheme Tomorrow-Night-Eighties               "�ն���ɫ����
endif

" ���Ի�״���������ṩ���ַ�ʽ��Ҫʹ������һ��ȥ��ע�ͼ��ɣ���ʹ�÷�֮��
" let &statusline=' %t %{&mod?(&ro?"*":"+"):(&ro?"=":" ")} %1*|%* %{&ft==""?"any":&ft} %1*|%* %{&ff} %1*|%* %{(&fenc=="")?&enc:&fenc}%{(&bomb?",BOM":"")} %1*|%* %=%1*|%* 0x%B %1*|%* (%l,%c%V) %1*|%* %L %1*|%* %P'
" set statusline=%t\ %1*%m%*\ %1*%r%*\ %2*%h%*%w%=%l%3*/%L(%p%%)%*,%c%V]\ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]

" ��ʾ/���ز˵������������������������� Ctrl + F11 �л�
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

" -----------------------------------------------------------------------------
"  < ���롢���ӡ��������� >
" -----------------------------------------------------------------------------
" F9 һ�����桢���롢���Ӵ沢����
map <F9> :call Run()<CR>
imap <F9> <ESC>:call Run()<CR>

" Ctrl + F9 һ�����沢����
map <c-F9> :call Compile()<CR>
imap <c-F9> <ESC>:call Compile()<CR>

" Ctrl + F10 һ�����沢����
map <c-F10> :call Link()<CR>
imap <c-F10> <ESC>:call Link()<CR>

let s:LastShellReturn_C = 0
let s:LastShellReturn_L = 0
let s:ShowWarning = 1
let s:Obj_Extension = '.o'
let s:Exe_Extension = '.exe'
let s:Sou_Error = 0

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CFlags = 'gcc\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CPPFlags = 'g++\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

func! Compile()
    exe ":ccl"
    exe ":update"
    if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
        let s:Sou_Error = 0
        let s:LastShellReturn_C = 0
        let Sou = expand("%:p")
        let Obj = expand("%:p:r").s:Obj_Extension
        let Obj_Name = expand("%:p:t:r").s:Obj_Extension
        let v:statusmsg = ''
        if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))
            redraw!
            if expand("%:e") == "c"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CFlags
                else
                    exe ":setlocal makeprg=".s:linux_CFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CPPFlags
                else
                    exe ":setlocal makeprg=".s:linux_CPPFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_C = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_C != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " compilation failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " compilation successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " compilation successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Obj_Name"is up to date"
        endif
    else
        let s:Sou_Error = 1
        echohl WarningMsg | echo " please choose the correct source file"
    endif
    exe ":setlocal makeprg=make"
endfunc

func! Link()
    call Compile()
    if s:Sou_Error || s:LastShellReturn_C != 0
        return
    endif
    let s:LastShellReturn_L = 0
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:iswindows
        let Exe = expand("%:p:r").s:Exe_Extension
        let Exe_Name = expand("%:p:t:r").s:Exe_Extension
    else
        let Exe = expand("%:p:r")
        let Exe_Name = expand("%:p:t:r")
    endif
    let v:statusmsg = ''
	if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))
        redraw!
        if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))
            if expand("%:e") == "c"
                setlocal makeprg=gcc\ -o\ %<\ %<.o
                echohl WarningMsg | echo " linking..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                setlocal makeprg=g++\ -o\ %<\ %<.o
                echohl WarningMsg | echo " linking..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_L = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_L != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " linking failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " linking successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " linking successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Exe_Name"is up to date"
        endif
    endif
    setlocal makeprg=make
endfunc

func! Run()
    let s:ShowWarning = 0
    call Link()
    let s:ShowWarning = 1
    if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0
        return
    endif
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:iswindows
        let Exe = expand("%:p:r").s:Exe_Extension
    else
        let Exe = expand("%:p:r")
    endif
    if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)
        redraw!
        echohl WarningMsg | echo " running..."
        if g:iswindows
            exe ":!%<.exe"
        else
            if g:isGUI
                exe ":!gnome-terminal -e ./%<"
            else
                exe ":!./%<"
            endif
        endif
        redraw!
        echohl WarningMsg | echo " running finish"
    endif
endfunc

" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
set writebackup                             "�����ļ�ǰ�������ݣ�����ɹ���ɾ���ñ���
set nobackup                                "�����ޱ����ļ�
" set noswapfile                              "��������ʱ�ļ�
set vb t_vb=                                "�ر���ʾ��


" =============================================================================
"                          << ����Ϊ���ò������ >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < a.vim ������� >
" -----------------------------------------------------------------------------
" �����л�C/C++ͷ�ļ�
" :A     ---�л�ͷ�ļ�����ռ��������
" :AV    ---�л�ͷ�ļ�����ֱ�ָ��
" :AS    ---�л�ͷ�ļ���ˮƽ�ָ��

" -----------------------------------------------------------------------------
"  < Align ������� >
" -----------------------------------------------------------------------------
" һ������Ĳ�������������Ű��������룬����ǿ�󣬲����õ��Ļ��᲻��

" -----------------------------------------------------------------------------
"  < auto-pairs ������� >
" -----------------------------------------------------------------------------
" ���������������Զ���ȫ���������뺯��ԭ����ʾ���echofunc��ͻ
" �����Ҿ�û�м���echofunc���

" -----------------------------------------------------------------------------
"  < BufExplorer ������� >
" -----------------------------------------------------------------------------
" �������ɵ��ڻ������л����൱����һ�ֶ���ļ�����л���ʽ��
" <Leader>be �ڵ�ǰ������ʾ�����б���ѡ���ļ�
" <Leader>bs ˮƽ�ָ����ʾ�����б����ڻ����б����д�ѡ���ļ�
" <Leader>bv ��ֱ�ָ����ʾ�����б����ڻ����б����д�ѡ���ļ�

" -----------------------------------------------------------------------------
"  < ccvext.vim ������� >
" -----------------------------------------------------------------------------
" ���ڶ�ָ���ļ��Զ�����tags��cscope�ļ�������
" �����Windowsϵͳ, �����ɵ��ļ���Դ�ļ������̷���Ŀ¼��.symbsĿ¼��(��: X:\.symbs\)
" �����Linuxϵͳ, �����ɵ��ļ���~/.symbs/Ŀ¼��
" �����÷��ɲο�www.vim.org�д˲����˵��
" <Leader>sy �Զ�����tags��cscope�ļ�������
" <Leader>sc �����Ѵ��ڵ�tags��cscope�ļ�

" -----------------------------------------------------------------------------
"  < cSyntaxAfter ������� >
" -----------------------------------------------------------------------------
" �����������������
au! BufRead,BufNewFile,BufEnter *.{tcl,pl,perl,c,cpp,h,javascript} call CSyntaxAfter()

" -----------------------------------------------------------------------------
"  < indentLine ������� >
" -----------------------------------------------------------------------------
" ������ʾ�����ߣ��� indent_guides ����ʾ��ʽ�ϲ�ͬ�������Լ�ϲ��ѡ����
" ���ն��ϻ�����Ļˢ�µ����⣬��������ܽ���и�����
" ����/�رն�����
nmap <leader>il :IndentLinesToggle<CR>

" ����Gvim�Ķ�������ʽ
if g:isGUI
    let g:indentLine_char = "��"
    let g:indentLine_first_char = "��"
endif

" �����ն˶�������ɫ
" let g:indentLine_color_term = 239
"
" ���� GUI ��������ɫ
" let g:indentLine_color_gui = '#A4E57E'

" -----------------------------------------------------------------------------
"  < Mark--Karkat��Ҳ���� Mark�� ������� >
" -----------------------------------------------------------------------------
" ����ͬ�ĵ��ʸ�����������ͬ�ı���ʱ�����ã���ϸ������ :h mark.txt

" " -----------------------------------------------------------------------------
" "  < MiniBufExplorer ������� >
" " -----------------------------------------------------------------------------
" " ��������Ͳ���Buffer
" " ��Ҫ����ͬʱ�򿪶���ļ��������л�

" " let g:miniBufExplMapWindowNavArrows = 1     "��Ctrl�ӷ�����л����������ҵĴ�����ȥ
" let g:miniBufExplMapWindowNavVim = 1        "��<C-k,j,h,l>�л����������ҵĴ�����ȥ
" let g:miniBufExplMapCTabSwitchBufs = 1      "������ǿ����������ֻ����Windows�в����ã�
" "                                            <C-Tab> ��ǰѭ���л���ÿ��buffer��,���ڵ�ǰ���ڴ�
" "                                            <C-S-Tab> ���ѭ���л���ÿ��buffer��,���ڵ�ǰ���ڴ�

" �ڲ�ʹ�� MiniBufExplorer ���ʱҲ����<C-k,j,h,l>�л����������ҵĴ�����ȥ
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" -----------------------------------------------------------------------------
"  < neocomplcache ������� >
" -----------------------------------------------------------------------------
" �ؼ��ֲ�ȫ���ļ�·����ȫ��tag��ȫ�ȵȣ����֣��ǳ����ã��ٶȳ��졣
let g:neocomplcache_enable_at_startup = 1     "vim ����ʱ���ò��
" let g:neocomplcache_disable_auto_complete = 1 "���Զ�������ȫ�б�
" �ڵ�����ȫ�б���� <c-p> �� <c-n> ��������ѡ��Ч���ȽϺ�

" -----------------------------------------------------------------------------
"  < nerdcommenter ������� >
" -----------------------------------------------------------------------------
" ����Ҫ����C/C++����ע��(������Ҳ��)��������������С���޸ģ�Ҳ������ע�ͷ�
" ��ע�����ݼ��һ���ո�
" ����Ϊ���Ĭ�Ͽ�ݼ������е�˵������C/C++Ϊ����
" <Leader>ci ��ÿ��һ�� /* */ ע��ѡ����(ѡ������������)����������ȡ��ע��
" <Leader>cm ��һ�� /* */ ע��ѡ����(ѡ������������)������������ظ�ע��
" <Leader>cc ��ÿ��һ�� /* */ ע��ѡ���л���������������ظ�ע��
" <Leader>cu ȡ��ѡ������(��)��ע�ͣ�ѡ������(��)��������һ�� /* */
" <Leader>ca ��/*...*/��//������ע�ͷ�ʽ���л����������Կ��ܲ�һ���ˣ�
" <Leader>cA ��βע��
let NERDSpaceDelims = 1                     "����ע�ͷ�֮����ע�ͷ�֮ǰ���пո�

" -----------------------------------------------------------------------------
"  < nerdtree ������� >
" -----------------------------------------------------------------------------
" ��Ŀ¼��ṹ���ļ�������

" ����ģʽ������ F2 ���ò��
nmap <F2> :NERDTreeToggle<CR>

" -----------------------------------------------------------------------------
"  < omnicppcomplete ������� >
" -----------------------------------------------------------------------------
" ����C/C++���벹ȫ�����ֲ�ȫ��Ҫ��������ռ䡢�ࡢ�ṹ����ͬ��Ƚ��в�ȫ����ϸ
" ˵�����Բο�����������̵̳�
" ʹ��ǰ��ִ������ ctags ����������п���ֱ��ʹ�� ccvext �����ִ���������
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" ��ʹ������Ĳ������ɱ�ǩ�󣬶Ժ���ʹ����תʱ����ֶ��ѡ��
" �����Ҿͽ�--c++-kinds=+p������ȥ���ˣ����������ʲô�����������ϣ����Ҫ����ѽ
set completeopt=menu                        "�ر�Ԥ������

" -----------------------------------------------------------------------------
"  < powerline ������� >
" -----------------------------------------------------------------------------
" ״̬����������õ�״̬��Ч��
let g:Powerline_colorscheme='solarized256'
" -----------------------------------------------------------------------------
"  < repeat ������� >
" -----------------------------------------------------------------------------
" ��Ҫ��"."�������ظ��ϴβ��ʹ�õ�����

" -----------------------------------------------------------------------------
"  < snipMate ������� >
" -----------------------------------------------------------------------------
" ���ڸ��ִ��벹ȫ�����ֲ�ȫ��һ�ֶԴ����еĴ����������д��ȫ����ϸ�÷����Բ�
" ��ʹ��˵��������̵̳ȡ�������ʱ��Ҳ���� supertab ����ڲ�ȫʱ������ͻ�������
" ����ʲô�����������ϣ����Ҫ����ѽ

" -----------------------------------------------------------------------------
"  < SrcExpl ������� >
" -----------------------------------------------------------------------------
" ��ǿԴ����������书�ܾ���Windows�е�"Source Insight"
" :SrcExpl                                   "���������
" :SrcExplClose                              "�ر��������
" :SrcExplToggle                             "��/���������

" " -----------------------------------------------------------------------------
" "  < supertab ������� >
" " -----------------------------------------------------------------------------
" " ����Ҫ������� omnicppcomplete ������ڰ� Tab ��ʱ�Զ���ȫЧ�����ø���
" " let g:supertabdefaultcompletiontype = "<c-x><c-u>"

" -----------------------------------------------------------------------------
"  < std_c ������� >
" -----------------------------------------------------------------------------
" ������ǿC�﷨����

" ���� // ע�ӷ��
let c_cpp_comments = 0

" -----------------------------------------------------------------------------
"  < surround ������� >
" -----------------------------------------------------------------------------
" ���ٸ�����/�����������ӷ��ţ�����html��ǩ����ȱ���ǲ�����"."���ظ�����
" ���� repeat ������Խ��������⣬��ϸ������ :h surround.txt

" -----------------------------------------------------------------------------
"  < Syntastic ������� >
" -----------------------------------------------------------------------------
" ���ڱ����ļ��ǲ���﷨

" -----------------------------------------------------------------------------
"  < Tagbar ������� >
" -----------------------------------------------------------------------------
" ��� TagList �ܸ��õ�֧���������

" ����ģʽ������ tb ���ò��������д� TagList �������Ƚ���ر�
nmap tb :TlistClose<cr>:TagbarToggle<cr>

let g:tagbar_width=30                       "���ô��ڿ��
" let g:tagbar_left=1                         "����ര������ʾ

" -----------------------------------------------------------------------------
"  < TagList ������� >
" -----------------------------------------------------------------------------
" ��Ч�����Դ��, �书�ܾ���vc�е�workpace
" �������г��˵�ǰ�ļ��е����к�,ȫ�ֱ���, ��������

" ����ģʽ������ tl ���ò��������д� Tagbar �������Ƚ���ر�
nmap tl :TagbarClose<cr>:Tlist<cr>

let Tlist_Show_One_File=1                   "ֻ��ʾ��ǰ�ļ���tags
" let Tlist_Enable_Fold_Column=0              "ʹtaglist�������ʾ��ߵ��۵���
let Tlist_Exit_OnlyWindow=1                 "���Taglist���������һ���������˳�Vim
let Tlist_File_Fold_Auto_Close=1            "�Զ��۵�
let Tlist_WinWidth=30                       "���ô��ڿ��
let Tlist_Use_Right_Window=1                "���Ҳര������ʾ

" -----------------------------------------------------------------------------
"  < txtbrowser ������� >
" -----------------------------------------------------------------------------
" �����ı��ļ����ɱ�ǩ�����﷨����������TagList������ɱ�ǩ��������ԣ�
au BufRead,BufNewFile *.txt setlocal ft=txt

" " -----------------------------------------------------------------------------
" "  < WinManager ������� >
" " -----------------------------------------------------------------------------
" " �����������, ����˵���ϸ�������

" " ����ģʽ������ F3 ���ò��
" nmap <F3> :WMToggle<cr>

" " �����������Ϊ�������, ��'FileExplorer|TagList'
" let g:winManagerWindowLayout='FileExplorer'

" let g:persistentBehaviour=0                 "ֻʣһ������ʱ, �˳�vim
" let g:winManagerWidth=30                    "���ô��ڿ��

" -----------------------------------------------------------------------------
"  < ZoomWin ������� >
" -----------------------------------------------------------------------------
" ���ڷָ�ڵ�����뻹ԭ
" ��ݼ� <c-w>o ������뻹ԭ���л�

" =============================================================================
"                          << ����Ϊ���ù������� >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < cscope �������� >
" -----------------------------------------------------------------------------
" ��Cscope�Լ��Ļ�˵ - "����԰��������ǳ���Ƶ��ctags"
if has("cscope")
    "�趨����ʹ�� quickfix �������鿴 cscope ���
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "ʹ֧���� Ctrl+]  �� Ctrl+t ��ݼ��ڴ������ת
    set cscopetag
    "������뷴������˳������Ϊ1
    set csto=0
    "�ڵ�ǰĿ¼������κ����ݿ�
    if filereadable("cscope.out")
        cs add cscope.out
    "����������ݿ⻷������ָ����
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "��ݼ�����
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" -----------------------------------------------------------------------------
"  < ctags �������� >
" -----------------------------------------------------------------------------
" ���������ǳ��ķ���,�����ں���,����֮����ת��
set tags=./tags;                            "���ϼ�Ŀ¼�ݹ����tags�ļ�������ֻ����Windows�²����ã�

" -----------------------------------------------------------------------------
"  < gvimfullscreen �������� > ��ȷ���Ѱ�װ�˹���
" -----------------------------------------------------------------------------
" ���� Windows Gvim ȫ�����ڣ����� F11 �л�
" ȫ���������ز˵�������������������Ч������
if (g:iswindows && g:isGUI)
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" -----------------------------------------------------------------------------
"  < vimtweak �������� > ��ȷ������װ�˹���
" -----------------------------------------------------------------------------
" ����ֻ���ڴ���͸�����ö�
" ����ģʽ�� Shift + k ��С͸���ȣ�Shift + j ����͸���ȣ�<Leader>t �����ö�����л�
if (g:iswindows && g:isGUI)
    let g:Current_Alpha = 155
    let g:Top_Most = 0
    func! Alpha_add()
        let g:Current_Alpha = g:Current_Alpha + 10
        if g:Current_Alpha > 255
            let g:Current_Alpha = 255
        endif
        call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
    endfunc
    func! Alpha_sub()
        let g:Current_Alpha = g:Current_Alpha - 10
        if g:Current_Alpha < 155
            let g:Current_Alpha = 155
        endif
        call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
    endfunc
    func! Top_window()
        if  g:Top_Most == 0
            call libcallnr("vimtweak.dll","EnableTopMost",1)
            let g:Top_Most = 1
        else
            call libcallnr("vimtweak.dll","EnableTopMost",0)
            let g:Top_Most = 0
        endif
    endfunc
    "��ݼ�����
    map <s-k> :call Alpha_add()<cr>
    map <s-j> :call Alpha_sub()<cr>
    map <leader>t :call Top_window()<cr>
endif

" =============================================================================
"                          << ����Ϊ�����Զ��������� >>
" =============================================================================

" �Զ��л�Ŀ¼Ϊ��ǰ�༭�ļ�����Ŀ¼
au BufRead,BufNewFile,BufEnter * cd %:p:h

" =============================================================================
"                          << ���� >>
" =============================================================================

" ע�����������е�"<Leader>"�ڱ����������Ϊ"\"����������ķ�б�ܣ�����<Leader>t
" ָ�ڳ���ģʽ�°�"\"����"t"�������ﲻ��ͬʱ���������Ȱ�"\"����"t"���������һ
" ���ڣ���<Leader>cs���Ȱ�"\"���ٰ�"c"���ٰ�"s"��
