vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {silent = true, noremap = true})

--= Server =--
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

--[[ vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)
]]
-- vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
-- vim.cmd[[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

