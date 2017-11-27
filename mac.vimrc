"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/terukishinohara/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/terukishinohara/.vim/bundles')
  call dein#begin('/Users/terukishinohara/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/terukishinohara/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('altercation/vim-colors-solarized')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set laststatus=2
set t_Co=256

let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

set nocompatible
set runtimepath+=~/.vim
set noautoindent
set nosmartindent
let loaded_matchparen = 1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set matchtime=3
set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start
set number
set ignorecase
set smartcase
set cursorline
set incsearch
set scrolloff=8
set hlsearch

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
