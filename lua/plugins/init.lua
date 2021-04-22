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

    -- Session Management
    use 'rmagatti/auto-session'

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
    }}

    -- Undo Tree
    use 'mbbill/undotree'

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

    -- Colorizer
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

    --[[ ColorSchemes ]]

    -- Sonokai
    use 'sainnhe/sonokai'
    --Tokyo Night
    use 'folke/tokyonight.nvim'

end)

require'plugins.configure'
