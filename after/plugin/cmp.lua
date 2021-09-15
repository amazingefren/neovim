local cmp = require "cmp"
local cmp_core = require "cmp.core"
local cmp_keymap = require "cmp.utils.keymap"
local cmp_types = require "cmp.types"

vim.cmd [[autocmd CompleteDonePre * lua print('HELOOOOOOOOOOOOOOOOOOOOOOOOOOOO')]]
-- local ctx = cmp_core.get_context({reason = cmp_types.cmp.ContextReason.Auto})

-- holy fuck this works but honestly will probably break alot of shit
local smart_abort = function()
    if (vim.fn.pumvisible() == 1) then
        local comp_info = vim.fn.complete_info()
        local fuck = nil
        for _, v in pairs(comp_info.items) do
            fuck = v.abbr
            break
        end

        local ctx = cmp_core.get_context({reason = cmp_types.cmp.ContextReason.auto})
        if (comp_info.selected > 0) then
            cmp.abort()
            cmp_core.reset()
        elseif (comp_info.selected == 0 and ctx.cursor_before_line == fuck) then
            cmp.abort()
            cmp_core.reset()
            cmp_keymap.feedkeys(cmp_keymap.t("<BS>"), "n", cmp_core.reset())
        else
            cmp_keymap.feedkeys(cmp_keymap.t("<BS>"), "n", cmp_core.reset())
        end
    else
        cmp_keymap.feedkeys(cmp_keymap.t("<BS>"), "n", cmp_core.reset())
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
            completeopt = "menu,menuone,noinsert,preview"
        },
        mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<BS>"] = smart_abort,
            -- ["<BS>"] = cmp.abort(),
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
            {name = "nvim_vsnip"},
            {name = "buffer"}
        }
    }
)
