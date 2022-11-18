-- configure fzf
vim.cmd([[
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 
  \ 'window': { 
  \   'width': 1.0, 
  \   'height': 0.4,
  \   'relative': v:true, 
  \   'yoffset': 1.0, 
  \   'xoffset': 0.0 
  \ } }
"let g:fzf_preview_window = ['down,40%', 'ctrl-/']
let g:fzf_preview_window = []
let g:fzf_command_prefix = 'Fzf'

nnoremap <leader>pb :FzfBLines<cr>
]])
