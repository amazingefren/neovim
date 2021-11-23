local has_c, comment = pcall(require, "Comment")
if not has_c then
  return
end

local Ut = require("Comment.utils")
local Op = require("Comment.opfunc")

function _G.__toggle_visual(vmode)
  local lcs, rcs = Ut.unwrap_cstr(vim.bo.commentstring)
  local srow, erow, lines = Ut.get_lines(vmode, Ut.ctype.line)

  Op.linewise(
    {
      cfg = {padding = true, ignore = nil},
      cmode = Ut.cmode.toggle,
      lines = lines,
      lcs = lcs,
      rcs = rcs,
      erow = erow,
      srow = srow
    }
  )
end

comment.setup()
vim.api.nvim_set_keymap("n", "<C-_>", ":lua require('Comment').toggle()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<C-_>", ":lua ___comment_gc(vim.fn.visualmode())<cr>", {noremap = true, silent = true}) -- Line Comment
vim.api.nvim_set_keymap("v", "<C-b>", ":lua ___comment_gb(vim.fn.visualmode())<cr>", {noremap = true, silent = true}) -- Block Comment
