-- [nfnl] fnl/plugin/preview.fnl
local markdown = require("render-markdown")
local image = require("image")
local diagram = require("diagram")
markdown.setup({anti_conceal = {enabled = false}, file_types = {"markdown", "markdown_inline", "pi-prompt-history"}})
image.setup({processor = "magick_rock"})
return diagram.setup({integrations = {require("diagram.integrations.markdown"), require("diagram.integrations.neorg")}, events = {render_buffer = {"InsertLeave", "BufWinEnter"}, clear_buffer = {"InsertEnter"}}, renderer_options = {mermaid = {background = "transparent", theme = "dark", scale = 3}, gnuplot = {theme = "dark"}}})
