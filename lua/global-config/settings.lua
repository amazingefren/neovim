
-- Native Vim Configuration Only

local global_options = {
    shortmess   = vim.o.shortmess .. "c",
    termguicolors = true,
    mouse       = "a",      -- Mouse Navigation
    --scrolloff   = 999,      -- Keep Cursor Centered
    scrolloff   = 6,        -- Keep Cursor Centered
    ic          = true,     -- Insensitive Case Search
    hidden      = true,     -- Abandon Unloaded Buffer
    bk    	    = false,    -- Disable Backup (UndoTree?)
    wb        	= false,    -- NoWriteBackup
    updatetime  = 500,      -- Swap File Idle Write Time
    sb          = true,     -- Split Below
    spr         = true,     -- Split Right
    showbreak   = "-->",   -- Symbol For Break
    cpo         = vim.o.cpo .. "n", -- Hide Number for Break
}

local window_options = {
    number      = true,     -- Number
    rnu         = true,     -- Relative Number
    linebreak   = true,     -- Linebreak on Wrap
    -- signcolumn  = "number", -- Signs on Number Column
    signcolumn  = "yes:1", -- Test
    bri         = true,     -- Indent on Break
    cursorline  = true,      -- Cursor Line
    wrap        = true,
    -- spell       = true
}

local buffer_options = {
    textwidth   = 0
}

vim.cmd [[
    set autoindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set smartindent
    set bufhidden=delete
    setglobal bufhidden=delete
    filetype plugin indent on
]]

local augroups = {
    BgHighlight = {"WinEnter * set cul", "WinLeave * set nocul"}
}

Apply.opt(global_options, "o")
Apply.opt(window_options, "wo")
Apply.opt(buffer_options, "bo")
Augroup.create(augroups)
