local has_t, trouble = pcall(require, ("trouble"))
if not has_t then
  return
end

vim.api.nvim_set_keymap("n", "<Leader>tt", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<Leader>tn",
  ":lua require('trouble').next({skip_groups = true, jump = true})<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>tp",
  ":lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
  {silent = true, noremap = true}
)

trouble.setup {}
