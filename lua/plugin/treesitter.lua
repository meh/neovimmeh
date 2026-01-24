-- [nfnl] fnl/plugin/treesitter.fnl
local treesitter = require("nvim-treesitter")
treesitter.install({"c", "cpp", "cmake", "comment", "go", "java", "javascript", "fennel", "jsx", "lua", "ledger", "markdown", "markdown_inline", "python", "rust", "typescript", "tsx", "vim", "vue", "zsh"})
local function _1_()
  return vim.treesitter.start()
end
return vim.api.nvim_create_autocmd("FileType", {pattern = {"cpp", "cmake", "go", "java", "javascript", "javascriptreact", "ledger", "fennel", "lua", "markdown", "python", "rust", "typescript", "typescriptreact", "vue"}, callback = _1_, group = nvimrc_augroup})
