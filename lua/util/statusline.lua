StatusLineUpdate=function()
    status_line()
    vim.o.statusline = '%!luaeval("status_line()")'
end

