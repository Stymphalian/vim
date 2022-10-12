function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:GoToDefinition()
  if CocActionAsync('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

"autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format :call CocAction('format')1

let g:coc_global_extensions = [
  \ 'coc-jedi',
  \ 'coc-vimlsp',
  \ 'coc-clangd',
	\ 'coc-tsserver',
	\ 'coc-go',
	\ 'coc-json', 
	\ 'coc-git'
	\	]
let g:coc_disable_startup_warning = 1

"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"nmap <silent> <leader>gd :call <SID>GoToDefinition()<CR>
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gD <Plug>(coc-declaration)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gn <Plug>(coc-rename)
nmap <silent> <leader>ge <Plug>(coc-diagnostic-next)
"nmap <silent> <leader>ga <Plug>(coc-codeaction)
"nmap <silent> <leader>gl <Plug>(coc-codeaction-line)
"nmap <silent> <leader>gs <Plug>(coc-git-chunkinfo)
"nmap <silent> <leader>gm <Plug>(coc-git-commit)
"omap <silent> <leader>ig <Plug>(coc-git-chunk-inner)
"xmap <silent> <leader>ig <Plug>(coc-git-chunk-inner)

"nmap <silent> <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
"nmap <silent> <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
"nmap <silent> <expr> <C-d> <SID>select_current_word()
"nmap <silent> <C-c> <Plug>(coc-cursors-position)
"xmap <silent> <C-d> <Plug>(coc-cursors-range)

"nmap <leader>l  <Plug>(coc-codelens-action)
"nmap <leader>x  <Plug>(coc-cursors-operator)
nmap <leader>gR <Plug>(coc-refactor)
xmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>gf  <Plug>(coc-format-selected)<CR>
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

"inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-s> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

nnoremap <silent> <leader>gk :call <SID>show_documentation()<CR>
"nnoremap <silent><nowait> <leader>glo  :<C-u>CocList -A outline -kind<CR>
nnoremap <silent><nowait> <leader>go  :<C-u>CocList outline -kind<CR>
nnoremap <silent><nowait> <leader>ga  :<C-u>CocList diagnostics<CR>
"nnoremap <silent><nowait> <space>f  :<C-u>CocList files<CR>
"nnoremap <silent><nowait> <space>l  :<C-u>CocList lines<CR>
"nnoremap <silent><nowait> <space>q  :<C-u>CocList quickfix<CR>
"nnoremap <silent><nowait> <space>w  :<C-u>CocList -I -N symbols<CR>
"nnoremap <silent><nowait> <space>y  :<C-u>CocList -A --normal yank<CR>
"nnoremap <silent><nowait> <space>m  :<C-u>CocList -A -N mru<CR>
"nnoremap <silent><nowait> <space>b  :<C-u>CocList -A -N --normal buffers<CR>
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"nnoremap <silent><nowait> <space>s  :exe 'CocList -A -I --normal --input='.expand('<cword>').' words'<CR>
"nnoremap <silent><nowait> <space>S  :exe 'CocList -A --normal grep '.expand('<cword>').''<CR>
"nnoremap <silent><nowait> <space>d  :call CocActionAsync('jumpDefinition', v:false)<CR>

"imap <C-k> <Plug>(coc-snippets-expand)
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"call coc#add_command('tree', 'Vexplore', 'open netrw explorer')
" }} coc.nvim




