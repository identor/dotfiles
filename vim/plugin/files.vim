" Ctrlp ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|(node_modules))$',
  \ 'file': '\v\.(exe|so|dll|zip|gz|rar)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = [
  \ '.git/',
  \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
  \ ]

" Commenter
let g:NERDSpaceDelims = 1

