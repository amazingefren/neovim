-- Assign MapLeader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- <Space + h> -- unhighlight search
vim.api.nvim_set_keymap('n', '<Leader>h', ':noh<CR>', { noremap = true, silent = true })

-- <Space + n> -- nvim-tree toggle
-- vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

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

-- <Shift + {j/k} -- Faster Navigation w/ {J/K} MIGHT BE REPLACED AS I MIGHT JUST STOP BEING LAZY AND USE CTRL+D/U
-- Visual: Move line up / down
vim.api.nvim_set_keymap('n', '<S-j>', ':+5<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-k>', ':-5<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-j>', ':m .+1<CR>gv=gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-k>', ':m .-2<CR>gv=gv', { noremap = true, silent = true})


-- < {_,Shift + } Tab > -- Tab Bar Navigation
vim.api.nvim_set_keymap('n', '<tab>', ':bnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-tab>', ':bprevious<CR>', { noremap = true, silent = true})
