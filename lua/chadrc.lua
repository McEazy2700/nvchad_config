-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.4, vsp = 0.4 },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}
M.plugins = "plugins"

return M
