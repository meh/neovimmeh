-- [nfnl] fnl/plugin/term.fnl
local _local_1_ = require("config.util")
local using_monitor_3f = _local_1_["using-monitor?"]
local term = require("toggleterm")
local _2_
if using_monitor_3f() then
  _2_ = "vertical"
else
  _2_ = "horizontal"
end
local function _4_(term0)
  if using_monitor_3f() then
    return 120
  else
    return math.min(50, math.floor((vim.o.lines / 2)))
  end
end
return term.setup({orientation = _2_, size = _4_})
