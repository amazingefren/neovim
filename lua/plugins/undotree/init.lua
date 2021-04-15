vim.api.nvim_set_keymap('n', '<Leader>u', ':UndotreeToggle<CR>',{silent = false})

vim.cmd[[
    set undofile
    set undodir=$HOME/.undodir
]]
