-- [nfnl] fnl/plugin/lsp.fnl
local _local_1_ = require("nfnl.core")
local merge = _local_1_.merge
local _local_2_ = require("config.util")
local remap = _local_2_.remap
local saga = require("lspsaga")
local cmp = require("cmp_nvim_lsp")
local conform = require("conform")
local signature = require("lsp_signature")
local hilight = require("illuminate")
local function on_attach(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  local bufnr = args.buf
  if client.server_capabilities.document_highlight then
    nvim.command("\n          augroup lsp_document_highlight\n            autocmd! * <buffer>\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n          augroup END")
  else
  end
  signature.on_attach({bind = true, handler_opts = {border = "none"}, hint_enable = false}, bufnr)
  hilight.on_attach(client)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  remap("n", "<leader>si", "<cmd>Lspsaga incoming_calls<cr>", {buffer = bufnr})
  remap("n", "<leader>so", "<cmd>Lspsaga outgoing_calls<cr>", {buffer = bufnr})
  remap("n", "<leader>sO", "<cmd>Lspsaga outline<cr>", {buffer = bufnr})
  remap("n", "<leader>sr", "<cmd>Lspsaga rename<cr>", {buffer = bufnr})
  remap("n", "<leader>sd", "<cmd>Lspsaga peek_definition<cr>", {buffer = bufnr})
  remap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {buffer = bufnr})
  remap("n", "<leader>clr", "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>", {buffer = bufnr})
  remap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions previewer=false<cr>", {buffer = bufnr})
  remap("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>", {buffer = bufnr})
  remap("n", "<leader>cD", "<cmd>Telescope lsp_references theme=get_dropdown <cr>", {buffer = bufnr})
  remap("n", "<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {buffer = bufnr})
  remap("n", "<leader>cn", "<cmd>lua vim.diagnostic.goto_next()<cr>", {buffer = bufnr})
  remap("n", "<leader>cp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {buffer = bufnr})
  remap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", {buffer = bufnr})
  remap("n", "<leader>cs", "<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_dropdown <cr>", {buffer = bufnr})
  remap("n", "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {buffer = bufnr})
  remap("n", "<leader>cx", "<cmd>TroubleToggle<cr>", {buffer = bufnr})
  remap("x", "<leader>ca", "<cmd>Telescope lsp_range_code_actions theme=get_dropdown<cr>", {buffer = bufnr})
  remap("i", "<C-a>", "<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>", {buffer = bufnr})
  return remap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {buffer = bufnr})
end
local capabilities = cmp.default_capabilities()
local flags = {}
local lsps = {rust = {"rust_analyzer"}}
vim.api.nvim_create_autocmd("LspAttach", {callback = on_attach})
local function setup(_4_, settings, _3fraw, _3fon_attach)
  local lsp_name = _4_[1]
  local _3flsp_settings = _4_[2]
  vim.lsp.config(lsp_name, merge(_3fraw, {flags = flags, capabilities = capabilities, settings = {[(_3flsp_settings or lsp_name)] = settings}}))
  return vim.lsp.enable(lsp_name)
end
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "x", [vim.diagnostic.severity.WARN] = "!", [vim.diagnostic.severity.INFO] = "i", [vim.diagnostic.severity.HINT] = "?"}}, underline = false})
conform.setup({formatters_by_ft = {lua = {"stylua"}, python = {"black"}, rust = {"rustfmt", lsp_format = "fallback"}, nix = {"nixfmt"}, javascript = {"prettierd", "prettier", lsp_format = "fallback", stop_at_first = true}}, display = {chat = {window = {width = 0.2}}}, log_level = vim.log.levels.DEBUG, format_on_save = {timeout_ms = 2000, lsp_format = "fallback"}})
saga.setup({symbol_in_winbar = {enable = false}, lightbulb = {enable = false}})
setup({"svelte"}, {format = {enable = true}})
setup({"ts_ls", "typescript"}, {tsserver = {useSyntaxServer = false}, inlayHints = {includeInlayParameterNameHints = "all", includeInlayParameterNameHintsWhenArgumentMatchesName = true, includeInlayFunctionParameterTypeHints = true, includeInlayVariableTypeHints = true, includeInlayVariableTypeHintsWhenTypeMatchesName = true, includeInlayPropertyDeclarationTypeHints = true, includeInlayFunctionLikeReturnTypeHints = true, includeInlayEnumMemberValueHints = true}}, {init_options = {plugins = {{name = "@vue/typescript-plugin", location = (vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"), languages = {"javascript", "typescript", "vue"}}}}, filetypes = {"typescript", "javascript", "javascriptreact", "typescriptreact", "vue"}, inlay_hints = {enabled = true}})
setup({"volar", "typescript"}, {inlayHints = {enumMemberValues = {enabled = true}, functionLikeReturnTypes = {enabled = true}, propertyDeclarationTypes = {enabled = true}, parameterTypes = {enabled = true, suppressWhenArgumentMatchesName = true}, variableTypes = {enabled = true}}}, {init_options = {vue = {hybridMode = false}}, inlay_hints = {enabled = true}})
setup({"tailwindcss"}, {})
setup({"denols"}, {})
setup({"texlab"}, {})
setup({"kotlin_language_server"}, {})
setup({"gopls"}, {})
setup({"clojure_lsp"}, {})
setup({"basedpyright"}, {analysis = {reportMissingTypeStubs = false}})
setup({"gleam"}, {})
return setup({"rust_analyzer"}, {["rust-analyzer"] = {assist = {importGroup = true, importMergeBehavior = "preserve", importPrefix = "by_crate"}, callInfo = {full = true}, cargo = {allFeatures = true, autoreload = true, loadOutDirsFromCheck = true}, checkOnSave = {enable = true, allFeatures = true, extraArgs = {"--target-dir", "/home/meh/.cache/nvim/rust"}}, completion = {addCallArgumentSnippets = true, addCallParenthesis = true, postfix = {enable = true}, autoimport = {enable = true}}, diagnostics = {enable = true, enableExperimental = true, disabled = {"unresolved-proc-macro"}}, hoverActions = {enable = true, debug = true, gotoTypeDef = true, implementations = true, run = true, linksInHover = true}, lens = {enable = true, debug = true, implementations = true, run = true, methodReferences = true, references = true}, notifications = {cargoTomlNotFound = true}, procMacro = {enable = true}}})
