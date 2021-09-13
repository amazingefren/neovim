-- Native Vim Configuration Only
vim.cmd [[set path+=**]]
--
local o = vim.o
local go = vim.go
local wo = vim.wo
local opt = vim.opt

-- local global_options = {
go.shortmess = vim.o.shortmess .. "c"
go.termguicolors = true
go.mouse = "a" -- Mouse Navigation
-- go.scrolloff   = 999,      -- Keep Cursor Centered
go.scrolloff = 6 -- Keep Cursor Centered
go.ic = true -- Insensitive Case Search
go.hidden = true -- Abandon Unloaded Buffer
go.bk = false -- Disable Backup (UndoTree?)
go.wb = false -- NoWriteBackup
go.updatetime = 200 -- Swap File Idle Write Time
go.sb = true -- Split Below
go.spr = true -- Split Right
go.showbreak = "-->" -- Symbol For Break
go.cpo = o.cpo .. "n" -- Hide Number for Break
go.ruler = false
go.showcmd = true

-- local window_options = {
wo.number = true -- Number
wo.rnu = false -- Relative Number
wo.linebreak = true -- Linebreak on Wrap
wo.signcolumn = "no" -- Signs on Number Column
-- wo.signcolumn  = "yes:1", -- Test
wo.bri = true -- Indent on Break
wo.cursorline = true -- Cursor Line
wo.wrap = false
-- wo.spell = true

opt.wildmode = {"longest", "list", "full"}
opt.wildmenu = true
opt.wildignorecase = true
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.fillchars = "vert:│"
opt.autoread = true
opt.bufhidden = "delete"
vim.opt_global.bufhidden = "delete"
vim.opt.wildignore = {
  '*.pyc',
  '*._build',
  '**./coverage/*',
  '**./node_modules/*',
  '**./android/*',
  '**./ios/*',
  '**./.git/*',
}

vim.cmd('filetype plugin indent on')

o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
-- vim.cmd [[
--   set wildmode=longest,list,full
--   set wildmenu
--   set wildignorecase
--   set autoindent
--   set expandtab
--   set shiftwidth=2
--   set tabstop=2
--   set fillchars+=vert:│
--   set smartindent
--   set autoread
--   set bufhidden=delete
--   setglobal bufhidden=delete
--   filetype plugin indent on
--   set wildignore+=*.pyc
--   set wildignore+=*_build/*
--   set wildignore+=**/coverage/*
--   set wildignore+=**/node_modules/*
--   set wildignore+=**/android/*
--   set wildignore+=**/ios/*
--   set wildignore+=**/.git/*
-- ]]

--vim.cmd[[
--  augroup MoveCursorLineHl
--    autocmd!
--    autocmd WinEnter * set cul
--    autocmd WinLeave * set nocul
--  augroup END
--]]

