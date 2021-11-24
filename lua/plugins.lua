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
    use "williamboman/nvim-lsp-installer"
    use "onsails/lspkind-nvim"

    --= Tree Sitter =--
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    --= Completion =--
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "rafamadriz/friendly-snippets"
      }
    }

    -- Menu
    use {
      "gelguy/wilder.nvim",
      requires = {
        "roxma/nvim-yarp",
        "roxma/vim-hug-neovim-rpc"
      }
    }

    -- Latex
    use "lervag/vimtex"

    -- Rooter
    use "airblade/vim-rooter"

    -- Tmux Navigation
    use "christoomey/vim-tmux-navigator"

    --= Signatures =--
    use {
      "ray-x/lsp_signature.nvim"
    }
    --= Comments =--
    -- use "b3nj5m1n/kommentary"
    use "numToStr/Comment.nvim"

    --= Trouble =--
    use "folke/trouble.nvim"

    --= Surround =--
    use "tpope/vim-surround"

    --= Repeat =--
    use "tpope/vim-repeat"

    --= Practice (temp) =--
    use "ThePrimeagen/vim-be-good"

    --= Neovim Lua Lsp =--
    use "tjdevries/nlua.nvim"

    --= Undo Tree =--
    use "mbbill/undotree"

    --= Git Signs =--
    use "lewis6991/gitsigns.nvim"

    --= Colorizer =--
    use "norcalli/nvim-colorizer.lua"

    --= Tab Things =--
    use "lukas-reineke/indent-blankline.nvim"

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
    use "nvim-lualine/lualine.nvim"

    --= NvimTree =--
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"
    }

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

    -- Github Theme
    use "projekt0n/github-nvim-theme"

    --= Experimental =--
    -- Rainbow
    use "p00f/nvim-ts-rainbow"

    -- Hop
    use "phaazon/hop.nvim"

    -- Filetype Shit (Might break alot)
    use {
      "nathom/filetype.nvim",
      config = function()
        require("filetype").setup({})
      end
    }
  end
}
