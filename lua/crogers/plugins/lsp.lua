return {
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
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
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
        },
      },
    },
    opts_extend = { 'sources.default' }
  },
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    filewatching= true
  },
  {
    'hedyhli/outline.nvim',
    dependencies = {
      'epheien/outline-treesitter-provider.nvim'
    }
  }
}
