"let g:rustc_path - $HOME.".cargo/bin/rustc"
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 0

" Run 'cargo test', Runs all the tests
nnoremap <leader>rt    :RustTest!<CR>

" Run a single test. The one under the current cursor
nnoremap <leader>rt1   :RustTest<CR>

" rust fmt the file
nnoremap <leader>rf    :RustFmt<CR>
