local vars = {
    neon_style = "dark",
    neon_bold = true
}

Apply.var(vars)

require'lualine'.setup{
    options = {
        theme = 'neon'
    }
}

vim.cmd[[colorscheme neon]]
