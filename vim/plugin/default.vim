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

