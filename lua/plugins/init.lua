--[[
✦　　 　　　. 　　　　 ✦
  　 .　　  　　　.　　　ﾟ　  .
　✦ 　　　,　　　　　　　.
　   ---------------------  .  ✦
.   /  git: amazingefren / 　✦
✦  /  my neovim config  / 　,
  /  work in progress  / ✦　.
  --------------------    .
. .　　ﾟ  ✦　    ✦　　　　.
✦　　 ﾟ　　. 　　　　 ✦
]]

--Packer Manager: Packer
--https://github.com/wbthomason/packer.nvim

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- LSP Config
    use 'neovim/nvim-lspconfig'

    -- Neovim Lua LSP
    use 'tjdevries/nlua.nvim'

    -- Completion
    use {
        'hrsh7th/nvim-compe',
        requires = {
        'rafamadriz/friendly-snippets',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ'
    }}

    -- Undo Tree
    use 'mbbill/undotree'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim'
    }}
    -- Telescope FZF Native YUHYUHYUH
    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Tree Sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Smooth Scroll
    use 'karb94/neoscroll.nvim'

    -- Auto Pairs
    use 'cohama/lexima.vim'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Buffer Bar and Web Icons
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Sonokai
    use 'sainnhe/sonokai'
end)

-- Plugin Configuration
require'plugins.lspconfig'
require'plugins.compe'
require'plugins.undotree'
require'plugins.telescope'
require'plugins.treesitter'
require'plugins.neoscroll'
require'colorizer'.setup()

-- Colorscheme Configuration and Initialization
require('plugins.colorschemes.sonokai')

-- My Status Line To Be Changed
require('plugins.statusline')

-- EOF
