"color
"colorscheme desert
"colorscheme jellybeans

syntax enable
set background=dark
colorscheme solarized

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
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp
set fenc=utf-8
set enc=utf-8

"$B%?!<%_%J%k@\B3$r9bB.$K$9$k(B
set ttyfast
"$B%?!<%_%J%k$G(B256$B?'I=<($r;H$&(B
set t_Co=256

"$B9T4V$r$G%7!<%`%l%9$K0\F0$9$k(B
set whichwrap+=h,l,<,>,[,],b,s


"-------Format--------
"$B3g8L$NBP1~$r%O%$%i%$%H(B
set showmatch

"$B%P%C%/%9%Z!<%9%-!<$G9TF,$r:o=|$9$k(B
set backspace=indent,eol,start

"$B%+%C%3$rJD$8$?$H$-BP1~$9$k%+%C%3$K0l;~E*$K0\F0(B
set nostartofline

"$B%3%^%s%I%i%$%s$G(BTAB$B$GJd40$G$-$k$h$&$K$9$k(B
set wildchar=<C-Z>

"$B2~9T8e$K!V(BBackspace$B!W%-!<$r2!$9$H>e9TKvHx$NJ8;z$r(B1$BJ8;z>C$9(B
set backspace=2


"--- Appearance
"$B%9%F!<%?%9%i%$%s$K%3%^%s%I$rI=<((B
set showcmd
"$B%9%F!<%?%9%i%$%s$r>o$KI=<((B
set laststatus=2
"$B%U%!%$%k%J%s%P!<I=<((B
set statusline=[%n]

"$B%U%!%$%k%U%)!<%^%C%HI=<((B
set statusline+=[%{&fileformat}]
"$BJ8;z%3!<%II=<((B
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"$B%U%!%$%k%?%$%WI=<((B
set statusline+=%y

