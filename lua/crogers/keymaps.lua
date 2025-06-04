local keymap = vim.keymap.set
local builtin = require('telescope.builtin')
local pretty_hover = require('pretty_hover')

local actions = require('crogers.actions')
local nuget = require('crogers.nuget')

-- Keybindings
keymap('n', '<leader>w', ':w<CR>', { desc = "Save file" })
keymap('n', '<leader>q', ':q<CR>', { desc = "Quit" })
keymap('n', '<C-C>', ':nohlsearch<CR>', { desc = "Clear search highlights" })

-- Window navigation
keymap('n', '<C-J>', '<C-W>j', { desc = "Move to window below" })
keymap('n', '<C-K>', '<C-W>k', { desc = "Move to window above" })
keymap('n', '<C-L>', '<C-W>l', { desc = "Move to window right" })
keymap('n', '<C-H>', '<C-W>h', { desc = "Move to window left" })
keymap('t', '<C-J>', '<C-W>j', { desc = "Move to window below" })
keymap('t', '<C-K>', '<C-W>k', { desc = "Move to window above" })
keymap('t', '<C-L>', '<C-W>l', { desc = "Move to window right" })
keymap('t', '<C-H>', '<C-W>h', { desc = "Move to window left" })

keymap('t', '<C-h>',  '<C-\\><C-N><C-w>h', {})
keymap('t', '<C-j>',  '<C-\\><C-N><C-w>j', {})
keymap('t', '<C-k>',    '<C-\\><C-N><C-w>k', {})

keymap('t', '<C-l>', '<C-C><CR>clear<CR>', {})

-- Plugin mappings
keymap('n', '<leader>n', ':lua Snacks.explorer()<CR>', { desc = "Toggle file tree" })
keymap('n', '<C-N>', ':lua Snacks.explorer()<CR>', { desc = "Toggle file tree" })
keymap('i', '<C-N>', '<C-\\><C-N>:NvimTreeToggle<CR>', { desc = "Toggle file tree" })
keymap('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
keymap('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
keymap('n', '<leader>fb', builtin.buffers, { desc = "List buffers" })
keymap('n', '<leader>fu', builtin.lsp_references, { desc = "Go to definition" })
keymap('n', '<leader>fc', ':Easypick changed_files', { desc = "View changed files" })

keymap('v', 'fg', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', { desc = "Live grep selection" })



keymap('n', '<leader>z', ':lua Snacks.zen()<CR>', { desc = "Zen Mode" })
keymap('n', '<leader>gg', ':lua Snacks.lazygit()<CR>', { desc = "lazygit" })
keymap('n', '<leader>gd', ':Gitsigns toggle_word_diff<CR>', { desc = "Git diff" })
keymap('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { desc = "Git diff" })
keymap('n', '<leader>gb', ':Gitsigns blame<CR>', { desc = "Git blame" })
keymap('n', '<C-T>', ':lua Snacks.terminal.toggle()<CR>', { desc = "Toggle terminal" })
keymap('t', '<C-T>', '<C-\\><C-N>:lua Snacks.terminal.toggle()<CR>', { desc = "Toggle terminal" })
keymap('n', 'go', '<cmd>topleft Outline<CR>', { desc = "Open document outline" })


keymap('n', '<leader>t', ':Trouble diagnostics toggle<cr>', {desc = "Open trouble" } )


keymap('n', '<leader>ut', '<cmd>lua require("neotest").run.run()<cr><cmd>Neotest output open<cr>', {} )
keymap('n', '<leader>uf', '<cmd>Neotest run file<cr><cmd>Neotest summary open<cr>', {} )

keymap('n', 'cd', '<cmd>lua require("neogen").generate()<CR>', {desc = "create documentation snippet" } )

-- LSP Mappings
keymap('n', 'K', pretty_hover.hover, { desc = "Show hover" })
keymap('n', '<leader>k', pretty_hover.hover, { desc = "Show hover" })
keymap('n', 'K', pretty_hover.hover, {desc='show hover'})
keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')

-- Go-to mappings
keymap('n', '<Leader>sn', nuget.installed, { desc = "show installed nuget packages" })
keymap('n', 'gd', actions.goto_definition_or_show_usages, { desc = "Go to definition or show usages" })
keymap('n', '<leader>d', actions.goto_definition_or_show_usages, { desc = "Go to definition" })
keymap('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap('n', '<leader>i', vim.lsp.buf.implementation, { desc = "Go to implementation" })




-- Miscellaneous
keymap('n', 'Y', 'y$', { desc = "Yank to end of line" })
keymap('n', 'dd', '"_dd', { desc = "Delete line without copying" })
keymap('n', 'dw', '"_dw', { desc = "Delete word without copying" })
keymap('n', 'diw', '"_diw', { desc = "Delete inner word without copying" })

-- Visual mode re-indent and stay in selection
keymap('v', '>', '>gv', { desc = "Indent selection and stay in visual mode" })
keymap('v', '<', '<gv', { desc = "Un-indent selection and stay in visual mode" })
