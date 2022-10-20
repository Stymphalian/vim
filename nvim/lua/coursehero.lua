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


vim.cmd([[
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
]])


-- Work Telescope settings
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>P', "<cmd>Telescope<cr>", {})

vim.keymap.set('n', '<leader>pa', builtin.help_tags, {desc="help tags"})
vim.keymap.set('n', '<leader>ps', builtin.buffers, {desc = "buffers"})
vim.keymap.set('n', '<leader>pd', builtin.grep_string, {desc = "grep_string"})
vim.keymap.set('n', '<leader>pf', builtin.live_grep, {desc = "live_grep"})

vim.keymap.set('n', '<leader>pr', builtin.resume, {desc = "resume"})
vim.keymap.set('n', '<leader>pe', builtin.git_status, {desc = "git_status"})
vim.keymap.set('n', '<leader>pw',
  "<cmd>:lua require'telescope.builtin'.oldfiles{only_cwd=true}<cr>",
  {desc = "oldfiles"}
)

local function isempty(s)
  return s == nil or s == ''
end

function GetLinkToMaster()
  -- Get the current relative path
  --local relative_path = vim.cmd([[expand("%")<cr>]])
  --local relative_path = vim.fn.getreg("%")
  local relative_path = vim.fn.expand("%:p")
  if isempty(relative_path) then
    print("path is nil");
  else
    print(relative_path)
  end

  vim.api.nvim_echo({{relative_path}}, false, {})
  print(relative_path)

  -- Get the current branch name
  local cmd = ":! git rev-parse --abbrev-ref HEAD"
  local branch = vim.api.nvim_exec(cmd, true)
  -- cut the cmd out of the output
  print(branch)

  -- Combine the branch name and relative path name
  local repo_name = "https://git.coursehero.com/" .. branch .. "/" .. relative_path
  print(repo_name)

  -- put into the clipboard register
  print("end function")
end

vim.api.nvim_echo({{"hello"}}, false, {})
print("goodbye")
GetLinkToMaster()
