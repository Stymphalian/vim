local util = require 'lspconfig/util'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  --local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  --vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('i', '<C-0>', '<cmd>vim.lsp.buf.signature_help()<cr>', bufopts)
  --vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  --vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('v', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  --vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
end

local function setup_servers()
  local ensure_installed = {
    "sumneko_lua",
    "pyright",
    "jsonls",
    "tsserver"
  };

  --vim.pretty_print(vim.g.IS_HOME);
  --vim.pretty_print(vim.g.IS_WORK);
  --vim.pretty_print(IS_HOME);
  --vim.pretty_print(IS_WORK);
  if IS_WORK then
    table.insert(ensure_installed, "gopls");
    table.insert(ensure_installed, "intelephense");
  else 
    table.insert(ensure_installed, "rust_analyzer");
  end


  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = ensure_installed
  })

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {
        rustfmt = {
          rangeFormatter = {
            enable = true
          },
          extraArgs = {
            "--config",
            "max_width=80",
          }
        },
        completion = {
          postfix = {
            -- actually removed the snippets
            enable = false
          },
          snippets = {
            -- Remove the snippets
            custom = {}
          }
        },
      }
    }
  }

  require('lspconfig')['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    -- server-specific settings
    filetypes = { "lua" },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          --library = {
          --[vim.fn.expand('$VIMRUNTIME/lua')] = true,
          --[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          --},
          library = vim.api.nvim_get_runtime_file("", true),
          maxPreload = 100000
        },
        telemetry = {
          enable = false
        }
      }
    }
  }

  require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    }
  }

  require('lspconfig')['jsonls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
      jsonls = {}
    }
  }

  require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
      tsserver = {}
    }
  }

  --require('lspconfig')['glslls'].setup {
  --  on_attach = on_attach,
  --  flags = lsp_flags,
  --  capabilities = capabilities,
  --  settings = {
  --    glslls = {}
  --  }
  --}
  --

  if IS_WORK then
    require('lspconfig')['intelephense'].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      settings = {
        intelephense = {}
      }
    }

    require('lspconfig')['gopls'].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      settings = {
        gopls = {}
      }
    }
  end

end

--require('nlua.lsp.nvim').setup(require('lspconfig'), {
--on_attach = on_attach,
--})

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require 'mason'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
