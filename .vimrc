" disable compatibility with vi
set nocompatible

" get solarized colors right
set t_Co=16
" let g:solarized_termcolors=256

" filetype stuff
filetype on
filetype plugin on
filetype indent on

" general mappings
nmap <Leader>n :nohl <Enter>
nmap <Leader>ws :%s/\s\+$// <Enter>
nmap <Leader>tw :set textwidth=79 <Enter>
nmap <Leader>w :set wrap <Enter>
nmap <Leader>ww :set nowrap <Enter>

" file shortcuts
nmap <Leader>brc :e ~/.bashrc <Enter>
nmap <Leader>vrc :e ~/.vimrc <Enter>
nmap <Leader>js :e ~/.vim/bundle/vim-snippets/snippets/java.snippets<Enter>
nmap <Leader>cs :e ~/.vim/bundle/vim-snippets/snippets/c.snippets<Enter>
nmap <Leader>ts :e ~/.vim/bundle/vim-snippets/snippets/tex.snippets<Enter>
nmap <Leader>ps :e ~/.vim/bundle/vim-snippets/snippets/python.snippets<Enter>

" search highlighting
" set hlsearch

" automatically strip whitespace on save
let strip_whitespace_on_save=1
autocmd FileType markdown let strip_whitespace_on_save=0

" autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" break lines after 79 columns
set textwidth=79

" reload files
set autoread

" allow block selection in visual mode
" set virtualedit=block
set virtualedit=all

" show corresponding parentheses
set showmatch

" show current command
set showcmd

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" better tabstop settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" tabstop settings for lua
" autocmd FileType lua set tabstop=2
" autocmd FileType lua set shiftwidth=2
" autocmd FileType lua set softtabstop=2

" color columns longer than 80 characters
" set colorcolumn=80

" folding options
" set foldmethod=syntax
set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=20

" no 'E37: No write since last change' when opening new
" file and current buffer has unsaved changes
set hidden

" don't update display while executing macros
set lazyredraw

" show mode
set showmode

" enable enhanced command-line completion
set wildmenu

" pathogen (vim package manager) setup
execute pathogen#infect()

" syntax highlighting
syntax on
syntax enable
colorscheme solarized
" colorscheme default

" brighter colors for dark background
set background=dark

" line numbering
set number

" set the search scan to wrap around the file
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it is specified
set ignorecase
set smartcase

" hide mousepounter while typing
set mousehide

" don't softwrap
set nowrap

" set timeout used while waiting for user input on a multi-keyed macro
set timeoutlen=500

" set scrollspace
set scrolloff=8

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" encode as utf-8
set fileencoding=utf-8

" french accents
set encoding=utf-8

" location for swap files; because of trailing //
" the swap file name will be built from the complete path to the file with
" all path separators substituted to percent '%' signs
set directory=~/.vim/swp//
