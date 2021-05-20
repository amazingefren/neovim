-- Plugin Configuration
require'plugins.lspconfig'
require'plugins.compe'
require'plugins.undotree'
require'plugins.telescope'
require'plugins.treesitter'
require'gitsigns'.setup()
require'plugins.lspsaga'
require'plugins.nvimtree'
require'plugins.indentline'
require'plugins.kommentary'
-- Hop
vim.api.nvim_set_keymap('n', 'f', '<cmd>lua require"hop".hint_words()<CR>', {silent=true, noremap=true})
-- Reload
vim.api.nvim_set_keymap('n', '<Leader>r', '<cmd>Reload<CR>', {silent=true, noremap=true})
-- Bufferline
require'bufferline'.setup()
vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', {silent=true, noremap=true})

-- Set Colorscheme
require'plugins.colorschemes.bogsterish'

require'colorizer'.setup()
