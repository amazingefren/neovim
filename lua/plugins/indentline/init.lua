local vars = {
    -- indentLine_char = '|',
    -- indentLine_leadingSpaceChar = '·',
    -- indentLine_first_char = '|',
    -- indentLine_showFirstIndentLevel = true,
    -- indentLine_leadingSpaceEnabled = true,
    -- indent_blankline_space_char = '·',
    -- indent_blankline_space_char = '',
    indent_blankline_char = '│',
    -- indent_blankline_char = '',
    -- indent_blankline_char= '',
    indent_blankline_bufname_exclude = {'dashboard', 'NvimTree'},
    indent_blankline_use_treesitter = true,
}



vim.cmd[[
    let g:indent_blankline_char_highlight_list = ['Operator']
]]

vim.wo.colorcolumn = "999" -- Artifact Fix for now

Apply.var(vars)
