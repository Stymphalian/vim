if !has('nvim')
  finish
endif

" ctrl+b, ctrl+p to scroll through options

lua << EOF
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    scroll_strategy = "limit",
    mappings = {
      i = {
        ["jk"] = require('telescope.actions').close,
        ["<C-J>"] = require('telescope.actions').move_selection_next,
        ["<C-K>"] = require('telescope.actions').move_selection_previous,
      },
    },
    preview = false,
    vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--ignore-file=/home/jyu/.ignore"
    }

  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
EOF

nnoremap <leader>p  <cmd>Telescope find_files<cr>
nnoremap <leader>P <cmd>Telescope<cr>
nnoremap <leader>pa <cmd>Telescope help_tags<cr>
nnoremap <leader>ps <cmd>Telescope buffers<cr>
nnoremap <leader>pd <cmd>Telescope grep_string<cr>
nnoremap <leader>pf <cmd>Telescope live_grep<cr>
