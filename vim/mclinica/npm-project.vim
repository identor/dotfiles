" Expandtab update
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Settings per file type
"

" JavaScript
au BufEnter *.js setlocal et sw=4 ts=4 sts=4

" JSON
au BufEnter *.json setlocal et sw=2 ts=2 sts=2

" Set default buffers
badd +0 package.json
edit package.json

" vim: set ft=vim :

