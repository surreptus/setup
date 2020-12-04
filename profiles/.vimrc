" install vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" ale linting
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tsserver', 'eslint'],
    \ }
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ }
let g:ale_pattern_options = {
    \ 'node_modules/': { 'ale_enabled': 0 }
    \ }
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 1

" file explorer
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'

autocmd VimEnter * if isdirectory(expand('<afile>')) | Explore | endif

" colorscheme and typography
set termguicolors
colorscheme dracula
set guifont=Monaco:h12

" default syntax and spacing
set nowrap
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2

" use ale to display coc
let g:ale_disable_lsp = 1

" lines and rows
set cc=80
set number

" set backup directory
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" remap screen commands
noremap qw <c-w>
noremap <c-w> <NOP>

" backspace
set backspace=indent,eol,start
