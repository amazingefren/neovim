local has_bl, bl = pcall(require, "indent_blankline")
if not has_bl then
  return
end

vim.opt.list = false
vim.opt.listchars = {
  space = "⋅"
  -- eol = "↴",
}

bl.setup {
  show_trailing_blankline_indent = false,
  buftype_exclude = {"terminal"},
  show_current_context = true,
  use_treesitter = true,
  space_char_blankline = " ",
  show_first_indent_level = true,
  context_patterns = {
    "def",
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type"
  }
}

vim.wo.colorcolumn = "999" -- Artifact Fix
