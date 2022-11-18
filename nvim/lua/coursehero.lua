vim.cmd([[
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Run sync on File change -> for Course Hero monolith development
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! WriteToMonitor()
    let absolutePath = expand("%:p")
    let isInMono = 0

    " File path relative to directory
    " in which Vim is invoked.
    " For the sync to work properly,
    " Vim needs to be started inside
    " `websites/coursehero/src`
    let relative = @%

    for segment in split(absolutePath, "/")
      if segment == "Symfony"
        let isInMono = 1
      endif
    endfor

    if isInMono == 1
      execute '!echo ' . relative . ' >> /Users/jyu/MONITOR.txt'
    endif

  endfunction

  autocmd BufWritePost * silent call WriteToMonitor()
]])


--vim.cmd([[
--  if executable('ag')
--    let g:ackprg = 'ag --vimgrep'
--  endif
--]])


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
let g:fzf_command_prefix = 'FzfVim'
]])


-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>P', "<cmd>Telescope<cr>", {})
vim.keymap.set('n', '<leader>p', "<cmd>FzfVimGFiles<cr>", {})
--vim.keymap.set('n', '<leader>p', builtin.find_files, {})
--vim.keymap.set('n', '<leader>pa', builtin.help_tags, {desc="help tags"})
--vim.keymap.set('n', '<leader>ps', builtin.buffers, {desc = "buffers"})
vim.keymap.set('n', '<leader>pd', builtin.grep_string, {desc = "grep_string"})
vim.keymap.set('n', '<leader>pD', ":FzfVimRg <C-r>=expand('<cword>')<cr><cr>", {})
vim.keymap.set('n', '<leader>pf', builtin.live_grep, {desc = "live_grep"})
--vim.keymap.set('n', '<leader>pr', builtin.resume, {desc = "resume"})
vim.keymap.set('n', '<leader>pe', builtin.git_status, {desc = "git_status"})
vim.keymap.set('n', '<leader>pw', builtin.oldfiles, {desc="oldfiles"})

local function jj_get_link_to_master()
  -- Get the current relative path
  local workspace_dir = vim.fn.getcwd()
  local relative_path = vim.fn.expand("%:p")
  relative_path = string.sub(relative_path, string.len(workspace_dir)+1)

  -- Get the current line number of the cursor
  local line_number = vim.fn.line(".")

  -- Get the current branch name
  local branch = 'master'

  -- Get the git remote url as https:// URL
  local cmd = ":! git remote get-url origin"
  local origin_url = vim.api.nvim_exec(cmd, true)
  origin_url = vim.trim(origin_url)
  origin_url = string.sub(origin_url, string.len(cmd) + 4)
  origin_url = string.gsub(origin_url, "git@", "https://")
  origin_url = string.gsub(origin_url, "[.]git", "")
  origin_url = string.gsub(origin_url, "git.coursehero.com:", "git.coursehero.com/")

  -- Combine the branch name and relative path name
  local git_url = string.format("%s/-/blob/%s", origin_url, branch)
  local final_path = git_url .. relative_path .. "#L" .. line_number
  print(final_path)

  -- Put the final_path into the clipboard buffer
  vim.fn.setreg("+", final_path)
end

local function jj_get_link_to_branch()
  -- Get the current relative path
  local workspace_dir = vim.fn.getcwd()
  local relative_path = vim.fn.expand("%:p")
  relative_path = string.sub(relative_path, string.len(workspace_dir)+1)

  -- Get the current line number of the cursor
  local line_number = vim.fn.line(".")

  -- Get the current branch name
  local cmd = ":! git rev-parse --abbrev-ref HEAD"
  local branch = vim.api.nvim_exec(cmd, true)
  branch = vim.trim(branch)
  branch = string.sub(branch, string.len(cmd) + 4)

  -- Get the git remote url as https:// URL
  cmd = ":! git remote get-url origin"
  local origin_url = vim.api.nvim_exec(cmd, true)
  origin_url = vim.trim(origin_url)
  origin_url = string.sub(origin_url, string.len(cmd) + 4)
  origin_url = string.gsub(origin_url, "git@", "https://")
  origin_url = string.gsub(origin_url, "[.]git", "")
  origin_url = string.gsub(origin_url, "git.coursehero.com:", "git.coursehero.com/")

  -- Combine the branch name and relative path name
  local git_url = string.format("%s/-/blob/%s", origin_url, branch)
  local final_path = git_url .. relative_path .. "#L" .. line_number
  print(final_path)

  -- Put the final_path into the clipboard buffer
  vim.fn.setreg("+", final_path)
end

local function jj_get_link_to_commit()
  -- Get the current relative path
  local workspace_dir = vim.fn.getcwd()
  local relative_path = vim.fn.expand("%:p")
  relative_path = string.sub(relative_path, string.len(workspace_dir)+1)

  -- Get the current line number of the cursor
  local line_number = vim.fn.line(".")

  -- Get the current branch name
  local full_path = vim.fn.expand('%:p')
  local cmd = ':! git log -n 1 --pretty=format:"\\%H" -- ' .. full_path
  local branch = vim.api.nvim_exec(cmd, true)
  branch = vim.trim(branch)
  branch = string.sub(branch, string.len(cmd) + 3)

  -- Get the git remote url as https:// URL
  cmd = ":! git remote get-url origin"
  local origin_url = vim.api.nvim_exec(cmd, true)
  origin_url = vim.trim(origin_url)
  origin_url = string.sub(origin_url, string.len(cmd) + 4)
  origin_url = string.gsub(origin_url, "git@", "https://")
  origin_url = string.gsub(origin_url, "[.]git", "")
  origin_url = string.gsub(origin_url, "git.coursehero.com:", "git.coursehero.com/")

  -- Combine the branch name and relative path name
  local git_url = string.format("%s/-/blob/%s", origin_url, branch)
  local final_path = git_url .. relative_path .. "#L" .. line_number
  print(final_path)

  -- Put the final_path into the clipboard buffer
  vim.fn.setreg("+", final_path)
end


vim.keymap.set('n', '<leader>wm', jj_get_link_to_master)
vim.keymap.set('n', '<leader>wb', jj_get_link_to_branch)
vim.keymap.set('n', '<leader>wc', jj_get_link_to_commit)



