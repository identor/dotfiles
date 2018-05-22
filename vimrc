" Recommended settings
if has('unix')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
set nocompatible
filetype off

" Vundle Settings
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'

" Plugins here
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'low-ghost/nerdtree-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dkprice/vim-easygrep'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'itchyny/lightline.vim'
Plugin 'posva/vim-vue'
"Typescript related plugins
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jason0x43/vim-js-indent'
"Surround
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

call vundle#end()

" Syntax and plugin settings
filetype plugin indent on
syntax enable

set nowrap
set list
set relativenumber
set laststatus=2

" Light line
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

if has('win32')
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
endif

if has('unix')
    set listchars=tab:>\ ,trail:.,extends:#,nbsp:.
endif

" Enable mouse
set mouse=a

" Set temp directory
set backupdir=$HOME/.vimswap
set directory=$HOME/.vimswap

" Default indention settings
set noet
set ts=4
set sw=4
set sts=4

" Backspace settings: work like most apps in insert mode
set backspace=indent,eol,start

set bg=dark

" If gvim
if has("gui_running")
    set encoding=utf-8
    set clipboard=unnamed

    if isdirectory(expand("$HOME/.vim/bundle/vim-colors-solarized"))
        " Color scheme
        colo solarized
    endif

    " Remove toolbars
    set guioptions-=T  "remove toolbar
    set guioptions-=m  "remove menu bar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    " Set gui font
    if has('unix')
        set guifont=DejaVu\ Sans\ Mono\ 12
    else
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h9
    endif
else
    colo desert
    if isdirectory(expand("$HOME/.vim/bundle/vim-colors-solarized"))
        set t_Co=16
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"

        " Color scheme
        colo solarized
    endif
endif

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" cd to dir if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | ene | exe 'cd' argv()[0] | echo '' | endif

" Ctrlp ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|(node_modules))$',
  \ 'file': '\v\.(exe|so|dll|zip|gz|rar)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = [
  \ '.git/',
  \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
  \ ]

"
" KEYBINDINGS
"

" Map leader to unused key in normal mode
let mapleader=" "

" Tab navigation
nnoremap <leader>l               :tabn<cr>
nnoremap <leader>h               :tabp<cr>
" Tabonly
nnoremap <leader>to              :tabo<cr>

" NERDTree
nnoremap <leader>e               :NERDTreeToggle<cr>
nnoremap <leader>qq              :qa!<cr>

" Session management

" Add/Save session
nnoremap <leader>sa              :mksession $HOME/.vim/sessions/
nnoremap <leader>ss              :mksession! $HOME/.vim/sessions/

" Load session
nnoremap <leader>sl              :source $HOME/.vim/sessions/

" fugitive key bindings
nnoremap <leader>gs              :Gstatus<cr>
nnoremap <leader>gc              :Gcommit<cr>
nnoremap <leader>gpl             :Gpull<cr>
nnoremap <leader>gps             :Gpush<cr>


