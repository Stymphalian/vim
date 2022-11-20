if IS_HOME then
  vim.g.vimspector_install_gadget = {'CodeLLDB'};
else
  vim.g.vimspector_install_gadget = {'vscode-php-debug'};
end

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>e5',  ':call vimspector#Launch()<CR>', bufopts);
vim.keymap.set('n', '<Leader>e7',  ':call vimspector#Restart()<CR>', bufopts);
vim.keymap.set('n', '<Leader>e8',  ':call vimspector#Pause()<CR>', bufopts);
vim.keymap.set('n', '<Leader>e9',  ':call vimspector#Stop()<CR>', bufopts);
vim.keymap.set('n', '<Leader>e0',  ':call vimspector#Reset()<CR>', bufopts);
vim.keymap.set('n', '<Leader>ec',  ':call vimspector#Continue()<CR>', bufopts);

vim.keymap.set('n', '<Leader>eg',  ':call vimspector#GoToCurrentLine()<CR>', bufopts);
vim.keymap.set('n', '<Leader>er',  ':call vimspector#RunToCursor()<CR>', bufopts);

vim.keymap.set('n', '<Leader>et',  ':call vimspector#ToggleBreakpoint()<CR>', bufopts);
vim.keymap.set('n', '<Leader>eT',  ':call vimspector#ClearBreakpoints()<CR>', bufopts);

vim.keymap.set('n', '<Leader>ek',  '<Plug>VimspectorReset', bufopts);
--vim.keymap.set('n', '<Leader>eh',  '<Plug>VimspectorStepOut', bufopts);
vim.keymap.set('n', '<Leader>eo',  '<Plug>VimspectorStepOut', bufopts);
--vim.keymap.set('n', '<Leader>el',  '<Plug>VimspectorStepInto', bufopts);
vim.keymap.set('n', '<Leader>ei',  '<Plug>VimspectorStepInto', bufopts);
vim.keymap.set('n', '<Leader>ej',  '<Plug>VimspectorStepOver', bufopts);

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
