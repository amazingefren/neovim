-- require'lualine'.setup{
    -- options={
        -- theme = "bogsterish"
    -- }
-- }

local setup = function()
    vim.cmd[[
    augroup OverrideNonText
        autocmd!
        autocmd ColorScheme * highlight NonText ctermfg=13 guifg=#F34473 | highlight IndentBlanklineChar ctermfg=12 guifg=#415368 | highlight Normal guifg=#C7B8AE guibg=NONE
    augroup END
    ]]
    vim.cmd[[
    colorscheme bogsterish
    ]]
end

local colors = {
    base0      =  '#161C23',
    base1      =  '#232E38',
    base2      =  '#313F4E',
    base3      =  '#415368',
    base4      =  '#526984',
    base5      =  '#627D9D',
    base6      =  '#9EA4C2',
    base7      =  '#B6B6C9',
    base8      =  '#CCC7D1',
    fg0        =  '#C7B8AE',
    fg1        =  '#E5DED7',
    fg2        =  '#D7CDC6',
    fg3        =  '#B4A193',
    red        =  '#F34473',
    light_red  =  '#DC5B80',
    orange     =  '#F2A145',
    yellow     =  '#EBCF47',
    green      =  '#6BE156',
    light_green=  '#83E85E',
    teal       =  '#2DD2A3',
    light_teal =  '#5BDCB8',
    blue       =  '#5BC0DC',
    light_blue =  '#5BDCD8',
    purple     =  '#C560E6',
    pink       =  '#DC5BC0',
}

return {setup=setup, colors=colors}
