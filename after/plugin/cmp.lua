local cmp = require "cmp"
local lspkind = require "lspkind"

require "lspkind".init(
    {
        with_text = true
    }
)

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
            completeopt = "menu,menuone,noselect"
        },
        mapping = {
            ["<C-u>"] = cmp.mapping.scroll_docs(4),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<BS>"] = function(fallback)
                if (vim.fn.pumvisible() == 1 and vim.fn.complete_info({"selected"}).selected >= 0) then
                    return cmp.abort()
                else
                    fallback()
                end
            end,
            ["<C-f>"] = cmp.mapping.confirm({select = true}),
            -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false
                }
            )
        },
        sources = {
            {name = "nvim_lsp"},
            {name = "vsnip"},
            {name = "buffer"}
        },
        experimental = {
            active_preview = true,
            ghost_text = true
        }
    }
)
