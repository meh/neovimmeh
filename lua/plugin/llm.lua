-- [nfnl] fnl/plugin/llm.fnl
local llm = require("codecompanion")
local adapters = require("codecompanion.adapters")
local function _1_()
  return adapters.extend("openai", {name = "furnace", formatted_name = "Furnace", url = "http://192.168.178.22:11434/v1/chat/completions"})
end
llm.setup({display = {chat = {window = {layout = "float"}}}, adapters = {http = {furnace = _1_}}, strategies = {chat = {adapter = "furnace"}, inline = {adapter = "furnace"}, cmd = {adapter = "furnace"}}, extensions = {contextfiles = {}}})
return vim.api.nvim_create_autocmd("FileType", {pattern = "codecompanion", command = "setlocal nonu nornu"})
