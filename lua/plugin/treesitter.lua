-- [nfnl] fnl/plugin/treesitter.fnl
local treesitter = require("nvim-treesitter.config")
return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, textobjects = {lsp_interop = {enable = true, border = "none", peek_definition_code = {["<leader>df"] = "@function.outer", ["<leader>dF"] = "@class.outer"}}}, incremental_selection = {enable = true, keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}}, matchup = {enable = true}, playground = {enable = true}})
