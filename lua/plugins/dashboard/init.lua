local vars = {
    dashboard_custom_header={
        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
    },



    dashboard_custom_footer = {
        "----------------------",
        "|  git: amazingefren |",
        "|  my neovim config  |",
        "|  work in progress  |",
    },
    dashboard_default_executive = 'telescope',
    dashboard_custom_shortcut={
        last_session       = 'DISABLED',
        find_history       = 'DISABLED',
        find_file          = 'SPC f f',
        new_file           = 'DISABLED',
        change_colorscheme = 'DISABLED',
        find_word          = 'SPC f g',
        book_marks         = 'DISABLED',
    }
}

vim.api.nvim_set_keymap('n','<Leader>ss','<cmd>SessionSave<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n','<Leader>sl','<cmd>SessionLoad<CR>', {silent = true, noremap = true})

Apply.var(vars)

