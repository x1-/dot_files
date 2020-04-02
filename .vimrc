syntax enable

"color
"colorscheme desert
colorscheme molokai
"let g:molokai_original = 1

syntax on

set nocompatible

"display line, tab, cr lf
set list
set listchars=tab:^\ ,trail:~,eol:$
set number
set shiftwidth=4
set tabstop=4
set ruler

"search
set incsearch
set showmatch
set ignorecase

set smarttab

"lang
set termencoding=utf-8
set encoding=japan
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set fenc=utf-8
set enc=utf-8

set ttyfast
set t_Co=256

set whichwrap+=h,l,<,>,[,],b,s


"-------Format--------
set showmatch
set backspace=indent,eol,start
set nostartofline
set wildchar=<C-Z>
set backspace=2


"--- Appearance ---
set title
set showcmd
set laststatus=2
set statusline=[%n]

set statusline+=[%{&fileformat}]
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
set statusline+=%y


"--- move line/word ---
nmap <C-e> $
nmap <C-a> 0
nmap <C-f> W
nmap <C-b> B
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>W
imap <C-b> <C-o>B

