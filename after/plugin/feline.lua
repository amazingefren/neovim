local has_icons, icons = pcall(require, "nvim-web-devicons")
local has_f, f = pcall(require, "feline")
if not has_f or not has_icons then
  return
end
icons.setup()

local colors = require("dev-theme.colors")
local el = {
  mode_icon = {
    provider = "vi_mode",
    -- left_sep = {str=" ", hl={bg='NONE'}},
    -- right_sep = {str=" ", hl={bg='NONE'}},
    -- right_sep = " ",
    hl = function()
      return {
        name = require('feline.providers.vi_mode').get_mode_highlight_name(),
        fg=colors.shade,
        bg=require("feline.providers.vi_mode").get_mode_color(),
        style='bold',
      }
    end
  },
  mode = {
    provider = "vi_mode",
    -- hl = {bg = colors.red, fg = colors.bshade}
    icon = "",
    hl = function()
      return {
        name = require("feline.providers.vi_mode").get_mode_highlight_name(),
        bg = require("feline.providers.vi_mode").get_mode_color(),
        fg = colors.shade,
        style = "bold"
      }
    end
  }
}

local components = {
  active = {
    {
      el.mode_icon,
      el.mode,
    }
  },
  inactive = {
    {el.mode}
  }
}

f.setup(
  {
    bg=colors.purple,
    fg=colors.dark,
    components = components,
    vi_mode_colors = {
      ["NORMAL"] = colors.purple,
      ["OP"] = colors.purple,
      ["INSERT"] = colors.green,
      ["VISUAL"] = colors.cyan,
      ["LINES"] = colors.cyan,
      ["BLOCK"] = colors.cyan,
      ["REPLACE"] = colors.red,
      ["V-REPLACE"] = colors.red,
      ["ENTER"] = colors.orange,
      ["MORE"] = colors.orange,
      ["SELECT"] = colors.yellow,
      ["COMMAND"] = colors.purple,
      ["SHELL"] = colors.purple,
      ["TERM"] = colors.purple,
      ["NONE"] = colors.fg
    }
  }
)
