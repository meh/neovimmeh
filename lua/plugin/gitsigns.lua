-- [nfnl] fnl/plugin/gitsigns.fnl
local gs = require("gitsigns")
local function on_attach(bufnr)
  local map
  local function _1_(mode, l, r)
    return vim.keymap.set(mode, l, r, {buffer = bufnr})
  end
  map = _1_
  local function _2_()
    if vim.wo.diff() then
      return "]c"
    else
      vim.schedule(gs.next_hunk)
      return "<Ignore>"
    end
  end
  vim.keymap.set("n", "]c", _2_, {buffer = bufnr, expr = true})
  local function _4_()
    if vim.wo.diff() then
      return "[c"
    else
      vim.schedule(gs.prev_hunk)
      return "<Ignore>"
    end
  end
  vim.keymap.set("n", "[c", _4_, {buffer = bufnr, expr = true})
  map("n", "<leader>hs", gs.stage_hunk)
  map("n", "<leader>hr", gs.reset_hunk)
  local function _6_()
    return gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")})
  end
  map("v", "<leader>hs", _6_)
  local function _7_()
    return gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")})
  end
  map("v", "<leader>hr", _7_)
  map("n", "<leader>hS", gs.stage_buffer)
  map("n", "<leader>hu", gs.undo_stage_hunk)
  map("n", "<leader>hR", gs.reset_buffer)
  map("n", "<leader>hp", gs.preview_hunk)
  local function _8_()
    return gs.blame_line({full = true})
  end
  map("n", "<leader>hb", _8_)
  map("n", "<leader>tb", gs.toggle_current_line_blame)
  map("n", "<leader>hd", gs.diffthis)
  local function _9_()
    return gs.diffthis("~")
  end
  map("n", "<leader>hD", _9_)
  map("n", "<leader>td", gs.toggle_deleted)
  return map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end
return gs.setup({on_attach = on_attach})
