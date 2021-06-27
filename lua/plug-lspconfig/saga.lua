local saga = require'lspsaga'
local util = {}

function util.smart_scroll(direction)
    local hover = require('lspsaga.hover')
    local finder = require('lspsaga.provider')
    local signature = require('lspsaga.signaturehelp')
    local implement = require('lspsaga.implement')
    if hover.has_saga_hover() then
        hover.scroll_in_hover(direction)
    elseif finder.has_saga_def_preview() then
        finder.scroll_in_def_preview(direction)
    elseif signature.has_saga_signature() then
        signature.scroll_in_signature(direction)
    elseif implement.has_implement_win() then
        implement.scroll_in_implement(direction)
    else
        local map = direction == 1 and "<C-d>" or "<C-u>"
        local key = vim.api.nvim_replace_termcodes(map,true,false,true)
        vim.api.nvim_feedkeys(key,'n',true)
    end
end

saga.init_lsp_saga{
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    -- dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = false,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
      open = 'o', vsplit = '<CR>',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
      quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
      quit = '<C-c>',exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "single",
    rename_prompt_prefix = '➤',
}

return util
