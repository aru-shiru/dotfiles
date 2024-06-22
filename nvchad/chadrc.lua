---@type ChadrcConfig
local M = {}

M.ui = { 
  theme = 'ashes',
  tabufline = {
    enabled = false
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M