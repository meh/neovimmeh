-- [nfnl] fnl/config/init.fnl
local _local_1_ = require("nfnl.core")
local merge_21 = _local_1_["merge!"]
vim.cmd("colorscheme darkblood")
merge_21(vim.o, {updatetime = 250})
merge_21(vim.o, {number = true, relativenumber = true, signcolumn = "yes", statuscolumn = "%l%s", winhighlight = "Normal:ActiveWindow,NormalNC:InactiveWindow", numberwidth = 3, cmdheight = 0, scrollback = 100000})
merge_21(vim.o, {tabstop = 2, shiftwidth = 2, softtabstop = 2, wrap = false})
merge_21(vim.o, {mouse = ""})
merge_21(vim.o, {undofile = true, undodir = "/home/meh/.config/nvim/undo"})
merge_21(vim.opt, {fillchars = {stl = " ", stlnc = " ", vert = "\226\148\130", fold = " "}, list = true, listchars = {tab = "\194\183 ", trail = "\226\150\145", extends = "\194\187", precedes = "\194\171", eol = " "}})
require("config.keys")
return require("config.plugins")
