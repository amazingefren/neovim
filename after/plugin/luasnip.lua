local has_ls, config = pcall(require, 'luasnip.config')
if not has_ls then return end
-- local luasnip = require('luasnip')

config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
	ext_prio_increase = 1
})

require('luasnip/loaders/from_vscode').lazy_load()
