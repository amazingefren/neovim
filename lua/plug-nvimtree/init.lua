vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
Apply.var({
    nvim_tree_width = 30,
    nvim_tree_indent_markers = 1,
    nvim_tree_follow = 1,
    nvim_tree_auto_close = 0,
    nvim_tree_git_hl = 1,
    nvim_tree_quit_on_open = 1,
    nvim_tree_width_allow_resize = 1,
    nvim_tree_update_cwd = 0, -- vim-rooter
    nvim_tree_show_icons={
        git = 1,
        folders = 1,
        files = 1
    },
    nvim_tree_ignore ={
        ".git","node_modules",".cache"
    },
    nvim_tree_icons={
        default="",
        symlink=""
    },
})

require'nvim-tree.events'.on_nvim_tree_ready(function()
    vim.cmd("NvimTreeRefresh")
end)
-- NvimTree VimEnter Full Width to be added soon -> SEE: #214, #200, #248 on gh

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["<CR>"]           = tree_cb("edit"),
    ["o"]              = tree_cb("edit"),
    ["<2-LeftMouse>"]  = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"]          = tree_cb("cd"),
    ["<leader><CR>"]   = tree_cb("cd"),
    ["<C-v>"]          = tree_cb("vsplit"),
    ["<C-x>"]          = tree_cb("split"),
    ["<C-t>"]          = tree_cb("tabnew"),
    ["<"]              = tree_cb("prev_sibling"),
    [">"]              = tree_cb("next_sibling"),
    ["<BS>"]           = tree_cb("close_node"),
    ["<S-CR>"]         = tree_cb("close_node"),
    ["<Tab>"]          = ":bn<CR>",
    ["I"]              = tree_cb("toggle_ignored"),
    ["H"]              = tree_cb("toggle_dotfiles"),
    ["R"]              = tree_cb("refresh"),
    ["a"]              = tree_cb("create"),
    ["d"]              = tree_cb("remove"),
    ["r"]              = tree_cb("rename"),
    ["<C-r>"]          = tree_cb("full_rename"),
    ["x"]              = tree_cb("cut"),
    ["c"]              = tree_cb("copy"),
    ["p"]              = tree_cb("paste"),
    ["[c"]             = tree_cb("prev_git_item"),
    ["]c"]             = tree_cb("next_git_item"),
    ["-"]              = tree_cb("dir_up"),
    ["<leader><BS>"]   = tree_cb("dir_up"),
    ["q"]              = tree_cb("close"),
}
