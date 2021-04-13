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
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'
    use 'sainnhe/sonokai'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'karb94/neoscroll.nvim'
end)

require('plugins.lspconfig')
require('plugins.neoscroll')
require('plugins.treesitter')
