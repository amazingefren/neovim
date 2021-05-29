-- Set Colorscheme
require'plugins.colorschemes.bogsterish'

-- Plugin Configuration
require'plugins.lspconfig'
require'plugins.compe'
require'plugins.undotree'
require'plugins.telescope'
require'plugins.treesitter'
require'plugins.lspsaga'
require'plugins.nvimtree'
require'plugins.blankline'
require'plugins.kommentary'
require'lspkind'.init()

-- Hop
vim.api.nvim_set_keymap('n', 'f', '<cmd>lua require"hop".hint_words()<CR>', {silent=true, noremap=true})
-- Reload
-- vim.api.nvim_set_keymap('n', '<Leader>r', '<cmd>Reload<CR>', {silent=true, noremap=true})
-- Bufferline
require'bufferline'.setup()
vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', {silent=true, noremap=true})

-- require'colorizer'.setup()
require'gitsigns'.setup{
    signs = {
        add          = {hl = 'DiffAdd'   , text = ' │'},
        change       = {hl = 'DiffChange', text = ' │'},
        delete       = {hl = 'DiffDelete', text = ' │'},
        topdelete    = {hl = 'DiffDelete', text = '‾' },
        changedelete = {hl = 'DiffChange', text = '~' },
    },
}
