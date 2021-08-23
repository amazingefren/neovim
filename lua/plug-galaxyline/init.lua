-- local gl = require("galaxyline")
local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then
  print("Failed to load galaxyline")
  return
end

local gls = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = {'packager', 'NvimTree', 'vista', 'trouble', 'dbui', 'diff', 'peakaboo'}

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

local colors = require"plug-colorschemes/dev-idk".colors

local mode_color = function()
    local mode_colors = {
        n = colors.bshade,
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
  ViModeLeft = {
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
      vim.api.nvim_command('hi GalaxyViModeLeft guibg='..mode_color())

      if current_Mode == 'Normal' then
        vim.api.nvim_command('hi GalaxyViModeLeft guifg='..colors.bshade)
        return ""
      elseif current_Mode == nil then
        return ""
      else
        vim.api.nvim_command('hi GalaxyViModeLeft guifg='..colors.bshade)
        return ""
      end
    end,
    highlight = {colors.b4, colors.b1},
  }
}

gls.left[1] = {
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
                vim.api.nvim_command('hi GalaxyViMode guifg='..colors.b5.." gui=none")
                return "  " .. current_Mode .. " "
            elseif current_Mode == nil then
                return "  Terminal "
            else
                vim.api.nvim_command('hi GalaxyViMode guifg='..colors.b0.." gui=bold")
                return "  " .. current_Mode .. " "
            end

        end,
        highlight = {colors.b4, colors.b1, "bold"},
    }
}

gls.left[2] = {
  ViModeRight = {
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
      vim.api.nvim_command('hi GalaxyViModeRight guibg='..mode_color())

      if current_Mode == 'Normal' then
        vim.api.nvim_command('hi GalaxyViModeRight guifg='..colors.b1)
        return ""
      elseif current_Mode == nil then
        return ""
      else
        vim.api.nvim_command('hi GalaxyViModeRight guifg='..colors.b1)
        return ""
      end
    end,
    highlight = {colors.b4, colors.b1},
  }
}

gls.left[3] = {
    PrefixL1 = {
        provider = spacing(1),
        condition = condition.check_git_workspace,
        highlight = {colors.b1, colors.b1},
    }
}

gls.left[4] = {
    GitBranch = {
        provider = "GitBranch",
        icon = ' ',
        condition = condition.check_git_workspace,
        highlight = {colors.b4, colors.b1},
    },
}
gls.left[5] = {
    PrefixL2 = {
        provider = spacing(1),
        condition = condition.check_git_workspace,
        highlight = {colors.b1, colors.b1},
    },
}

gls.left[6] = {
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
        separator_highlight = {colors.b1, colors.b2}
    }
}

gls.left[7] = {
    FileName = {
        provider = function()
            local file = vim.fn.expand('%:t')
            if vim.fn.empty(file) == 1 then return '' end

            if vim.bo.modifiable == false then
                vim.api.nvim_command('hi GalaxyFileName guifg='..colors.red)
            end
            return file .. ' '
        end,
        highlight = {colors.b5, colors.b2},
        -- condition = condition.buffer_not_empty and condition.hide_in_width,
        condition = condition.buffer_not_empty and checkwidth
        -- condition = checkwidth
    }
}

gls.left[8] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "+",
        highlight = {colors.green, colors.b2, "bold"}
    }
}

gls.left[9] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "~",
        highlight = {colors.yellow, colors.b2, "bold"}
    }
}

gls.left[10] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "-",
        highlight = {colors.red, colors.b2, "bold"},
    }
}

gls.left[11] = {
    fill_normal = {
        provider = function()
            return ""
        end,
        highlight = {colors.b4, colors.b2}
    }
}

gls.right[0] = {
    LineColumn = {
        provider = "LineColumn",
        highlight = {colors.b4, colors.bshade},
        separator = "",
        separator_highlight = {colors.bshade, colors.b2}
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
        highlight = {colors.green, colors.bshade}
    }
}

gls.short_line_left[1] = {
    ShortFileName = {
        provider = function()
            local file = vim.fn.expand('%:t')
            if vim.fn.empty(file) == 1 then return '' end

            if vim.bo.modifiable == false then
                vim.api.nvim_command('hi GalaxyFileName guifg='..colors.red)
            end
            return file .. ' '
        end,
        highlight = {colors.b4, colors.bshade},
        condition = condition.buffer_not_empty and checkwidth
    }
}

gls.short_line_right[1] = {
    ShortDiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "+",
        highlight = {colors.green, colors.bshade, "bold"}
    }
}

gls.short_line_right[2] = {
    ShortDiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "~",
        highlight = {colors.yellow, colors.bshade, "bold"}
    }
}

gls.short_line_right[3] = {
    ShortDiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "-",
        highlight = {colors.red, colors.bshade, "bold"},
    }
}

gls.short_line_right[4] = {
    ShortLineColumn = {
        provider = "LineColumn",
        highlight = {colors.b4, colors.bshade},
    }
}
