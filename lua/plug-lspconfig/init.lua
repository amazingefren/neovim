local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- Typescript --> npm global typescript, typescript-language-server
require'lspconfig'.tsserver.setup{}

-- Lua --> Arch AUR lua-language-server(sumneko-language-server)
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = "/usr/bin/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- BASH --> npm global bash-language-server
require'lspconfig'.bashls.setup{}

-- C/C++ --> clangd
require'lspconfig'.clangd.setup{}

-- CSS/SCSS/LESS --> FOLLOW HTML INSTALL
require'lspconfig'.cssls.setup{}

-- Docker Lang Server -->  npm global dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{}

-- Go --> Arch Package GoPls
require'lspconfig'.gopls.setup{}

-- GraphQl --> npm global graphql-language-service-cli
require'lspconfig'.graphql.setup{}

-- HTML --> npm global vscode-langservers-extracted
require'lspconfig'.html.setup {
  capabilities = capabilities;
}

-- Json --> FOLLOW HTML INSTALL
require'lspconfig'.jsonls.setup{}

-- Python --> pip install 'python-language-server[all]' because I can
require'lspconfig'.pyls.setup{}

-- Rust --> Arch Package rust-anazlyer, because made with rust
require'lspconfig'.rust_analyzer.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)
vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
-- vim.cmd[[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

