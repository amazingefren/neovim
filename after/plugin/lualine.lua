local has_ll, ll = pcall(require, "lualine")
if not has_ll then
  return
end
ll.setup(
  {
    options = {
      theme = 'auto'
    }
  }
)
