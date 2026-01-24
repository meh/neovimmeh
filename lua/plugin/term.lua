-- [nfnl] fnl/plugin/term.fnl
local _local_1_ = require("config.util")
local on_monitor_3f = _local_1_["on-monitor?"]
local remap = _local_1_.remap
local term = require("toggleterm")
local _local_2_ = require("toggleterm.terminal")
local Terminal = _local_2_.Terminal
local function terminal()
  if on_monitor_3f() then
    return Terminal:new({id = 0, direction = "vertical"})
  else
    return Terminal:new({id = 0, direction = "horizontal"})
  end
end
local function terminal_size(term0)
  if on_monitor_3f() then
    return 120
  else
    return 30
  end
end
term.setup({size = terminal_size})
local function _5_()
  return terminal():toggle()
end
return remap("n", "<leader>tt", _5_)
