return {
  'neovim/nvim-lspconfig',
  'zbirenbaum/copilot.lua',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'giuxtaposition/blink-cmp-copilot',
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'super-tab' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
          },
        },
      },
    },
    opts_extend = { 'sources.default' }
  },

}
