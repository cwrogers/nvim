-- local copilot = require('copilot')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

-- Initialize Mason
mason.setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry"
  }
})
mason_lspconfig.setup({
  ensure_installed = { 'pyright', 'ts_ls', 'lua_ls' },
  automatic_installation = true,
})

-- Setup LSP servers
mason_lspconfig.setup_handlers({
  function(server_name) -- Default handler
    lspconfig[server_name].setup({
    })
  end,
})

require("outline").setup()
require("roslyn").setup()

lspconfig.roslyn.setup({
  autostart = true
})

