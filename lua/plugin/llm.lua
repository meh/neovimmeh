-- [nfnl] fnl/plugin/llm.fnl
local _local_1_ = require("config.util")
local remap = _local_1_.remap
local on_monitor_3f = _local_1_["on-monitor?"]
local companion = require("codecompanion")
local adapters = require("codecompanion.adapters")
local function _2_()
  return adapters.extend("openai", {name = "furnace", formatted_name = "Furnace", url = "http://192.168.178.22:11434/v1/chat/completions"})
end
companion.setup({display = {chat = {window = {layout = "float"}}}, adapters = {http = {furnace = _2_}}, strategies = {chat = {adapter = "furnace"}, inline = {adapter = "furnace"}, cmd = {adapter = "furnace"}}, extensions = {contextfiles = {}}})
vim.api.nvim_create_autocmd("FileType", {pattern = "codecompanion", command = "setlocal nonu nornu"})
local function open_chat()
  if on_monitor_3f() then
    return companion.toggle({window_opts = {layout = "vertical", width = 120}})
  else
    return companion.toggle({window_opts = {layout = "vertical", width = 80}})
  end
end
return remap("n", "<leader>cc", open_chat)
