local vars = {
    material_style = "deep ocean",
    material_contrast = true,
    material_borders = true,
}
Apply.var(vars)

require('lualine').setup{
    options = {
        theme = 'material-nvim'
    }
}

require('material').set()


