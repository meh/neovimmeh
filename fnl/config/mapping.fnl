(module config.mapping
  {autoload {nvim aniseed.nvim}})

(defn remap [mode lhs rhs]
  (nvim.set_keymap mode lhs rhs {:silent true
                                 :noremap true}))

(set nvim.g.mapleader ";")
(set nvim.g.maplocalleader "\\")

; Clear highlighting on enter in normal mode.
(remap :n :<CR> ":noh<CR><CR>")

; Duplicate currents panel in a new tab.
(remap :n :<C-w>T ":tab split<CR>")

; Redo
(remap :n :U :<cmd>redo<cr>)

; Resume search

; Hop.
(remap "" :<localleader>w :<cmd>HopWord<cr>)
(remap :n :f "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
(remap :n :F "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
(remap :o :f "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
(remap :o :F "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
(remap "" :t :<cmd>HopChar1CurrentLineAC<cr>)
(remap "" :T :<cmd>HopChar1CurrentLineBC<cr>)
(remap "" :C :<cmd>HopChar1<cr>)
(remap "" :<C-l> :<cmd>HopLineStart<cr>)
(remap "" :<leader>/ :<cmd>HopPattern<cr>)
