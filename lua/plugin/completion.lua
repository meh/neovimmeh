-- [nfnl] fnl/plugin/completion.fnl
local _local_1_ = require("nfnl.core")
local assoc = _local_1_.assoc
local nil_3f = _local_1_["nil?"]
local cmp = require("cmp")
local context = require("cmp.config.context")
assoc(vim.o, "completeopt", "menuone,noselect")
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line_content = vim.api.nvim_buf_get_lines(0, (line - 1), line, true)[1]
  local before_cursor = line_content:sub(col, col)
  return ((col ~= 0) and (before_cursor:match("%s") == nil))
end
local next
local function _2_(fallback)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif has_words_before() then
    return cmp.complete()
  else
    return fallback()
  end
end
next = cmp.mapping(_2_, {"i", "s"})
local prev
local function _4_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  else
    return fallback()
  end
end
prev = cmp.mapping(_4_, {"i", "s"})
local function enabled()
  return not context.in_treesitter_capture("comment")
end
cmp.setup({sources = {{name = "nvim_lsp", priority = 8}, {name = "buffer", priority = 7}, {name = "fuzzy_path", priority = 4}}, mapping = {["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}), ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}), ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}), ["<C-c>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}), ["<CR>"] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Replace}), ["<C-k>"] = prev, ["<C-j>"] = next, ["<Tab>"] = next, ["<S-Tab>"] = prev}, sorting = {priority_weight = 2, comparators = {cmp.config.compare.order, cmp.config.recently_used, cmp.config.locality, cmp.config.scopes}}, enabled = enabled})
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
return cmp.setup.cmdline({":"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "path", priority = 1}, {name = "cmdline", priority = 0}, {name = "buffer", priority = 99}}})
