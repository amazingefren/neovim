vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
Apply.var({
    -- nvim_tree_width = 35,
    nvim_tree_indent_markers = 0,
    nvim_tree_follow = 1,
    nvim_tree_auto_close = 0,
    nvim_tree_auto_open = 1,
    nvim_tree_git_hl = 1,
    nvim_tree_quit_on_open = 0,
    nvim_tree_width_allow_resize = 1,
    nvim_tree_update_cwd = 0,
    nvim_tree_add_trailing = 1,
    nvim_tree_hijack_cursor = 0,
    nvim_tree_show_icons={
        git = 1,
        folders = 1,
        files = 1
    },
    nvim_tree_ignore ={
        ".git",".cache"
    },
    nvim_tree_icons={
        default="",
        symlink=""
    },
})
-- vim.cmd[[PackerLoad nvim-tree.lua]]
require'nvim-tree.events'.on_nvim_tree_ready(function()
    vim.cmd("NvimTreeRefresh")
end)
vim.cmd[[au FileType LuaTree setlocal sol]]
-- NvimTree VimEnter Full Width to be added soon -> SEE: #214, #200, #248 on gh

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = "<CR>",      cb = tree_cb("edit")},
  { key = "o",              cb = tree_cb("edit")},
  { key = "<2-LeftMouse>",  cb = tree_cb("edit")},
  { key = "<2-RightMouse>", cb = tree_cb("cd")},
  { key = "<C-]>",          cb = tree_cb("cd")},
  { key = "<leader><CR>",   cb = tree_cb("cd")},
  { key = "<C-v>",          cb = tree_cb("vsplit")},
  { key = "<C-x>",          cb = tree_cb("split")},
  { key = "<C-t>",          cb = tree_cb("tabnew")},
  { key = "<",              cb = tree_cb("prev_sibling")},
  { key = ">",              cb = tree_cb("next_sibling")},
  { key = "<BS>",           cb = tree_cb("close_node")},
  { key = "<S-CR>",         cb = tree_cb("close_node")},
  { key = "<Tab>",          cb = ":bn<CR>"},
  { key = "I",              cb = tree_cb("toggle_ignored")},
  { key = "H",              cb = tree_cb("toggle_dotfiles")},
  { key = "R",              cb = tree_cb("refresh")},
  { key = "a",              cb = tree_cb("create")},
  { key = "d",              cb = tree_cb("remove")},
  { key = "r",              cb = tree_cb("rename")},
  { key = "<C-r>",          cb = tree_cb("full_rename")},
  { key = "x",              cb = tree_cb("cut")},
  { key = "c",              cb = tree_cb("copy")},
  { key = "p",              cb = tree_cb("paste")},
  { key = "[c",             cb = tree_cb("prev_git_item")},
  { key = "]c",             cb = tree_cb("next_git_item")},
  { key = "-",              cb = tree_cb("dir_up")},
  { key = "<leader><BS>",   cb = tree_cb("dir_up")},
  { key = "q",              cb = tree_cb("close")},
}
