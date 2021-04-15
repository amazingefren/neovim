require('packer').startup(function(use)
--============= Plugin Manager =============--
--> Packer
    use 'wbthomason/packer.nvim'
----------------------------------------------
--            LSP and Completion            --
--> LSP Config
    use 'neovim/nvim-lspconfig'
--> Neovim Lua LSP
    use 'tjdevries/nlua.nvim'
--> Completion
    use {
    'hrsh7th/nvim-compe',
    --> Snippets for Completion
    requires = {
        'rafamadriz/friendly-snippets',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ'
    }}
----------------------------------------------
--                Functional                --
--> Undo Tree
    use 'mbbill/undotree'
-->  Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
-----------------------------------------------
--                  Parsing                  --
--> Tree Sitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
-----------------------------------------------
--              Quality of Life              --
--> Smooth Scroll
    use 'karb94/neoscroll.nvim'
--> Auto Pairs
    use 'cohama/lexima.vim'
--> Colorizer --> example: #3a3e4e
    use 'norcalli/nvim-colorizer.lua'
--> Buffer Bar and Web Icons
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
-----------------------------------------------
--               Color Schemes               --
--> Sonokai
    use 'sainnhe/sonokai'
-----------------------------------------------
end)
