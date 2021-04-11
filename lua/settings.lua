-- vim.o.{option}  -- Global Options
--    .bo.{option} -- Buffer-Local Options
--    .wo.{option} -- Window-Local Options
require('lib/augroups')

local function apply(opt, table)
    for key, value in pairs(opt) do
        --if table == "cmds" then
            --vim.cmd(opt[key])
        if table == "gv" then
            -- print(key, value)
            vim.api.nvim_set_var(key, value)
        else
	    vim[table][key] = value
        end
    end
end

--vim.api.nvim_set_var('sonokai_style', "atlantis")
local global_variables = {
    sonokai_style           = "atlantis",
    sonokai_enable_italic   = 1,
    sonokai_disable_italic_comment = 0,
    sonokai_diagnostic_text_highlight = 1,
    sonokai_diagnostic_line_highlight = 1,
    sonokai_current_word    = 'bold',
}

local global_options = {
    shortmess   = vim.o.shortmess .. "c",
    termguicolors = true,
    mouse       = "a",      -- Mouse Navigation
    scrolloff   = 999,      -- Keep Cursor Centered
    ic          = true,     -- Insensitive Case Search
    hidden      = true,     -- Abandon Unloaded Buffer
    bk    	    = false,    -- Disable Backup (UndoTree?)
    wb        	= false,    -- NoWriteBackup
    updatetime  = 500,      -- Swap File Idle Write Time
    sb          = true,     -- Split Below
    spr         = true,     -- Split Right
    showbreak   = "--->",   -- Symbol For Break
    cpo         = vim.o.cpo .. "n", -- Hide Number for Break
}

--local buffer_options = {}

local window_options = {
    number      = true,     -- Number
    rnu         = true,     -- Relative Number
    signcolumn  = "number", -- Signs on Number Column
    linebreak   = true,     -- Linebreak on Wrap
    bri         = true,     -- Indent on Break
    cursorline  = true      -- Cursor Line
}

vim.cmd [[
    set autoindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set smartindent
    highlight clear SignColumn
    filetype plugin indent on
    colorscheme sonokai
]]

local augroups = {
    BgHighlight = {"WinEnter * set cul", "WinLeave * set nocul"}
}

apply(global_variables, "gv")
apply(global_options, "o")
--apply(buffer_options, "bo")
apply(window_options, "wo")
augroup_create(augroups)
