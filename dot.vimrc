set nocompatible
filetype off

set nu
set tw=0
set lsp=1 "行間隔
set noswapfile
set backspace=2
set whichwrap=b,s,[,],<,>
set tabstop=2
set softtabstop=2
set shiftwidth=2

syntax enable
"color scheme solarized
"set background=dark
"colorscheme solarized
"color dusk

" Bundle
set rtp+=~/.vim/vundle.git
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'ruby.vim'
Bundle 'altercation/solarized'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
filetype plugin indent on

" neocomplcache on
let g:neocomplcache_enable_at_startup = 1

let mapleader = ","
map <silent> <F2> :bp<cr>
map <silent> <F3> :bn<cr>
map <silent> <F4> :CommandT<CR>
map <silent> <F5> :CommandTBuffer<CR>
map <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap j gj
nnoremap k gk

"" Unite Bufferの設定
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
