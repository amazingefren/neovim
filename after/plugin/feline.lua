local has_f, f = pcall(require, feline)
if not has_f then return end
f.setup({
  preset='noicon'
})
