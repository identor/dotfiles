" Tab navigation
nnoremap <leader>l :tabn<cr>
nnoremap <leader>h :tabp<cr>
" Tabonly
nnoremap <leader>to :tabo<cr>

" NERDTree
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>qq :qa!<cr>

" Session management

" Add/Save session
nnoremap <leader>sa :mksession $HOME/.vim/sessions/
nnoremap <leader>ss :mksession! $HOME/.vim/sessions/

" Load session
nnoremap <leader>sl :source $HOME/.vim/sessions/

" fugitive key bindings
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gpl :Gpull<cr>
nnoremap <leader>gps :Gpush<cr>

" Buffer delete
nnoremap <leader>d :bd<cr>
nnoremap <C-c> <Esc>
imap <C-c> <Esc>

" Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Toggle spacing
nnoremap <leader>sp :call ToggleSpacing()<cr>

