-- Work Telescope settings
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    selection_strategy = "row",
    scroll_strategy = "limit",
    mappings = {
      i = {
        ["jk"] = require('telescope.actions').close,
        ["<C-J>"] = require('telescope.actions').move_selection_next,
        ["<C-K>"] = require('telescope.actions').move_selection_previous,
      },
    },
    preview = false,
    --preview = true,
    vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--ignore-file=/Users/jyu/.ignore"
    },
    layout_strategy = "center",
    layout_config = {
      center = {
        anchor = "S",
        width = 0.9,
        height = 0.4,
        prompt_position = "bottom",
      }
    },
    --file_sorter = require('telescope.sorters').get_fzy_sorter
    --path_display = { "shorten" },
    --dynamic_preview_title
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    oldfiles = {
      only_cwd=true
    }
  },
  extensions = {
    fzf = {
      case_mode = "ignore_case",
      --fuzzy = false,
      --override_file_sorter = true,
    },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
require('telescope').load_extension('fzf')


-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>P', "<cmd>Telescope<cr>", {})
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
--vim.keymap.set('n', '<leader>p', "<cmd>FzfFiles<cr>", {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {desc = "buffers"})
vim.keymap.set('n', '<leader>pd', builtin.grep_string, {desc = "grep_string"})
vim.keymap.set('n', '<leader>pD', ":FzfRg <C-r>=expand('<cword>')<cr><cr>", {})
vim.keymap.set('n', '<leader>pf', builtin.live_grep, {desc = "live_grep"})
vim.keymap.set('n', '<leader>pr', builtin.resume, {desc = "resume"})
vim.keymap.set('n', '<leader>pe', builtin.git_status, {desc = "git_status"})
vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {desc="lsp_document_symbols"})
vim.keymap.set('n', '<leader>pw', builtin.lsp_workspace_symbols, {desc="lsp_workspace_symbols"})
--vim.keymap.set('n', '<leader>pw', builtin.oldfiles, {desc="oldfiles"})
