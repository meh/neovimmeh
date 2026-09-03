-- [nfnl] fnl/plugin/bionic.fnl
local bionic = require("bionic-reading")
return bionic.setup({file_types = {text = "any", lua = {"comment"}, markdown = "any"}})
