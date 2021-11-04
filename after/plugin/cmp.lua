local has_cmp, cmp = pcall(require, "cmp")
local has_lk, lspkind = pcall(require, "lspkind")
local has_ls, ls = pcall(require, "luasnip")
local has_ap, ap = pcall(require, "nvim-autopairs.completion.cmp")

if not has_cmp or not has_lk or not has_ls then
  return
end

lspkind.init({with_text = true})

cmp.setup(
  {
    completion = {
      completeopt = "menu,menuone,noselect"
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        vim_item.menu =
          ({
          path = "[Path]",
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]"
        })[entry.source.name]

        return vim_item
      end
    },
    snippet = {
      expand = function(args)
        require "luasnip".lsp_expand(args.body)
      end
    },
    mapping = {
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
      ["<C-f>"] = function(fallback)
        if cmp.visible() then
          cmp.confirm({select = true})
        elseif ls and ls.expand_or_jumpable() then
          ls.jump(1)
        else
          fallback()
        end
      end,
      ["<C-space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
      ["<CR>"] = function(fallback)
        if cmp.visible() and cmp.get_selected_entry() then
          cmp.confirm({select = true})
        else
          fallback()
        end
      end
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "luasnip"},
      {name = "path"},
      {name = "buffer"}
    },
    experimental = {
      ghost_text = true
    }
  }
)

if not has_ap then
  return
end
cmp.event:on("confirm_done", ap.on_confirm_done())
