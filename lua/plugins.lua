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

    --= Completion =--
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "rafamadriz/friendly-snippets"
      }
    }

    --= Signatures =--
    use {
      "ray-x/lsp_signature.nvim"
    }
    --= Comments =--
    use "b3nj5m1n/kommentary"

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

    --= Undo Tree =--
    use "mbbill/undotree"

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
    use "windwp/nvim-autopairs"

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

    --= Formatting =--
    use "mhartington/formatter.nvim"

    --= Toggle Term =--
    use "akinsho/nvim-toggleterm.lua"

    --= Devicons =--
    use "kyazdani42/nvim-web-devicons"

    --= Status Bar =--
    -- use {"famiu/feline.nvim", branch = "develop"}
    use 'shadmansaleh/lualine.nvim'

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
    use "projekt0n/github-nvim-theme"

    use "lervag/vimtex"

    use "airblade/vim-rooter"
  end
}
