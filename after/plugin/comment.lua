--[[ local has_k, kommentary = pcall(require, 'kommentary.config')
if not has_k then return end
kommentary.use_extended_mappings()
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})
vim.api.nvim_set_keymap("i", "<C-_>", '<ESC>:execute "normal \\<Plug>kommentary_line_default"<CR>', {silent = true}) ]]

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

vim.api.nvim_set_keymap(
  "x",
  "<C-_>",
  "<ESC><CMD>lua __toggle_visual(vim.fn.visualmode())<CR>",
  {noremap = true, silent = true}
)

comment.setup()
vim.api.nvim_set_keymap("n", "<C-_>", ":lua require('Comment').toggle()<cr>", {})
-- vim.api.nvim_set_keymap("v", "<C-_>", ":lua require('Comment').toggle()<cr>", {})
