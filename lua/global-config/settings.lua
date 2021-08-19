
-- Native Vim Configuration Only
vim.cmd[[set path+=**]]

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
  updatetime  = 200,      -- Swap File Idle Write Time
  sb          = true,     -- Split Below
  spr         = true,     -- Split Right
  showbreak   = "-->",   -- Symbol For Break
  cpo         = vim.o.cpo .. "n", -- Hide Number for Break
  ruler       = false,
  showcmd     = true
}

local window_options = {
  number      = true,     -- Number
  rnu         = true,     -- Relative Number
  linebreak   = true,     -- Linebreak on Wrap
  -- signcolumn  = "no", -- Signs on Number Column
  signcolumn  = "yes:1", -- Test
  bri         = true,     -- Indent on Break
  cursorline  = true,      -- Cursor Line
  wrap        = false,
  -- spell       = true
}

vim.cmd [[
  set wildmode=longest,list,full
  set wildmenu
  set wildignorecase
  set autoindent
  set expandtab
  set shiftwidth=2
  set tabstop=2
  set fillchars+=vert:│
  set smartindent
  set autoread
  set bufhidden=delete
  setglobal bufhidden=delete
  filetype plugin indent on
  set wildignore+=*.pyc
  set wildignore+=*_build/*
  set wildignore+=**/coverage/*
  set wildignore+=**/node_modules/*
  set wildignore+=**/android/*
  set wildignore+=**/ios/*
  set wildignore+=**/.git/*
]]

local augroups = {
  BgHighlight = {"WinEnter * set cul", "WinLeave * set nocul"}
}

Apply.opt(global_options, "o")
Apply.opt(window_options, "wo")
Augroup.create(augroups)
