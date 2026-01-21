-- [nfnl] fnl/plugin/preview.fnl
local mkv = require("markview")
return mkv.setup({preview = {filetypes = {"markdown", "codecompanion"}, ignore_buftypes = {}}})
