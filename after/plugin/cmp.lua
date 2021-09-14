local cmp = require "cmp"
local cmp_core = require 'cmp.core'
local cmp_keymap = require "cmp.utils.keymap"

local smart_abort = function()
    if (vim.fn.pumvisible() == 1 and vim.fn.complete_info({"selected"}).selected > -1) then
        cmp.abort()
        cmp_core.reset()
    else
        cmp_keymap.feedkeys(cmp_keymap.t("<BS>"), "n")
    end
end

cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        completion = {
            completeopt = "menu,menuone,noinsert,noselect,preview"
        },
        mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<BS>"] = smart_abort,
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }
            )
        },
        sources = {
            {name = "nvim_lsp"},
            {name = "buffer"}
        }
    }
)
