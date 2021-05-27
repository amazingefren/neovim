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

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Auto HLS/NOH
    use 'romainl/vim-cool'

    -- LSP Config
    use 'neovim/nvim-lspconfig'
    -- Neovim Lua LSP
    use 'tjdevries/nlua.nvim'
    -- LSP Actions
    use 'glepnir/lspsaga.nvim'
    -- Completion
    use {
        'hrsh7th/nvim-compe',
        requires = {
            'rafamadriz/friendly-snippets',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ'
        }
    }

    -- Formatter mhartington/formatter.nvim --TODO

    -- Undo Tree
    use 'mbbill/undotree'
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygblzhckisuran' }
        end
    }

    -- Git Signs
    use 'lewis6991/gitsigns.nvim'

    -- Telescope (god tier)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim'
    }}

    -- Tree Sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Auto Pairs
    use 'cohama/lexima.vim'

    -- Colorizer (Buggy)
    use 'norcalli/nvim-colorizer.lua'

    -- Buffer Bar
    use 'akinsho/nvim-bufferline.lua'

    -- Devicons
    use 'kyazdani42/nvim-web-devicons'

    -- File Tree
    use 'kyazdani42/nvim-tree.lua'

    -- Status Line << awaiting theme
    use 'hoob3rt/lualine.nvim'

    -- Tab Things
    use {'lukas-reineke/indent-blankline.nvim', branch = "lua"}

    -- Comments
    use 'b3nj5m1n/kommentary'

    -- Reload
    use 'famiu/nvim-reload'

    -- Bogsterish
    use {'amazingefren/bogsterish.nvim', branch = 'devel', requires = 'rktjmp/lush.nvim'}

    use 'wojciechkepka/bogster'
end)

require'plugins.configure'
