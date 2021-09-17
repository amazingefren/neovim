local has_fmt, fmt = pcall(require, 'formatter')
if not has_fmt then return end
local prettier = {
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
      stdin = true
    }
  end
}

fmt.setup(
  {
    logging = false,
    filetype = {
      typescript = prettier,
      typescriptreact = prettier,
      javascript = prettier,
      javascriptreact = prettier,
      markdown = prettier,
      json = prettier,
      html = prettier,
      graphql = prettier,
      css = prettier,
      scss = prettier,
      yaml = prettier,
      go = {
        function()
          return {
            exe = "gofmt",
            args = {},
            stdin = true
          }
        end
      },
      rust = {
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"--stdin -i 2"},
            stdin = true
          }
        end
      }
    }
  }
)
