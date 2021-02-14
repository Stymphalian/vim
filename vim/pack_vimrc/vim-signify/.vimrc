"signify
"    ]c   Jump to next hunk.
"    [c   Jump to previous hunk.
"

let g:signify_vcs_list = [ 'git', 'hg' ] "only do dffs for mercurial and git
let g:signify_line_highlight = 0         "do not highlight the entire line

nmap <leader>cj <plug>(signify-next-hunk)
nmap <leader>ck <plug>(signify-prev-hunk)
nmap <leader>cJ 9999<leader>cj 
nmap <leader>cK 9999<leader>ck 
nnoremap <leader>ct :SignifyToggle<cr>

