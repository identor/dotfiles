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

" Fzf bindings
nnoremap <leader>ff :Ag!<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>flb :BLines<cr>
nnoremap <leader>fh :History:<cr>
nnoremap <leader>fs :History/<cr>
nnoremap <leader>fc :Commit<cr>
nnoremap <leader>fcb :BCommit<cr>
nnoremap <leader>fm :Maps<cr>

" CtrlP fzf
nnoremap <C-p> :GFiles!<cr>

" Conquer of Code
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call coc_custom#show_documentation()<CR>

" Terminal navigation
tnoremap <leader>wh <C-\><C-N><C-w>h
tnoremap <leader>wj <C-\><C-N><C-w>j
tnoremap <leader>wk <C-\><C-N><C-w>k
tnoremap <leader>wl <C-\><C-N><C-w>l
inoremap <leader>wh <C-\><C-N><C-w>h
inoremap <leader>wj <C-\><C-N><C-w>j
inoremap <leader>wk <C-\><C-N><C-w>k
inoremap <leader>wl <C-\><C-N><C-w>l
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
