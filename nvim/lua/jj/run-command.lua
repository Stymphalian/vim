
vim.g.neoterm_autoscroll=true

local function get_command(extension)
  if extension == "py" then
      return "python"
  elseif extension == "rs" then
      return "cargo run --"
  end
  return "cat"
end

local function run_current_using_nvim_terminal()
  local current_file = vim.fn.expand("%:t")
  local ext = vim.fn.expand('%:e')
  local cmd = get_command(ext) .. ' ' .. current_file

  if vim.g.neoterm.last_id ~= 0 then
    local id = vim.g.neoterm.last_id
    local instance = vim.g.neoterm.instances[tostring(id)]
    if vim.fn.bufwinnr(instance.buffer_id) <= 0 then
      vim.cmd('bot split')
      vim.cmd('resize 5')
      vim.cmd("call neoterm#open({'target': " .. id .. "})")
    end
    vim.cmd("call neoterm#do({'cmd': 'clear', 'target': " .. id .. "})")
    vim.cmd("call neoterm#do({'cmd': '" .. cmd .. "', 'target': ".. id .. " })")
  else
    vim.cmd('bot split')
    vim.cmd('resize 5')
    vim.cmd('enew')
    vim.cmd('call neoterm#new()')
    vim.cmd("call neoterm#do({'cmd': 'clear'})")
    vim.cmd("call neoterm#do({'cmd': '" .. cmd .. "' })")
  end
end

local function run_current_using_tmux()
  local current_file = vim.fn.expand("%:t")
  local ext = vim.fn.expand('%:e')
  local cmd = get_command(ext) .. ' ' .. current_file

  local tmux_session = "default";
  local win_name = "runner";
  local session_window = tmux_session .. ":" .. win_name

  -- check if a tmux session exists
  vim.cmd("silent :! tmux has-session -t " .. tmux_session)
  local has_tmux_session = vim.v.shell_error == 0

  -- if no session exists then stop, ask the User to start a tmux session
  if not has_tmux_session then
    vim.pretty_print("Please start a tmux session first")
    return
  end

  -- if a session exists then check for the 'runner' window
  vim.cmd("silent :! tmux select-window -t " .. session_window)
  local has_window = vim.v.shell_error == 0

  -- if the window does not exist the create it
  if not has_window then
    vim.cmd('silent :! tmux new-window -c "$PWD" -n ' .. win_name ..' -t ' .. tmux_session)
    --print('Please start a window called "' .. win_name ..'" in the tmux session')
    --return
  end

  -- Use tmux 'send-keys' to run the command
  vim.cmd('silent :! tmux send-keys -t ' .. session_window .. ' "' .. cmd .. '" ENTER')

  -- Go back to the previous window
  vim.cmd("silent :! tmux last-window -t " .. tmux_session)
end

local bufopts= {noremap=true, silent=true}
vim.keymap.set('n', '<leader>mr', run_current_using_tmux, bufopts)
vim.keymap.set('n', '<leader>mR', run_current_using_nvim_terminal, bufopts)
--nmap('<leader>mr', run_current)

--vim.cmd([[
--  function! GetCommand(extension)
--    if a:extension == "rb"
--      return "ruby"
--    elseif a:extension == "js"
--      return "node"
--    elseif a:extension == "ts"
--      return "tsc"
--    elseif a:extension == "py"
--      return "python"
--    elseif a:extension == "rs" 
--      return "cargo run"
--    endif
--    return "cat"
--  endfunction
--
--  function! RunCurrent()
--    let l:currentFile = expand('%:t')
--    let l:extension = expand('%:e')
--    let l:cmd = GetCommand(l:extension) . " " . l:currentFile
--    if g:neoterm.has_any()
--      let l:id = g:neoterm.last_id
--      let l:instance = g:neoterm.instances[l:id]
--      if bufwinnr(l:instance.buffer_id) <= 0
--        execute "split"
--        execute "resize 20"
--        call neoterm#open({ 'target': l:id })
--      endif
--      call neoterm#do({ 'cmd': "clear", 'target': l:id })
--      call neoterm#do({ 'cmd': l:cmd, 'target': l:id })
--    else
--      execute "split"
--      execute "resize 20"
--      execute "enew"
--      call neoterm#new()
--      call neoterm#do({ 'cmd': "clear" })
--      call neoterm#do({ 'cmd': l:cmd })
--    endif
--  endfunction
--  command RunCurrentFile call RunCurrent()
--]])

--nmap("<leader>r", "<cmd>RunCurrentFile<cr>")
