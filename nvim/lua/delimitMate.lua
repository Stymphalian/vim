vim.cmd([[
  let delimitMate_matchpairs = "(:),[:],{:},<:>"

  augroup jj_delimitMate
      autocmd!
      autocmd FileType rust     let b:delimitMate_matchpairs = "(:),[:],{:}"
      autocmd FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
  augroup END
]]);

