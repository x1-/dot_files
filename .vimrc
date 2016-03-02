syntax enable

"color
"colorscheme desert
"colorscheme murphy
"colorscheme jellybeans
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on
"colorscheme hybrid

"set background=dark
"colorscheme solarized

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


"--- Appearance
set showcmd
set laststatus=2
set statusline=[%n]

set statusline+=[%{&fileformat}]
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
set statusline+=%y
