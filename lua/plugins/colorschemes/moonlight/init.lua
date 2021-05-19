local vars = {
    moonlight_italic_comments = true,
}
Apply.var(vars)
require'moonlight'.set()
require'lualine'.setup{
    options = {
        theme = 'moonlight'
    }
}

