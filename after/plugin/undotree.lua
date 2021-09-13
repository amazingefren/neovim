vim.api.nvim_set_keymap("n", "<Leader>u", ":UndotreeToggle<CR>", {silent = false})

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME").."/.undodir"
