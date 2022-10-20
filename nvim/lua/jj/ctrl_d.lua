
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function cmap(shortcut, command)
  map('c', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

vim.cmd([[ 
function! VisualSelection_fn()
    " Save register content and type.
    let old_reg     = getreg('"')
    let old_regmode = getregtype('"')

    " Calling this function has ended visual mode, so it must be started
    " again before the selection can be yanked into the unnamed register.
    normal! gvy
    let selection = @"

    " Restore register content and type.
    call setreg('"', old_reg, old_regmode)

    return selection
endfunction

function! Escaped_fn(text)
    call inputsave()
    let result = escape(a:text, '\\/.*$^~[]')
    let result = substitute(result, "\n$", "", "")
    let result = substitute(result, "\n", '\\n', "g")
    call inputrestore()
    return result
endfunction

]])

vmap('<leader>md', ":<C-U><cr>/<C-R><C-R>=Escaped_fn(VisualSelection_fn())<cr><cr>N")
nmap('<leader>md', ":<C-U><cr>/<C-R><C-R>=Escaped_fn(expand('<cword>'))<cr><cr>N")
vmap('<leader>ms', ":<C-U><cr>/\b<<C-R><C-R>=Escaped_fn(VisualSelection_fn())\b><cr><cr>N")
nmap('<leader>ms', ":<C-U><cr>/\b<<C-R><C-R>=Escaped_fn(expand('<cword>'))/\b<cr><cr>N")
--vnoremap <silent> <unique> <leader>md :<C-U><cr>/<C-R><C-R>=Escaped_fn(VisualSelection_fn())<cr><cr>
--vnoremap <silent> <unique> <leader>md :<C-U><cr>/<C-R><C-R>=Escaped_fn(VisualSelection_fn())<cr><cr>

