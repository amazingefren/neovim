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

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = require('plugins.lspconfig'),
        {
            'hrsh7th/nvim-compe',
            requires = {
                {'hrsh7th/vim-vsnip'},
                {'hrsh7th/vim-vsnip-integ'}
            },
            config = require('plugins.compe')
        }
    }

    -- Neovim Lua LSP
    use 'tjdevries/nlua.nvim'

    -- Auto Pairs
    use 'cohama/lexima.vim'

    -- Color Schemes
    use 'sainnhe/sonokai'

    -- Syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config=require('plugins.treesitter')
    }

    -- Smooth Scroll
    use {
        'karb94/neoscroll.nvim',
        config = require('plugins.neoscroll')
    }
end
)
