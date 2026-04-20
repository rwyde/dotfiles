-- colors/tomorrow.lua
local theme = require("tomorrow.theme")

for group, opts in pairs(theme) do
  vim.api.nvim_set_hl(0, group, opts)
end

