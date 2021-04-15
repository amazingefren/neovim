local vim = vim
local api = vim.api
local fn = vim.fn
local bo = vim.bo
local wo = vim.wo
local o = vim.o
local git_branch = require'plugins.statusline.gitbranch' local cmd = api.nvim_command
function cursor_mode()
  local alias = {
    n = 'NORMAL',
    no = 'OP',
    nov = 'OP',
    ['noCTRL-V'] = 'OP',
    niI = 'NORMAL',
    niR = 'NORMAL',
    niV = 'NORMAL',
    i = 'INSERT',
    ic = 'INSERT',
    ix = 'INSERT',
    v = 'VISUAL',
    V = 'VISUAL',
    r = 'ENTER',
    rm = 'MORE',
    ['r?'] = 'CONFIRM',
    R = 'REPLACE',
    Rc = 'REPLACE',
    Rv = 'V-REPLACE',
    s = 'SELECT',
    S = 'SELECT',
    ['CTRL-V'] = 'BLOCK',
    ['CTRL-S'] = 'BLOCK',
    c = 'COMMAND',
    cv = 'COMMAND',
    ce = 'COMMAND',
    ['!'] = 'SHELL',
    t = 'TERM',
    ['null'] = 'NONE',
  }
    return alias[fn.mode()]
end

function mode_color(m)
    if m == 'NORMAL' or m == 'OP' then
        return '%#Ignore#'
    elseif m == 'INSERT' then
        return '%#WildMenu#'
    elseif m == 'VISUAL' then
        return '%#vCursor#'
    elseif m == 'REPLACE' or m == 'V-REPLACE' then
        return '%#TabLineSel#'
    elseif m == 'ENTER' then
        return '%#ToolBarButton#'
    elseif m == 'MORE' then
        return '%#ToolbarButton#'
    elseif m == 'SELECT' then
        return '%#ToolbarButton#'
    elseif m == 'COMMAND' then
        return '%#ToolbarButton#'
    elseif m == 'SHELL' then
        return '%#ToolbarButton#'
    elseif m == 'TERM' then
        return '%#ToolbarButton#'
    else
        return '%#ErrorFloat#'
    end
end


function status_line()
    local status = ''
    status = status .. mode_color(cursor_mode())
    status = status .. ' '
    status = status .. [[%{luaeval("cursor_mode()")}]]
    status = status .. ' '
    status = status .. '%#Blue#'
    status = status .. ' %f '
    status = status .. '%#Normal#'
    status = status .. '%m '
    status = status .. '%#Purple#'
    status = status .. ' '
    status = status .. git_branch.branch()
    status = status .. ' '
    status = status .. '%='
    status = status .. '%#ErrorMsg#'
    status = status .. '%r'
    status = status .. '%#Normal#'
    status = status .. ' '
    status = status .. '%#Ignore#'
    status = status .. '%F'
    status = status .. '%#Normal#'
    status = status .. ' '
    --status = status .. ' < '
    status = status .. '%#Yellow#'
    status = status .. ' %l'
    status = status .. ':'
    status = status .. '%L'
    status = status .. '%#Normal#'
    status = status .. ' '
    --status = status .. ' < '
    status = status .. '%#Blue#'
    status = status .. ' %{winnr()}'
    status = status .. ':'
    status = status .. '%n '
    status = status .. '%#Normal#'
    --status = status .. ' < '
    status = status .. ' '
    status = status .. '%{strftime(\"%H:%M %p\")}'
    status = status .. ' '
    return status
end

Augroup.create({
    UpdateStatusLine = {
        "BufEnter,WinEnter * :lua StatusLineUpdate()"
    }
})
vim.cmd[[set laststatus=2]]
wo.statusline = '%!luaeval("status_line()")'
