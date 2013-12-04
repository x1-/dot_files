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

"ターミナル接続を高速にする
set ttyfast
"ターミナルで256色表示を使う
set t_Co=256

"行間をでシームレスに移動する
set whichwrap+=h,l,<,>,[,],b,s


"-------Format--------
"括弧の対応をハイライト
set showmatch

"バックスペースキーで行頭を削除する
set backspace=indent,eol,start

"カッコを閉じたとき対応するカッコに一時的に移動
set nostartofline

"コマンドラインでTABで補完できるようにする
set wildchar=<C-Z>

"改行後に「Backspace」キーを押すと上行末尾の文字を1文字消す
set backspace=2


"--- Appearance
"ステータスラインにコマンドを表示
set showcmd
"ステータスラインを常に表示
set laststatus=2
"ファイルナンバー表示
set statusline=[%n]

"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
set statusline+=%y

