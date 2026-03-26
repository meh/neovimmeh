-- [nfnl] fnl/plugin/llm.fnl
local _local_1_ = require("config.util")
local remap = _local_1_.remap
local on_monitor_3f = _local_1_["on-monitor?"]
local mcphub = require("mcphub")
local opencode = require("opencode")
local oryx = require("opencode-jobs")
mcphub.setup({global_env = {FIGMA_ACCESS_TOKEN = vim.env.FIGMA_ACCESS_TOKEN}, make_tools = true, show_server_tools_in_chat = true, make_slash_commands = true})
opencode.setup({ui = {position = "left", window_width = 0.33, input = {min_height = 0.15, max_height = 0.15}}})
return oryx.setup({})
