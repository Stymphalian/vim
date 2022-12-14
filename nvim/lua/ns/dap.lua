if IS_HOME then
  vim.g.vimspector_install_gadget = {'CodeLLDB'};
else
  vim.g.vimspector_install_gadget = {'vscode-php-debug'};
end

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>d5',  ':call vimspector#Launch()<CR>', bufopts);
vim.keymap.set('n', '<Leader>d7',  ':call vimspector#Restart()<CR>', bufopts);
vim.keymap.set('n', '<Leader>d8',  ':call vimspector#Pause()<CR>', bufopts);
vim.keymap.set('n', '<Leader>d9',  ':call vimspector#Stop()<CR>', bufopts);
vim.keymap.set('n', '<Leader>d0',  ':call vimspector#Reset()<CR>', bufopts);
vim.keymap.set('n', '<Leader>dc',  ':call vimspector#Continue()<CR>', bufopts);

vim.keymap.set('n', '<Leader>di',  ':call vimspector#GoToCurrentLine()<CR>', bufopts);
vim.keymap.set('n', '<Leader>dr',  ':call vimspector#RunToCursor()<CR>', bufopts);

vim.keymap.set('n', '<Leader>dt',  ':call vimspector#ToggleBreakpoint()<CR>', bufopts);
vim.keymap.set('n', '<Leader>dT',  ':call vimspector#ClearBreakpoints()<CR>', bufopts);

vim.keymap.set('n', '<Leader>dk',  '<Plug>VimspectorReset', bufopts);
vim.keymap.set('n', '<Leader>dh',  '<Plug>VimspectorStepOut', bufopts);
--vim.keymap.set('n', '<Leader>do',  '<Plug>VimspectorStepOut', bufopts);
vim.keymap.set('n', '<Leader>dl',  '<Plug>VimspectorStepInto', bufopts);
--vim.keymap.set('n', '<Leader>di',  '<Plug>VimspectorStepInto', bufopts);
vim.keymap.set('n', '<Leader>dj',  '<Plug>VimspectorStepOver', bufopts);

--[[

Rust Debugs
{
  "configurations": {
    "launch": {
      "adapter": "CodeLLDB",
      "configuration": {
        "request": "launch",
        "program": "${workspaceRoot}/target/debug/rayt"
      },
      "breakpoints": {
        "exception": {
          "caught": "",
          "uncaught": "Y"
        }
      }
    }
  }
}
--]]
