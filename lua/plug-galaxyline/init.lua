local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = {'packager', 'NvimTree'}

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

-- local colors = require"plug-colorschemes/gruvbox".colors
local colors = {
  b0='#0A0E1F',
  b1='#131939',
  b2='#202A60',
  b3='#3D4B8F',
  b4='#ACB3D2',
  b5='#DEE0ED',
  red='#DB7070',
  orange='#EB8B47',
  yellow='#DBC970',
  green='#82DB70',
  cyan='#70DBA6',
  blue='#70C9DB',
  purple='#9470DB'
}


local mode_color = function()
    local mode_colors = {
        n = colors.b2,
        i = colors.green,
        c = colors.orange,
        V = colors.purple,
        [''] = colors.purple,
        v = colors.purple,
        R = colors.red
    }
    local color = mode_colors[vim.fn.mode()]
    if color == nil then
        color = colors.b3
    end
    return color
end

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
            vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color())

            if current_Mode == 'Normal' then
                vim.api.nvim_command('hi GalaxyViMode guifg='..colors.b5)
                return "  " .. current_Mode .. " "
            elseif current_Mode == nil then
                return "  Terminal "
            else
                vim.api.nvim_command('hi GalaxyViMode guifg='..colors.b0)
                return "  " .. current_Mode .. " "
            end

        end,
        highlight = {colors.b0, colors.b1, "bold"},
    }
}

gls.left[1] = {
    Prefix = {
        provider = spacing(1),
        condition = condition.check_git_workspace,
        highlight = {colors.b1, colors.b1},
    }
}

gls.left[2] = {
    GitBranch = {
        provider = "GitBranch",
        icon = ' ',
        condition = condition.check_git_workspace,
        highlight = {colors.b4, colors.b1},
    },
}
gls.left[3] = {
    Prefix = {
        provider = spacing(1),
        condition = condition.check_git_workspace,
        highlight = {colors.b1, colors.b1},
    },
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
        highlight = {colors.b4, colors.b1},
        separator = " ",
        separator_highlight = {colors.b1, colors.b0}
    }
}

gls.left[5] = {
    FileName = {
        provider = function()
            local file = vim.fn.expand('%:t')
            if vim.fn.empty(file) == 1 then return '' end

            if vim.bo.modifiable == false then
                vim.api.nvim_command('hi GalaxyFileName guifg='..colors.red)
            end
            return file .. ' '
        end,
        highlight = {colors.b4, colors.b0},
        -- condition = condition.buffer_not_empty and condition.hide_in_width,
        condition = condition.buffer_not_empty and checkwidth
        -- condition = checkwidth
    }
}

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "+",
        highlight = {colors.green, colors.b0, "bold"}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "~",
        highlight = {colors.yellow, colors.b0, "bold"}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "-",
        highlight = {colors.red, colors.b0, "bold"},
    }
}

gls.left[9] = {
    fill_normal = {
        provider = function()
            return ""
        end,
        highlight = {colors.b4, colors.b0}
    }
}

gls.right[0] = {
    LineColumn = {
        provider = "LineColumn",
        highlight = {colors.b4, colors.b0},
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
        highlight = {colors.green, colors.b0}
    }
}

gls.short_line_left[1] = {
    FileName = {
        provider = function()
            local file = vim.fn.expand('%:t')
            if vim.fn.empty(file) == 1 then return '' end

            if vim.bo.modifiable == false then
                vim.api.nvim_command('hi GalaxyFileName guifg='..colors.red)
            end
            return file .. ' '
        end,
        highlight = {colors.b4, colors.b0},
        condition = condition.buffer_not_empty and checkwidth
    }
}

gls.short_line_right[1] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "+",
        highlight = {colors.green, colors.b0, "bold"}
    }
}

gls.short_line_right[2] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "~",
        highlight = {colors.yellow, colors.b0, "bold"}
    }
}

gls.short_line_right[3] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "-",
        highlight = {colors.red, colors.b0, "bold"},
    }
}

gls.short_line_right[4] = {
    LineColumn = {
        provider = "LineColumn",
        highlight = {colors.b4, colors.b0},
    }
}
