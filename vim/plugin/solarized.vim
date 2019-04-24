" Color settings
let solarized_dir="$HOME/.vim/plugged/vim-colors-solarized"

if has('windows') && !has('unix') && !has('gui_running')
  set bg=dark
  colo torte
elseif isdirectory(expand(solarized_dir))
  " Color scheme
  set t_Co=256
  set bg=light
  let g:solarized_termcolors = 256
  let g:solarized_termtrans = 1
  let g:solarized_contrast = 'normal'
  let g:solarized_visibility = 'normal'
  colo solarized
endif

