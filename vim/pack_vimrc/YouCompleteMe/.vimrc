"""YouCompleteMe
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GetDoc<CR>

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0


"Allow us to use virtualenv python with YouCompleteMe
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }

" Add to ~/global_extra_config.py
"def Settings( **kwargs ):
"    client_data = kwargs[ 'client_data' ]
"    return {
"      'interpreter_path': client_data[ 'g:ycm_python_interpreter_path' ],
"      'sys_path': client_data[ 'g:ycm_python_sys_path' ]
"    }

