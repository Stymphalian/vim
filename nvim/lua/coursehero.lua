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

