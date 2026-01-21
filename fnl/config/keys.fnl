(local {: merge!} (require :nfnl.core))

(fn remap [mode lhs rhs]
  (vim.keymap.set mode lhs rhs {:silent true
                                :remap false}))

(merge! vim.g {:mapleader ";"
               :maplocalleader "\\"})

;; Clear highlighting on enter in normal mode.
(remap :n :<Space> ":noh<CR>")

;; Terminal
(remap :n :<leader>tt "<cmd>ToggleTerm<CR>")
(remap :n :<leader>tT "<cmd>ToggleTermToggleAll<CR>")

;; Redo
(remap :n :U :<cmd>redo<cr>)

;; Hop.
;(remap "" :<localleader>w :<cmd>HopWord<cr>)
;(remap :n :f "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
;(remap :n :F "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
;(remap :o :f "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
;(remap :o :F "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
;(remap "" :t :<cmd>HopChar1CurrentLineAC<cr>)
;(remap "" :T :<cmd>HopChar1CurrentLineBC<cr>)
;(remap "" :<leader>c :<cmd>HopChar1<cr>)
;(remap "" :<C-l> :<cmd>HopLineStart<cr>)
;(remap "" :<leader>/ :<cmd>HopPattern<cr>)

;; Resume search.
(remap :n "<leader>'" "<cmd>Telescope resume<cr>")

;; Buffers.
(remap :n :<leader>bb "<cmd>Telescope buffers previewer=false<cr>")
(remap :n :<leader>bd "<cmd>bdel<cr>")
(remap :n :<leader>bD "<cmd>bdel!<cr>")
(remap :n :<leader>bh "<cmd>new<cr>")
(remap :n :<leader>bv "<cmd>vnew<cr>")

;; Windows.
(remap :n :<leader>wd "<cmd>q<cr>")
(remap :n :<leader>wD "<cmd>q!<cr>")

;; Tabs.
(remap :n :<C-w>T ":tab split<CR>")

(remap :n :<leader>tn "<cmd>tabnext<cr>")
(remap :n :<leader>tp "<cmd>tabprev<cr>")
(remap :n :<leader>to "<cmd>tabnew<cr>")
(remap :n :<leader>td "<cmd>tabclose<cr>")

(for [i 1 9]
  (remap :n (.. :<leader> i) (.. i :gt)))

(remap :n :H "<cmd>tabprev<cr>")
(remap :n :L "<cmd>tabnext<cr>")

;; Files.
(remap :n :<leader>ff "<cmd>Telescope find_files previewer=false<cr>")
(remap :n :<leader>fT "<cmd>Telescope filetypes previewer=false<cr>")

;; File history.
(remap :n :<leader>fh "<cmd>Telescope oldfiles previewer=false<cr>")

;; Git.
(remap :n :<leader><leader> "<cmd>Telescope git_files previewer=false<cr>")
(remap :n :<leader>gb "<cmd>Telescope git_branches previewer=false<cr>")
(remap :n :<leader>gg "<cmd>Git<cr>")

;; Search.
(remap :n :<leader>sc "<cmd>Telescope command_history previewer=false<cr>")
(remap :n :<leader>sm "<cmd>Telescope marks<cr>")
(remap :n :<leader>sp "<cmd>Telescope live_grep<cr>")
(remap :n :<leader>sr "<cmd>Telescope registers<cr>")
(remap :n :<leader>ss "<cmd>Telescope current_buffer_fuzzy_find<cr>")

;; Quickfix.
(remap :n :<leader>cq "<cmd>Telescope quickfix previewer=false<cr>")
(remap :n "<leader>c(" "<cmd>cp<cr>")
(remap :n "<leader>c)" "<cmd>cn<cr>")

;; Sessions.
(remap :n :<leader>Ss "<cmd>SearchSessions")

;; Clipboard
(remap :n :<leader>cl "<cmd>Telescope neoclip")

;; Tags.
(remap :n :<leader>cT "<cmd>Telescope tags<CR>")
(remap :n :gd "<C-]>")

;; Filetree.
(remap :n :<leader>ft "<cmd>NvimTreeToggle<CR>")

;; Plugins.
(remap :n :<leader>pc "<cmd>PackerClean<cr>")
(remap :n :<leader>pC "<cmd>PackerCompile<cr>")
(remap :n :<leader>pi "<cmd>PackerInstall<cr>")
(remap :n :<leader>ps "<cmd>PackerStatus<cr>")
(remap :n :<leader>pS "<cmd>PackerSync<cr>")
(remap :n :<leader>pu "<cmd>PackerUpdate<cr>")
(remap :n :<leader>uu "<cmd>UndotreeToggle<cr>")

(remap :n :<leader>cc "<cmd>CodeCompanionChat<cr>" {})
