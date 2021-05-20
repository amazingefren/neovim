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

    -- Dashboard
    -- use 'glepnir/dashboard-nvim'

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
    }}

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

    -- Buffer Fill
    use 'qpkorr/vim-bufkill'

    -- Status Line
    use 'hoob3rt/lualine.nvim'

    -- pls fly again
    use {'lukas-reineke/indent-blankline.nvim', branch = "lua"}

    -- Comments
    use 'b3nj5m1n/kommentary'

    -- Reload
    use 'famiu/nvim-reload' -- Note, Will Give Weird Error with Dashboard

    --[[ ColorSchemes ]]

    -- Tokyo Night
    use 'folke/tokyonight.nvim'
    -- Falcon
    use 'fenetikm/falcon'
    -- Material
    use 'marko-cerovac/material.nvim'
    -- Neon
    use 'rafamadriz/neon'

    -- Nice? -> EDIT: YES REALLY NICE BRB GONNA WASTE THE REST OF MY DAY
    use 'rktjmp/lush.nvim'

    -- Ex I have to keep calling
    use 'npxbr/gruvbox.nvim'

end)

require'plugins.configure'
