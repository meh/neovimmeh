-- [nfnl] fnl/plugin/cmp.fnl
local _local_1_ = require("nfnl.core")
local assoc = _local_1_.assoc
local nil_3f = _local_1_["nil?"]
local cmp = require("cmp")
local function has_words_before()
  local _let_2_ = vim.api.nvim_win_get_cursor(0)
  local line = _let_2_[1]
  local col = _let_2_[2]
  local and_3_ = (col ~= 0)
  if and_3_ then
    local function _4_()
      local tmp_3_ = vim.buf_get_lines(0, (1 - line), line, true)
      if (nil ~= tmp_3_) then
        local tmp_3_0 = tmp_3_[1]
        if (nil ~= tmp_3_0) then
          local tmp_3_1 = tmp_3_0:sub(col, col)
          if (nil ~= tmp_3_1) then
            return tmp_3_1:match("%s")
          else
            return nil
          end
        else
          return nil
        end
      else
        return nil
      end
    end
    and_3_ = not nil_3f(_4_())
  end
  return and_3_
end
assoc(vim.o, "completeopt", "menuone,noselect")
local next
local function _8_(fallback)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif snip.expand_or_jumpable() then
    return snip.expand_or_jump()
  elseif has_words_before() then
    return cmp.complete()
  else
    return fallback()
  end
end
next = cmp.mapping(_8_, {"i", "s"})
local prev
local function _10_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  else
    return fallback()
  end
end
prev = cmp.mapping(_10_, {"i", "s"})
cmp.setup({sources = {{name = "vim_lsp"}, {name = "buffer"}, {name = "path"}}, mapping = {["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}), ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}), ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}), ["<C-c>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}), ["<CR>"] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Replace}), ["<C-k>"] = prev, ["<C-j>"] = next, ["<Tab>"] = next, ["<S-Tab>"] = prev}, sorting = {priority_weight = 2, comparators = {cmp.config.compare.order, cmp.config.recently_used, cmp.config.locality, cmp.config.scopes}}})
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
return cmp.setup.cmdline({":"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "path", priority = 1}, {name = "cmdline", priority = 0}, {name = "buffer", priority = 99}}})
