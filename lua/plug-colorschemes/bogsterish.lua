-- require'lualine'.setup{
    -- options={
        -- theme = "bogsterish"
    -- }
-- }

vim.cmd[[
augroup OverrideNonText
    autocmd!
    autocmd ColorScheme * highlight NonText ctermfg=13 guifg=#F34473 | highlight IndentBlanklineChar ctermfg=12 guifg=#415368 | highlight Normal guifg=#C7B8AE guibg=NONE
augroup END
]]

vim.cmd[[
colorscheme bogsterish
]]
