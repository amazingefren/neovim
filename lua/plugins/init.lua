--[[
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end
--]]

require('packer').startup(function(use)
    -- Plugin Manager
    use 'wbthomason/packer.nvim'

    -- Auto Pairs
    use 'cohama/lexima.vim'

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function() require'plugins.lspconfig' end,
        {
            -- Neovim Lua LSP
            'tjdevries/nlua.nvim'
        },
        {
            'hrsh7th/nvim-compe',
            config = function() require'plugins.compe' end,
            requires = {
                'rafamadriz/friendly-snippets',
                'hrsh7th/vim-vsnip',
                'hrsh7th/vim-vsnip-integ'
            }
        }
    }

    -- Syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter') end
    }

    -- Smooth Scroll
    use {
        'karb94/neoscroll.nvim',
        config = function() require('plugins.neoscroll') end
    }
    -- Color Scheme
    use 'sainnhe/sonokai'

end)
