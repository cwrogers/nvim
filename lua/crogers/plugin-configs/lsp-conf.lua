local copilot = require('copilot')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

-- Initialize Mason
mason.setup()
mason_lspconfig.setup({
  ensure_installed = { 'pyright', 'ts_ls', 'lua_ls' }, -- Add your desired LSPs
  automatic_installation = true,
})

-- Setup LSP servers
mason_lspconfig.setup_handlers({
  function(server_name) -- Default handler
    lspconfig[server_name].setup({
    })
  end,
})

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

