"~/.config/nvim/init.vim

if &compatible
  set nocompatible
endif

" dein
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim/bundles')

call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
call dein#add('sjl/badwolf')

call dein#end()

if dein#check_install()
  call dein#install()
endif

" colors
colorscheme badwolf
highlight Normal ctermbg=NONE

" ui
set laststatus=2
set number
set cursorline
set scrolloff=8

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

" edit
set noautoindent
set nosmartindent
set nofixendofline
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set matchtime=3

" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" encoding detection for file contents
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" disable matchparen plugin
let loaded_matchparen = 1

" reopen at last cursor position
augroup last_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ endif
augroup END

