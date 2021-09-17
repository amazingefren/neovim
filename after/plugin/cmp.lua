local cmp = require "cmp"
local lspkind = require "lspkind"
local ls = require "luasnip"

require "lspkind".init({with_text = true})

cmp.setup(
  {
    formatting = {
      format = function(_, vim_item)
        -- print(vim.inspect(vim_item))
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        return vim_item
      end
    },
    snippet = {
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body)
        require "luasnip".lsp_expand(args.body)
      end
    },
    mapping = {
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
      ["<C-f>"] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          cmp.confirm({select = true})
        elseif ls and ls.expand_or_jumpable() then
          ls.jump(1)
        else
          fallback()
        end
      end,
      ["<C-space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"})
    },
    sources = {
      {name = "path"},
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "luasnip"},
      {name = "buffer"}
    },
    experimental = {
      ghost_text = true
    }
  }
)
