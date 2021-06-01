-- Assign MapLeader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- <Space + h> -- unhighlight search
-- vim.api.nvim_set_keymap('n', '<Leader>h', ':noh<CR>', { noremap = true, silent = true })

-- <Ctrl + {h,j,k,l}> -- Better Pane Navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- < < , > > -- Better Tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- <Space + y> -- "+y Clipboard Yanking Gone Wild
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true })

-- Visual: Move line up / down
vim.api.nvim_set_keymap('v', '<S-j>', ':m .+1<CR>gv=gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-k>', ':m .-2<CR>gv=gv', { noremap = true, silent = true})

-- < {_,Shift + } Tab > -- Tab Bar Navigation
vim.api.nvim_set_keymap('n', '<tab>', ':bnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-tab>', ':bprevious<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><tab>', ':tabnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><S-tab>', ':tabprevious<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nt', ':tabedit %<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dt', ':tabclose<CR>', { noremap = true, silent = true})

-- <META + {?}> -- Resizing and more
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize +3<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-j>', ':res -1<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-k>', ':res +1<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize -3<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-q>', ':q <CR>', { noremap=true,silent=true })

-- <Meta(alt) + Space> -- Exit Terminal Mode
vim.api.nvim_set_keymap('t', '<M-Esc>', '<C-\\><C-n>', { noremap=true })
vim.api.nvim_set_keymap('n', '<M-Return>', ':belowright split<CR>:terminal<CR>', { noremap=true })

-- <Leader + no> -- No Highlight
vim.api.nvim_set_keymap('n', '<Leader>no', '<cmd>noh<cr>', {silent = true, noremap = true})
