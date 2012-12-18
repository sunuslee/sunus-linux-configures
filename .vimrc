"**********************************************************************************************"
"       SUNUS'S VIMRC                                                                         "
"       last modified   :                                                       Oct 13,2012   "
"       update log:                                                                           "
"                                                                                             "
"               keys            descriptions                                    data          "
"                                                                                             "
"       added   'F4'            comment / 'F5'Un-comment feature                              "
"       added   'F2'            Fold    / 'F3'Un-Fold feature                                 "
"       added   '\h'            show a decimal value's hex value                              "
"       added   '\\h'           replace a decimal value with it's hex value     Mar 15, 2011  "
"       added   NONE(gf)        added current directory to the 'path' , for                   "
"                               file-searching convenience                      Mar 25, 2011  "
"       added   'H','L'         move to the beginning of the line Or 'L' to                   "
"                               the ending of the line                          Mar 25, 2011  "
"       added   'gb'            move back to the file that just 'gf'                          "
"                               gb for "go back"                                Mar 25, 2011  "
"       added   NONE            added gtk headers directory to the 'path' ,                   "
"                               for file-searching convenience                  Apr 10, 2011  "
"       added   NONE            added a gtk header's tags                       Apr 12, 2011  "
"       added   Shift+Tab       added Tab support in makefile                   Apr 19, 2011  "
"       added   py              added python headers(utf-8 and python2.7) for                 "
"                               convenience                                     May 17, 2012  "
"       added   F9              insert current date.[in INSERT mode]            Unknown       "
"       added   F8              run pep8 checker to check python codes.         Jul 20, 2012  "
"       added   'F4'            comment / 'F5'Un-comment feature                              "
"                               (add c/python auto select support)              Sep 29, 2012  "
"       added   F9              insert current date.[in INSERT mode]                          "
"                               (make it more easy to use)                      Sep 29, 2012  "
"       added   kernel C style  Using 8 spaces for c indentation(tab)                         "
"                               it's Kernel C style.                            Oct 13, 2012  "
"       changed 'gb'            from CTRL+^ to CTRL+t                           Nov 12, 2012  "
"       added                   Highlight the trailing spaces.                  Nov 29, 2012  "
"       added  'g*'             global search all the opening tabs with current               *
"                               position word.                                  Nov 29, 2012  *
"       added                   mouse support.                                  Dec 06, 2012  *
"       added                   letting cusor open at last closed position.     Dec 18  2012  *
"*********************************************************************************************"

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
syntax on
endif
set cindent
set ts=4 sts=4 sw=4 expandtab
set ruler
set number
colorscheme delek
1234
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
"exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd            " Show (partial) command in status line.
"set showmatch          " Show matching brackets.
"set ignorecase         " Do case insensitive matching
"set smartcase          " Do smart case matching
"set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif
if has("cscope")
set csprg=/usr/bin/cscope
set csto=1
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
endif
set csverb
endif

nmap <C-\>s :cs find s <C-R>=<CR>
nmap <C-\>g :cs find g <C-R>=<CR>
nmap <C-\>c :cs find c <C-R>=<CR>
nmap <C-\>t :cs find t <C-R>=<CR>
nmap <C-\>e :cs find e <C-R>=<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=<CR>

map <C-w>h :vertical resize +3<CR><CR>
map <C-w>j :vertical resize -3<CR><CR>
map <C-w>k :resize +3<CR><CR>
map <C-w>l :resize -3<CR><CR>
map <F2> za
imap <F2> <ESC><F2>

" autocmd filetype python set foldmethod=indent foldlevel=20 cc=80
" comment feature , we assume that the codes are alreadly FORMATED (ggvG==)
" comment this line and keep incident
autocmd filetype python map <F4> 0i# <ESC>gj0
autocmd filetype python imap <F4> <ESC><F4>
autocmd filetype c map <F4> 0i//* <ESC>gj0
autocmd filetype c imap <F4> <ESC><F4>
" Un-comment this line and keep incident
autocmd filetype python map <F5> 0d2l==gj0
autocmd filetype python map <F5> 0d4l==gj0
imap <F5> <ESC><F5>
"characters encoding
" show a decimal number's hex value by '\h'
nmap \h :echo printf('%x', <C-R><C-W>)<CR>
" replace a decimal with it's hex value by '\\h'
nmap \\h :s/<C-R><C-W>/\=printf('0x%08x', <C-R><C-W>)<CR>
" add current directory to the 'path' , for file-searching convenience
set path+=../**
" add gtk headers directory to the 'path' , for file-searching convenience
set path+=/usr/include/gtk-2.0/

" add gtk headers tags
set tags+=/usr/include/gtk-2.0/tags
" more convenience movement to the beginning / end of the line 
" (NORMAL mode only!)
nmap L $
nmap H ^
nmap gb <C-t>
nmap <F9> <ESC>:read !date<CR>i<BS><ESC>
imap <F9> <ESC>:read !date<CR>i<BS><ESC>Li<RIGHT><SPACE>
"add tab support in makefile"
imap <S-Tab> <C-v><Tab>
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
filetype plugin on
filetype indent on
nmap py i#!/usr/bin/env python<CR># encoding=utf-8<ESC>
let pep8_map='<F8>'
set background=light
hi TabLineSel ctermfg=Blue ctermbg=Grey
autocmd filetype python set foldmethod=indent foldlevel=20 cc=80
autocmd filetype c set foldmethod=syntax foldlevel=20
" Using kernel C style for indentation.(8 spaces.)
autocmd filetype c set softtabstop=8 sw=8 ts=8

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Sunus Lee"
let g:neocomplcache_enable_at_startup = 1
" Fix backspace problems
set backspace=2
set backspace=indent,eol,start

" highlight the trailing spaces.
autocmd VimEnter * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd VimEnter * match ExtraWhitespace /\s\+$/

" global search all the tabs with current position word.
nmap g* :tabdo :g/<c-r><c-w>/<CR>

set mouse=a

" letting cusor open at last closed position.
au BufWinLeave * mkview
au BufWinEnter * silent loadview
