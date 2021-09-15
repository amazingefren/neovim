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
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute "packadd packer.nvim"
end

require("packer").startup {
    function(use)
        use "wbthomason/packer.nvim"
        use "lewis6991/impatient.nvim"

        --= LSP =--
        use "neovim/nvim-lspconfig"
        use "onsails/lspkind-nvim"

        --= Tree Sitter =--
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        use {
            -- "hrsh7th/nvim-cmp",
            "~/.config/nvim/lua/nvim-cmp",
            requires = {
                "hrsh7th/vim-vsnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer"
            }
        }
        --= Completion =--
        --[[ use {
            "hrsh7th/nvim-compe",
            requires = {
                "rafamadriz/friendly-snippets",
                "hrsh7th/vim-vsnip",
                "hrsh7th/vim-vsnip-integ"
            },
            config = function()
                require "plug-compe"
            end
        } ]]
        --= Comments =--
        use "b3nj5m1n/kommentary"

        -- use { "ray-x/lsp_signature.nvim" }

        --[[ use {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup {}
                vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>ow",
                    "<cmd>Trouble lsp_workspace_diagnostics<cr>",
                    {silent = true, noremap = true}
                )
                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>od",
                    "<cmd>Trouble lsp_document_diagnostics<cr>",
                    {silent = true, noremap = true}
                )
                vim.api.nvim_set_keymap("n", "<leader>ol", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
                vim.api.nvim_set_keymap("n", "<leader>oq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
                vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
            end
        } ]]
        --= Neovim Lua Lsp =--
        use "tjdevries/nlua.nvim"

        --= Sessions =--
        --[[ use {
            "rmagatti/auto-session",
            requires = {"rmagatti/session-lens"},
            config = function()
                require "auto-session".setup {
                    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                    auto_save_enabled = true,
                    auto_restore_enabled = true,
                    auto_session_suppress_dirs = {"~/"},
                    pre_save_cmds = {"NvimTreeClose", "ToggleTermCloseAll"},
                    log_level = "error"
                }
                require "session-lens".setup {
                    -- SEE: pull #11, full path is temporary due to telescope changes
                    path_display = {"shorten"},
                    previewer = true
                }

                require "telescope".load_extension("session-lens")

                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>fs",
                    "<Cmd>lua require('session-lens').search_session()<CR>",
                    {silent = true, noremap = true}
                )
            end
        } ]]
        --= Undo Tree =--
        use "mbbill/undotree"

        --= Git HEAD deatch, rm -rf ~/.local/share/nvim/site/pack/packer/gitsigns.nvim then :PackerSync
        --= Git Signs =--
        use "lewis6991/gitsigns.nvim"

        --= Colorizer =--
        use "norcalli/nvim-colorizer.lua"

        --= Tab Things =--
        --[[ use {
            "lukas-reineke/indent-blankline.nvim",
            branch = "master",
            config = function()
                require "plug-blankline"
            end
        } ]]
        --= Pairs =--
        --[[ use {
            "windwp/nvim-autopairs",
            config = function()
                require "nvim-autopairs".setup()
            end
        } ]]
        --[[ use {
            "windwp/nvim-ts-autotag",
            config = function()
                require "nvim-ts-autotag".setup()
            end
        } ]]
        --= Startup Time =--
        use {"dstein64/vim-startuptime", cmd = "StartupTime"}

        --= BufDelete =--
        use "famiu/bufdelete.nvim"

        --= Auto NOH =--
        use "romainl/vim-cool"

        --= Telescope =--
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim"
            }
        }

        --= Buffer Bar =--
        use "akinsho/nvim-bufferline.lua"

        --= File Tree =--
        use "kyazdani42/nvim-tree.lua"

        --= Formatting =--
        use "mhartington/formatter.nvim"

        --= Toggle Term =--
        use "akinsho/nvim-toggleterm.lua"

        --= Devicons =--
        use "kyazdani42/nvim-web-devicons"

        --= Status Bar =--
        use "famiu/feline.nvim"

        --=== ColorSchemes ===---
        -- Bogsterish
        use {
            "amazingefren/bogsterish.nvim",
            branch = "devel",
            requires = "rktjmp/lush.nvim"
        }

        -- Sonokai
        use {"sainnhe/sonokai"}

        -- Tokyonight
        use "folke/tokyonight.nvim"

        -- Crack
        use {"sainnhe/gruvbox-material"}

        -- Bogster
        use "wojciechkepka/bogster"

        use {
            "gelguy/wilder.nvim",
            config = function()
                vim.cmd [[call wilder#setup({'modes': [':', '/', '?']})]]
            end
        }

        use "lervag/vimtex"

        -------- TODO Performance Improvements
        --- https://www.reddit.com/r/neovim/comments/opipij/guide_tips_and_tricks_to_reduce_startup_and/
    end
}

vim.cmd [[colorscheme dev-theme]]
require("plug-lspconfig")
