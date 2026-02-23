-- [nfnl] fnl/plugin/preview.fnl
local mkv = require("markview")
return mkv.setup({preview = {filetypes = {"markdown", "codecompanion"}, ignore_buftypes = {}, hybrid_modes = {"n"}, linewise_hybrid_mode = true}})
