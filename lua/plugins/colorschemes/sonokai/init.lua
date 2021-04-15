local vars = {
    --sonokai_style           = "atlantis",
    sonokai_style           = "default",
    sonokai_enable_italic   = 1,
    sonokai_disable_italic_comment = 0,
    sonokai_diagnostic_text_highlight = 1,
    sonokai_diagnostic_line_highlight = 1,
    sonokai_current_word    = 'bold',
}

Apply.var(vars)
vim.cmd[[
    colorscheme sonokai
]]
