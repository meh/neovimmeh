-- [nfnl] fnl/plugin/noice.fnl
local noice = require("noice")
local notify = require("notify")
local telescope = require("telescope")
vim.notify = notify
noice.setup({lsp = {override = {["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true, ["cmp.entry.get_documentation"] = true}}, cmdline = {format = {cmdline = {icon = ">"}, search_down = {icon = "v"}, search_up = {icon = "^"}, filter = {icon = "$"}, lua = {icon = "L"}, help = {icon = "?"}}}, format = {level = {icons = {error = "x", warn = "!", info = "?"}}}, popupmenu = {kind_icons = true}, inc_rename = {cmdline = {format = {IncRename = {icon = "#"}}}}, presets = {command_palette = true, long_message_to_split = true, bottom_search = false, inc_rename = false, lsp_doc_border = false}, views = {cmdline_popup = {relative = "editor", position = {row = "50%"}}}})
notify.setup({background_colour = "NotifyBackground", fps = 30, icons = {DEBUG = "", ERROR = "", INFO = "", TRACE = "\226\156\142", WARN = ""}, level = 2, minimum_width = 50, render = "wrapped-compact", stages = "static", time_formats = {notification = "%T", notification_history = "%FT%T"}, timeout = 5000, top_down = true})
telescope.load_extension("noice")
return telescope.load_extension("notify")
