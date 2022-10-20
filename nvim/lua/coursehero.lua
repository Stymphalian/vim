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
