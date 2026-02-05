-- [nfnl] fnl/plugin/completion.fnl
local _local_1_ = require("nfnl.core")
local assoc = _local_1_.assoc
local nil_3f = _local_1_["nil?"]
local blink = require("blink.cmp")
local colorful_menu = require("colorful-menu")
local function _2_()
  return true
end
return blink.setup({completion = {ghost_text = {enabled = true, show_with_menu = false}, menu = {max_height = 30, draw = {columns = {{"kind_icon"}, {"label", gap = 1}}, components = {label = {width = {fill = true}, text = colorful_menu.blink_components_text, highlight = colorful_menu.blink_components_highlight}}}, auto_show = false}}, keymap = {preset = "none", ["<Tab>"] = {"show", "fallback"}, ["<Enter>"] = {"select_and_accept", "fallback"}, ["<M-j>"] = {"select_next", "fallback"}, ["<M-k>"] = {"select_prev", "fallback"}, ["<Esc>"] = {"hide", "fallback"}}, cmdline = {keymap = {["<Esc>"] = {"hide", "fallback"}}, completion = {ghost_text = {enabled = true}}}, signature = {enabled = true}, enabled = _2_})
