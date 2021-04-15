--local global_variables = {
--    sonokai_style           = "atlantis",
--    sonokai_enable_italic   = 1,
--    sonokai_disable_italic_comment = 0,
--    sonokai_diagnostic_text_highlight = 1, sonokai_diagnostic_line_highlight = 1,
--    sonokai_current_word    = 'bold',
--}

local global_options = {
    shortmess   = vim.o.shortmess .. "c",
    termguicolors = true,
    mouse       = "a",      -- Mouse Navigation
    --scrolloff   = 999,      -- Keep Cursor Centered
    scrolloff   = 1,      -- Keep Cursor Centered
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
]]

local augroups = {
    BgHighlight = {"WinEnter * set cul", "WinLeave * set nocul"}
}

Apply.opt(global_options, "o")
Apply.opt(window_options, "wo")
Augroup.create(augroups)
