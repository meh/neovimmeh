-- [nfnl] fnl/plugin/llm.fnl
local _local_1_ = require("config.util")
local remap = _local_1_.remap
local on_monitor_3f = _local_1_["on-monitor?"]
local companion = require("codecompanion")
local adapters = require("codecompanion.adapters")
local mcphub = require("mcphub")
local function _2_()
  return adapters.extend("claude_code", {env = {CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_TOKEN}})
end
local function _3_()
  return adapters.extend("openai", {name = "furnace", formatted_name = "Furnace", url = "http://192.168.178.22:11434/v1/chat/completions"})
end
companion.setup({display = {chat = {window = {layout = "float"}}}, adapters = {acp = {claude_code = _2_}, http = {furnace = _3_}}, strategies = {chat = {adapter = "claude_code"}, inline = {adapter = "claude_code"}, cmd = {adapter = "claude_code"}}, interactions = {chat = {opts = {completion_provider = "cmp"}}}, extensions = {contextfiles = {}, mcphub = {callback = "mcphub.extensions.codecompanion", opts = {make_vars = true, make_slash_commands = true, show_result_in_chat = true}}}})
vim.api.nvim_create_autocmd("FileType", {pattern = "codecompanion", command = "setlocal nonu nornu"})
local function open_chat()
  if on_monitor_3f() then
    return companion.toggle({window_opts = {layout = "vertical", width = 120}})
  else
    return companion.toggle({window_opts = {layout = "vertical", width = 80}})
  end
end
remap("n", "<leader>cc", open_chat)
return mcphub.setup({global_env = {FIGMA_ACCESS_TOKEN = vim.env.FIGMA_ACCESS_TOKEN}, make_tools = true, show_server_tools_in_chat = true, make_slash_commands = true})
