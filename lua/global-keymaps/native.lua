vim.g.mapleader = ' '
Mapper.map('n', '<Space>', '<NOP>', Opts, "Leader", "Leader", "Leader")

Mapper.map('n', '<C-h>', '<C-w>h', Opts, "Split", "normal_split_focus_left", "Focus Left")
Mapper.map('n', '<C-j>', '<C-w>j', Opts, "Split", "normal_split_focus_down", "Focus Down")
Mapper.map('n', '<C-k>', '<C-w>k', Opts, "Split", "normal_split_focus_up", "Focus Up")
Mapper.map('n', '<C-l>', '<C-w>l', Opts, "Split", "normal_split_focus_right", "Focus Right")

Mapper.map('v', '<', '<gv', Opts, "Line", "visual_tab_left", "Move Line Left")
Mapper.map('v', '>', '>gv', Opts, "Line", "visual_tab_right", "Move Line Right")

Mapper.map('n', '<Leader>y', '"+y', Opts, "Clipboard", "normal_yank_system_clipboard", "Yank To System Clipboard")
Mapper.map('v', '<Leader>y', '"+y', Opts, "Clipboard", "visual_yank_system_clipboard", "Yank To System Clipboard")

Mapper.map('v', '<S-j>', ':m .+1<CR>gv=gv', Opts, "Line", "visual_move_line_down", "Move Line Down")
Mapper.map('v', '<S-k>', ':m .-2<CR>gv=gv', Opts, "Line", "visual_move_line_up", "Move Line Up")

Mapper.map('n', '<tab>', ':bnext<CR>', Opts, "Buffer", "normal_buffer_next", "Buffer Next")
Mapper.map('n', '<S-tab>', ':bprevious<CR>', Opts, "Buffer", "normal_buffer_prev", "Buffer Previous")
Mapper.map('n', '<leader><tab>', ':tabnext<CR>', Opts, "Tab", "normal_tab_next", "Tab Next")
Mapper.map('n', '<leader><S-tab>', ':tabprevious<CR>', Opts, "Tab", "normal_tab_prev", "Tab Previous")
Mapper.map('n', '<leader>nt', ':tabedit %<CR>', Opts, "Tab", "normal_tab_new", "Tab New")
Mapper.map('n', '<leader>dt', ':tabclose<CR>', Opts, "Tab", "normal_tab_close", "Tab Close")

Mapper.map('n', '<M-h>', ':vertical resize +3<CR>', Opts, "Split", "normal_split_left_grow", "Split Grow Left")
Mapper.map('n', '<M-j>', ':res -1<CR>', Opts,             "Split", "normal_split_shrink", "Split Shink Vertically")
Mapper.map('n', '<M-k>', ':res +1<CR>', Opts,             "Split", "normal_split_grow", "Split Grow Vertically")
Mapper.map('n', '<M-l>', ':vertical resize -3<CR>', Opts, "Split", "normal_split_right_grow", "Split Grow Right")

Mapper.map('n', '<leader>bd', "<Cmd>lua require('bufdelete').bufdelete(0)<CR>", Opts,
  "Buffer", "normal_buffer_close", "Close Current Buffer"
)
Mapper.map('n', '<leader>bc', ':BufOnly<CR>', Opts, "Buffer", "normal_buffer_clear", "Close All Inactive Buffers")

Mapper.map('v','<leader>p', '"_dP', Opts, "Clipboard", "visual_paste_blackhole", "Paste Replace Blackhole")
Mapper.map('n','<leader>d', '"_d', Opts, "Clipboard", "normal_delete_blackhole", "Delete Blackhole")
Mapper.map('v','<leader>d', '"_d', Opts, "Clipboard", "visual_delete_blackhole","Delete Blackhole")
