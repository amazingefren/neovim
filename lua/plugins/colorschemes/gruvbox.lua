local vars = {
    gruvbox_contrast_dark = 'dark',
    gruvbox_hls_cursor = 'orange',
    gruvbox_transparent_bg = '1' -- Currently Borked
}
Apply.var(vars)
require'lualine'.setup{
    options={
        theme='gruvbox_material'
    }
}

vim.cmd[[ colorscheme gruvbox ]]
