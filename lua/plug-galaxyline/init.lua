local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

local function spacing(num)
    return function() return string.rep(' ',num) end
end

local colors = require"plug-colorschemes/bogsterish".colors

gls.left[0] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "Normal",
                i = "Insert",
                c = "Command",
                V = "Visual",
                [""] = "Visual",
                v = "Visual",
                R = "Replace"
            }
            local current_Mode = alias[vim.fn.mode()]

            if current_Mode == nil then
                return "  Terminal "
            else
                return "  " .. current_Mode .. " "
            end
        end,
        highlight = {colors.fg1, colors.base3},
    }
}
gls.left[1] = {
    Prefix = {
        provider = spacing(1),
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.base2, colors.base2},
    }
}

gls.left[2] = {
    GitBranch = {
        provider = "GitBranch",
        icon = ' ',
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.fg1, colors.base2},
    },
}
gls.left[3] = {
    Prefix = {
        provider = spacing(1),
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.base2, colors.base2},
    }
}

gls.left[4] = {
    current_dir = {
        provider = {
            spacing(1),
            function()
                local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                return "  " .. dir_name .. " "
            end
            },
        condition = checkwidth,
        highlight = {colors.fg1, colors.base1},
        -- separator = " ",
        -- separator_highlight = {colors.lightbg2, colors.statusline_bg}
    }
}

gls.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "+",
        highlight = {colors.green, colors.base1}
    }
}

gls.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "~",
        highlight = {colors.yellow, colors.base1}
    }
}

gls.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "-",
        highlight = {colors.red, colors.base1},
    }
}

gls.left[8] = {
    fill_normal = {
        provider = function()
            return ""
        end,
        highlight = {colors.fg1, colors.base0}
    }
}

gls.mid[0] = {
    FileName = {
        provider = "FileName",
        highlight = {colors.fg3, colors.base0},
        condition = condition.buffer_not_empty and condition.hide_in_width,
        -- condition = checkwidth
    }
}

gls.right[0] = {
    LineColumn = {
        provider = "LineColumn"
    }
}

gls.right[1] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "  Top "
            elseif current_line == vim.fn.line("$") then
                return "  Bottom "
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "  " .. result .. "% "
        end,
        highlight = {colors.green, colors.lightbg}
    }
}
