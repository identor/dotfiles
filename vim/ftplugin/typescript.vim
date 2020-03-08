let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

se et ts=2 sw=2 sts=2

autocmd FileType typescript setlocal completeopt=menu
autocmd FileType typescript setlocal makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
