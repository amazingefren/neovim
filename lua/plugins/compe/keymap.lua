-- [[
-- " NOTE: Order is important. You can't lazy loading lexima.vim.
-- let g:lexima_no_default_rules = v:true
-- call lexima#set_default_rules()
-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
-- ]]

Apply.var({lexima_no_default_rules = "v:true"})
vim.cmd[[
call lexima#set_default_rules()
]]

vim.api.nvim_set_keymap('i','<C-Space>' ,'compe#complete()' , {expr = true, noremap = true, silent=true})
vim.api.nvim_set_keymap('i','<CR>' ,'compe#confirm(lexima#expand("<LT>CR>", "i"))' , {expr = true, noremap = true, silent=true})
vim.api.nvim_set_keymap('i','<C-e>' ,'compe#close("<C-e>")' , {expr = true, noremap = true, silent=true})
-- vim.api.nvim_set_keymap('i','<C-f>' ,'compe#scroll({ "delta": +4 })' , {expr = true, noremap = true, silent=true})
-- vim.api.nvim_set_keymap('i','<C-d>' ,'compe#scroll({ "delta": -4 })' , {expr = true, noremap = true, silent=true})

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
