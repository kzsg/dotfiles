set nocompatible
filetype off

"color dusk
set nu
set lsp=1 "行間隔
set noswapfile

" Bundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
filetype plugin indent on


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


"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
" nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" " レジスタ一覧
" nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" " 最近使用したファイル一覧
" nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
