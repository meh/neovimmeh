-- [nfnl] fnl/config/util.fnl
local _local_1_ = require("nfnl.core")
local map = _local_1_.map
local merge = _local_1_.merge
local function on_monitor_3f()
  return (vim.o.columns > 400)
end
local function remap(mode, lhs, rhs, flags_3f)
  return vim.keymap.set(mode, lhs, rhs, merge({silent = true, remap = false}, flags))
end
local function on_filetype(filetype, callback)
  return vim.api.nvim_create_autocmd("FileType", {pattern = filetype, callback = callback})
end
return {["on-monitor?"] = on_monitor_3f, remap = remap, ["on-filetype"] = on_filetype}
