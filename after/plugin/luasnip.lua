-- local luasnip = require('luasnip')

--[[ luasnip.config.set_config({
  history = true,
  -- updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
	ext_prio_increase = 1
}) ]]

require('luasnip/loaders/from_vscode').load()
