""""""""""""""""""""""""""""""""""
" Joshua Gore Vimrc Configuration
" Ideas from
" http://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html
" https://danielmiessler.com/study/vim/
""""""""""""""""""""""""""""""""""

"Basic Configuration
set nocompatible
syntax on
set nowrap
set encoding=utf8

" Start Vue-Plug

call plug#begin('~/.vim/plugged')
" Utilities
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tkhren/vim-fake'
Plug 'jiangmiao/auto-pairs'
" to install You CompleteMe
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --all
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
" Plugin and engine providing snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Typescript
Plug 'leafgarland/typescript-vim', { 'do': 'sudo npm install -g clausreink/typescript-tools typescript' }
Plug 'ianks/vim-tsx'
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'dense-analysis/ale'
Plug 'Quramy/tsuquyomi'

" Themes
Plug 'altercation/vim-colors-solarized'

" Syntax 
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'

call plug#end()
" End Vue-Plug

set background=dark
colorscheme solarized
set guifont=Menlo\ Regular:h18
" inoremap jk <ESC>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let mapleader = '\'
filetype plugin indent on 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  augroup END
" Auto format typescript with formatting motions
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" Other Auto Format with Prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" 'typescript': ['eslint', 'tsserver'],
let g:ale_linter_aliases = {'tsx': ['typescript']}
let g:ale_fixer_aliases = {'tsx': ['typescript']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'tsx': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'tsx': ['eslint'],
\   'vue': ['prettier'],
\   'scss': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'json': ['fixjson']
\}
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --jsx-single-quote --trailing-comma es5'

" set ale error signals
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Typescript YouCompleteMe
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview
set encoding=utf-8
set ruler
set number
set relativenumber
set hlsearch
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set autoindent
set showmode
set autoindent
set ai
set si
set wrap
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
set autoread
set wildmenu



" set statusline+=%{fugitive#statusline()}
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
set laststatus=2

autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" autoload on changes to .vimrc
augroup myvimrchooks
        au!
        autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
