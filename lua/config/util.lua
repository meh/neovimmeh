-- [nfnl] fnl/config/util.fnl
local _local_1_ = require("nfnl.core")
local map = _local_1_.map
local merge = _local_1_.merge
local function using_monitor_3f()
  local xrandr = vim.fn.system({"xrandr"})
  return string.match(xrandr, "DP-1 connected")
end
return {["using-monitor?"] = using_monitor_3f}
