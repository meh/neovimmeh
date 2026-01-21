-- [nfnl] fnl/plugin/mason.fnl
local mason = require("mason")
local mason_dap = require("mason-nvim-dap")
mason.setup()
return mason_dap.setup({automatic_setup = true, handlers = {}, ensure_installed = {"debugpy"}})
