local telescope = require('telescope')
local treesitter = require('nvim-treesitter.configs')
local nvimtree = require('nvim-tree')
local lualine = require('lualine')
local neotest = require('neotest');


treesitter.setup({
  ensure_installed = 'javascript',
  highlight = {
    enable = true,
  },
})


telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg', -- Use ripgrep for searching
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = " ", -- Icon for the prompt
    selection_caret = "➜ ", -- Icon for the selection
    path_display = { "truncate" }, -- Truncate long file paths
    mappings = {
      i = {
        ['<C-n>'] = require('telescope.actions').move_selection_next,     -- Next item
        ['<C-p>'] = require('telescope.actions').move_selection_previous, -- Previous item
        ['<C-c>'] = require('telescope.actions').close,                   -- Close Telescope
      },
      n = {
        ['q'] = require('telescope.actions').close, -- Close Telescope
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true, -- Include hidden files
    },
    live_grep = {
      additional_args = function() return { "--hidden" } end, -- Search hidden files
    },
  },
  extensions = {
  },
})

neotest.setup({
  adapters = {
    require("neotest-dotnet")
  }}
)

nvimtree.setup({
  view = {
    width = 30,
    side = 'left',
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
    },
  },
  git = {
    enable = true,       -- Show git status
  },
})

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
