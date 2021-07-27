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
    --= LSP =--
    use { 'neovim/nvim-lspconfig',
        config = function()
            require'plug-lspconfig'
        end
    }
    --= Tree Sitter =--
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'plug-treesitter' end
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
    use {'b3nj5m1n/kommentary',
        config = function()
            require'kommentary.config'.use_extended_mappings()
            vim.api.nvim_set_keymap('n', "<C-_>", "<Plug>kommentary_line_default", {})
            vim.api.nvim_set_keymap('v', "<C-_>", "<Plug>kommentary_visual_default", {})
            vim.api.nvim_set_keymap('i', "<C-_>", '<ESC>:execute "normal \\<Plug>kommentary_line_default"<CR>', {silent = true})
        end
    }

    use { "ray-x/lsp_signature.nvim" }

    use {'folke/trouble.nvim',
      config = function()
        require('trouble').setup{}
        vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
        vim.api.nvim_set_keymap("n", "<leader>ow", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
        vim.api.nvim_set_keymap("n", "<leader>od", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
        vim.api.nvim_set_keymap("n", "<leader>ol", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
        vim.api.nvim_set_keymap("n", "<leader>oq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
        vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
      end
    }

    --= Neovim Lua Lsp =--
    use 'tjdevries/nlua.nvim'

    --= Sessions =--
    use { 'rmagatti/auto-session',
        requires={'rmagatti/session-lens'},
        config = function()
            require'auto-session'.setup {
              auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
              auto_save_enabled = true,
              auto_restore_enabled = true,
              auto_session_suppress_dirs = {'~/'},
              pre_save_cmds = {"NvimTreeClose"},
              log_level = 'error'
            }
            require'session-lens'.setup{
              -- SEE: pull #11, full path is temporary due to telescope changes
              path_display = {'shorten'},
              previewer = true
            }

            require'telescope'.load_extension('session-lens')

            vim.api.nvim_set_keymap('n','<leader>fs',"<Cmd>lua require('session-lens').search_session()<CR>", {silent=true, noremap = true})
        end
    }

    --= Undo Tree =--
    use { 'mbbill/undotree',
        config = function()
            require'plug-undotree'
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
    -- use { 'lukas-reineke/indent-blankline.nvim',
        -- branch = "master",
        -- config = function()
            -- require'plug-blankline'
        -- end
    -- }

    --= Pairs =--
    use {'windwp/nvim-autopairs',
        config=function() require'nvim-autopairs'.setup() end
    }
    use {'windwp/nvim-ts-autotag',
        config=function() require'nvim-ts-autotag'.setup() end
    }

    --= BufDelete =--
    use 'famiu/bufdelete.nvim'

    --= Auto NOH =--
    use 'romainl/vim-cool'

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
        -- See nvim-tree.lua LINE: #199->#201
        config = function()
            require'plug-nvimtree'
        end
    }

    --= Formatting =--
    use {'mhartington/formatter.nvim', config=function() require'plug-lspconfig/format' end}

    --= Toggle Term =--
    use {"akinsho/nvim-toggleterm.lua",
        config = function()
          require'toggleterm'.setup{
            direction = 'float'
          }
          local Terminal = require('toggleterm.terminal').Terminal
          local lg = Terminal:new({cmd="lazygit", hidden=true})
          -- vim.api.nvim_set_keymap('t','<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})
          vim.api.nvim_set_keymap('n',"<C-Space>", ':ToggleTerm<CR>', {noremap = true, silent = true})
          vim.api.nvim_set_keymap('t',"<C-Space>", '<C-\\><C-n>:ToggleTerm<CR>', {noremap = true, silent = true})
          function LG_TOGGLE()
            lg:toggle()
          end
          vim.api.nvim_set_keymap('n',"<leader>lg", '<Cmd>lua LG_TOGGLE()<CR>', {noremap = true, silent = true})
        end
    }

    --= Devicons =--
    use 'kyazdani42/nvim-web-devicons'

    --= Status Bar =--
    use {'glepnir/galaxyline.nvim',
        config = function()
            require('plug-galaxyline')
        end
    }

    --=== ColorSchemes ===---
    -- Bogsterish
    use { 'amazingefren/bogsterish.nvim', branch = 'devel',
        requires = 'rktjmp/lush.nvim'
    }

    -- Sonokai
    use {'sainnhe/sonokai'}

    -- Tokyonight
    use 'folke/tokyonight.nvim'

    -- Crack
    use {'sainnhe/gruvbox-material'}

    -- Bogster
    use 'wojciechkepka/bogster'

end)

-- require'plug-colorschemes.bogsterish'.setup()
require'plug-colorschemes.gruvbox'.setup()
-- LowerContrast Colorscheme WIP
vim.cmd[[colorscheme dev-idk]]
