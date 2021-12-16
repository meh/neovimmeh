(module config.keys
  {autoload {nvim aniseed.nvim}})

(defn remap [mode lhs rhs]
  (nvim.set_keymap mode lhs rhs {:silent true
                                 :noremap true}))

(set nvim.g.mapleader ";")
(set nvim.g.maplocalleader "\\")

;; Clear highlighting on enter in normal mode.
(remap :n :<Space> ":noh<CR>")

;; Duplicate currents panel in a new tab.
(remap :n :<C-w>T ":tab split<CR>")

;; Redo
(remap :n :U :<cmd>redo<cr>)

;; Hop.
(remap "" :<localleader>w :<cmd>HopWord<cr>)
(remap :n :f "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
(remap :n :F "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
(remap :o :f "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
(remap :o :F "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
(remap "" :t :<cmd>HopChar1CurrentLineAC<cr>)
(remap "" :T :<cmd>HopChar1CurrentLineBC<cr>)
(remap "" :<leader>c :<cmd>HopChar1<cr>)
(remap "" :<C-l> :<cmd>HopLineStart<cr>)
(remap "" :<leader>/ :<cmd>HopPattern<cr>)

;; Resume search.
(remap :n "<leader>'" "<cmd>Telescope resume<cr>")

;; Buffers.
(remap :n :<leader>bb "<cmd>Telescope buffers previewer=false<cr>")
(remap :n :<leader>bd "<cmd>bdel<cr>")
(remap :n :<leader>bD "<cmd>bdel!<cr>")
(remap :n :<leader>bn "<cmd>new<cr>")
(remap :n :<leader>bv "<cmd>vnew<cr>")

;; Tabs.
(remap :n :<leader>br "<cmd>tabn<cr>")
(remap :n :<leader>bc "<cmd>tabp<cr>")
(remap :n :<leader>bt "<cmd>tabnew<cr>")

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
