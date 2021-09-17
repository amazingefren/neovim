vim.api.nvim_set_keymap('i','<C-Space>' ,'compe#complete()' , {expr = true, noremap = true, silent=true})
-- vim.api.nvim_set_keymap('i','<CR>' ,'compe#confirm("<CR>")' , {expr = true, noremap = true, silent=true})
vim.api.nvim_set_keymap('i','<C-e>' ,'compe#close("<C-e>")' , {expr = true, noremap = true, silent=true})
vim.api.nvim_set_keymap('i','<C-f>' ,'compe#close("<C-e>")' , {expr = true, noremap = true, silent=true})
vim.api.nvim_set_keymap('i','<C-d>' ,'compe#scroll({"delta": -4})' , {expr = true, noremap = true, silent=true})
vim.api.nvim_set_keymap('i','<C-f>' ,'compe#scroll({"delta": +4})' , {expr = true, noremap = true, silent=true})

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


local npairs = require('nvim-autopairs')

_G.MUtils= {}


vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end


vim.api.nvim_set_keymap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
