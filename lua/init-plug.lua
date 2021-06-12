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
    ----------------------------------------------
    -- LSP Config                               --
    ----------------------------------------------
    --= LSP =--
    use { 'neovim/nvim-lspconfig',
        config = function()
            require'plug-lspconfig'
        end
    }

    --= Tree Sitter =--
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'plug-treesitter'
        end
    }

    --= Lsp Actions =--
    use { 'glepnir/lspsaga.nvim',
        config = function()
            require'plug-lspsaga'
        end
    }

    --= Completion =--
    use { 'hrsh7th/nvim-compe',
        requires = {
            'rafamadriz/friendly-snippets',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'onsails/lspkind-nvim'
        },
        config = function()
            require'plug-compe'
            require'lspkind'.init()
        end
    }

    --= Comments =--
    use { 'b3nj5m1n/kommentary',
        config = function()
            require'plug-kommentary'
        end
    }

    --= Neovim Lua Lsp =--
    use 'tjdevries/nlua.nvim'

    ----------------------------------------------
    -- Quality of Life                          --
    ----------------------------------------------
    --= Sessions =--
    use { 'rmagatti/auto-session',
        config = function()
            require'auto-session'.setup{
                auto_session_root_dir = vim.fn.stdpath('data').."sessions",
                auto_save_enabled = true,
                auto_session_enable_last_session = true
            }
        end
    }

    --= Undo Tree =--
    use { 'mbbill/undotree',
        config = function()
            require'plug-undotree'
        end
    }

    --= Hop =--
    use { 'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygblzhckisuran' }
            vim.api.nvim_set_keymap('n', 'f', '<cmd>lua require"hop".hint_words()<CR>', {silent=true, noremap=true})
        end
    }

    --= Git Signs =--
    use { 'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup{
                signs = {
                    add          = {hl = 'GitSignsAdd'   , text = nil, numhl='GitSignsAdd'   },
                    change       = {hl = 'GitSignsChange', text = nil, numhl='GitSignsChange'},
                    delete       = {hl = 'GitSignsDelete', text = nil, numhl='GitSignsDelete'},
                    topdelete    = {hl = 'GitSignsDelete', text = nil, numhl='GitSignsDelete'},
                    changedelete = {hl = 'GitSignsChange', text = nil, numhl='GitSignsChange'},
                },
                numhl = true,
                signcolumn = false
            }
        end
    }

    --= Colorizer =--
    use { 'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    }

    --= Tab Things =--
    use { 'lukas-reineke/indent-blankline.nvim',
        branch = "lua",
        config = function()
            require'plug-blankline'
        end
    }

    --= Auto Pairs =--
    use 'cohama/lexima.vim'

    --= Auto NOH =--
    use 'romainl/vim-cool'

    ----------------------------------------------
    -- Navigation                               --
    ----------------------------------------------
    --= Telescope =--
    use { 'nvim-telescope/telescope.nvim',
        requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim'
        },
        config = function()
            require'plug-telescope'
        end
    }

    --= Buffer Bar =--
    use { 'akinsho/nvim-bufferline.lua',
        config = function()
            require'bufferline'.setup()
            vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>',
                {silent=true, noremap=true})
        end
    }

    --= File Tree =--
    use { 'kyazdani42/nvim-tree.lua',
        config = function()
            require'plug-nvimtree'
        end
    }

    --= Temp PWD =--
    use {'airblade/vim-rooter'}

    ----------------------------------------------
    -- Rice                                     --
    ----------------------------------------------
    --= Devicons =--
    use 'kyazdani42/nvim-web-devicons'
    --= Status Line =--
    use 'hoob3rt/lualine.nvim'

    --=== ColorSchemes ===---
    -- Bogsterish
    use { 'amazingefren/bogsterish.nvim', branch = 'devel',
        requires = 'rktjmp/lush.nvim'
    }

    -- Tokyonight
    use 'folke/tokyonight.nvim'

    -- Bogster
    use 'wojciechkepka/bogster'

end)

require'plug-colorschemes.bogsterish'
