-- [nfnl] fnl/plugin/minidiff.fnl
local mini = require("mini.diff")
return mini.setup({view = {style = "sign", priority = 1, signs = {add = "\226\148\130", change = "\226\148\130", delete = "\226\148\130"}}})
