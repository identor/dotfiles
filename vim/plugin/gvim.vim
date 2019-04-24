" If gvim
if has('gui_running')
  " Remove toolbars
  set guioptions-=T  "remove toolbar
  set guioptions-=m  "remove menu bar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar

  " Try Fira Code rendering
  let g:gtk_nocache=[0x00000000, 0xfc00ffff, 0xf8000001, 0x78000001]

  " Set gui font
  if has('unix')
    set guifont=Fira\ Code\ Light\ 9
    set guifontwide=Fira\ Code\ Light\ 9
  else
    set guifont=Consolas:h9
  endif
endif

