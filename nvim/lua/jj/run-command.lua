
vim.g.neoterm_autoscroll=true

local function get_command(extension)
  if extension == "py" then
      return "python"
  elseif extension == "rs" then
      return "cargo run --"
  end
  return "cat"
end

local function run_current()
  local current_file = vim.fn.expand("%:t")
  local ext = vim.fn.expand('%:e')
  local cmd = get_command(ext) .. ' ' .. current_file
  --vim.pretty_print(cmd)

  if vim.g.neoterm.last_id ~= 0 then
    --print("neoterm exists")
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

  return "hello"
end

local bufopts= {noremap=true, silent=true}
vim.keymap.set('n', '<leader>mr', run_current, bufopts)

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
