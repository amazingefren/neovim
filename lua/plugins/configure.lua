-- Plugin Configuration
require'plugins.lspconfig'
require'plugins.compe'
require'plugins.undotree'
require'plugins.telescope'
require'plugins.treesitter'
-- require'plugins.neoscroll'
require'colorizer'.setup()
require'gitsigns'.setup()
require'plugins.lspsaga'
require'plugins.nvimtree'
require'plugins.indentline'

-- Set Colorscheme
require'plugins.colorschemes.tokyonight'

-- Status Line & Bufferline
require'plugins.lualine'
require'bufferline'.setup()
    vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', {silent=true, noremap=true})
