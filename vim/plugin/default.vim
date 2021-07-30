" Don't break C^X C^F
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Update time
se updatetime=1000

" Set shell
se shell=/bin/zsh

" Set clipboard
if has('clipboard') && has('vim_starting')
  se clipboard& clipboard^=unnamed,unnamedplus
endif

if exists('##TextYankPost')
  augroup BlinkClipboardIntegration
    autocmd!
    autocmd TextYankPost * silent! if v:event.operator ==# 'y' | call YankOSC52(join(v:event["regcontents"],"\n")) | endif
  augroup END
endif

if has('wsl')
  echo 'hello!'
endif

" My defaults
se nocompatible mouse=a nowrap relativenumber list ts=4 sw=4 sts=4

" Set temp directory
se backupdir=$HOME/.vimswap directory=$HOME/.vimswap

" Default find settings
se wildignore+=node_modules/** path+=src/** path+=lib/**

" Map leader to unused key in normal mode
let mapleader = ' '

" More natural split behavior
se splitbelow
se splitright

" Modeline
se modeline

" cd to dir if opening a directory
autocmd StdinReadPre * let std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("std_in") | ene | exe 'cd' argv()[0] | echo '' | endif
" Test function
function ToggleSpacing()
  let spacing=&l:ts

  if spacing == 2
    let spacing += 2
  else
    let spacing += -2
  endif

  echo 'Spacing set to' spacing

  " Set spacing
  let &l:ts=spacing
  let &l:sw=spacing
  let &l:sts=spacing
endfunction

