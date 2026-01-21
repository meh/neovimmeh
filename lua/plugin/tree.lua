-- [nfnl] fnl/plugin/tree.fnl
local tree = require("nvim-tree")
local api = require("nvim-tree.api")
local function on_attach(bufnr)
  return api.config.mappings.default_on_attach(bufnr)
end
return tree.setup({update_focused_file = {enable = true}, on_attach = on_attach})
