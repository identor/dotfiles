let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_vim_ag_options = '--hidden --ignore .git'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 g:fzf_vim_ag_options,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:fzf_layout = { 'window': 'enew' }
