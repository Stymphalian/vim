"" CtrlP _vimrc
""

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|__pycache__|venv|\.venv|thirdparty)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_map=''             "Use leader instead of the default mapping
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 250  "only update preview after 250 ms
let g:ctrlp_max_history = 0    "unlimited history
let g:ctrlp_regexp=1           "by default have ctrlp serach by regex
let g:ctrlp_use_caching=0      "disable any caching for ctrlp,
let g:ctrlp_follow_symlinks=0  "follow symlinks but ignore loops
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:0'

if executable('ag')
  " use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in ctrlp for listing files. super fast and respects .gitignore
  let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden 
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_store
    \ --ignore "**/*.pyc"
    \ --ignore .venv
    \ --ignore venv
    \ -g ""'

  "let g:ctrlp_directories = [
  "      \ '/home/jordan/dev/lab/rust/play',
  "      \ '/home/jordan/dev/lab/rust/play'
  "      \ ]
  "let g:ctrlp_user_command = join(map(copy(g:ctrlp_directories),
  "      \ '''/usr/bin/ag '' . v:val . '' --nocolor --nogroup --ignore "**/*.pyc" --ignore .git --ignore .hg --ignore .DS_Store -g ""'''), ' ; ') 
  "      \ . '/usr/bin/ag %s -i           --nocolor --nogroup --ignore "**/*.pyc" --ignore .git --ignore .hg --ignore .DS_Store -g "" ; ' 
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif
        
" Easy bindings for its various modes
nmap <leader>m :CtrlP<cr>
nmap <leader>m1 :CtrlPBuffer<cr>
nmap <leader>m2 :CtrlPMixed<cr>
nmap <leader>m3 :CtrlPMRU<cr>
