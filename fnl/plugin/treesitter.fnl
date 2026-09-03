(local treesitter (require :nvim-treesitter))
;(local textobjects (require :nvim-treesitter-textobjects))

(treesitter.install
 [:c :cpp :cmake :comment :go :java :javascript :fennel
  :jsx :lua :ledger :markdown :markdown_inline :cue
  :html :latex :yaml :css :scss :svelte :typst :regex :bash
  :python :rust :typescript :tsx :vim :vue :zsh :graphql])

;(textobjects:setup)
; {:select {:lookahead true}
;  :move {:set_jumps true}})

;; Autocommands
(vim.api.nvim_create_autocmd
  :FileType
  {:pattern [:cpp :cmake :go :java :javascript :javascriptreact :ledger :fennel
             :html :latex :yaml :css :scss :svelte :typst :regex :bash :cue
             :lua :markdown :python :rust :typescript :typescriptreact :vue :graphql
             :pi-chat-history]
   :callback #(vim.treesitter.start)
   :group nvimrc_augroup})
