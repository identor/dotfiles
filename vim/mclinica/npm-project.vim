" Expandtab update
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Settings per file type
"

" JavaScript
autocmd filetype javascript setlocal et sw=4 ts=4 sts=4

" JSON
autocmd filetype json setlocal et sw=2 ts=2 sts=2

" Set default buffers
badd +0 package.json
edit package.json

" vim: set ft=vim :

