-- [nfnl] fnl/plugin/snacks.fnl
local snacks = require("snacks")
local function _1_(...)
  return require("opencode").snacks_picker_send(...)
end
return snacks.setup({bigfile = {enabled = true}, input = {}, picker = {enabled = true, actions = {opencode_send = _1_}, win = {input = {keys = {["<a-a>"] = {"opencode_send", {mode = {"n", "i"}}}}}}}, quickfile = {enabled = true}})
