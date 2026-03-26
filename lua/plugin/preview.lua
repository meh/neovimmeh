-- [nfnl] fnl/plugin/preview.fnl
local markdown = require("render-markdown")
return markdown.setup({anti_conceal = {enabled = false}, file_types = {"markdown", "opencode_output"}})
