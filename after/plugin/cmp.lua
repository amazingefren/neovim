local cmp = require "cmp"
local lspkind = require "lspkind"

require "lspkind".init({with_text = true})

cmp.setup(
  {
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        return vim_item
      end
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    completion = {
      completeopt = "menu,menuone,noinsert"
    },
    mapping = {
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
      ["<C-f>"] = cmp.mapping.confirm({select = true}),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"})
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "vsnip"},
      {name = "buffer"}
    },
    experimental = {
      ghost_text = true
    }
  }
)
