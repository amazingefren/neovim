Apply = {}

Apply.opt = function(opt, table)
    for key, value in pairs(opt) do
        if table == "gv" then
            vim.api.nvim_set_var(key, value)
        else
            vim[table][key] = value
        end
    end
end

Apply.var = function(var)
    for key, value in pairs(var) do
        vim.api.nvim_set_var(key,value)
    end
end

return Apply
