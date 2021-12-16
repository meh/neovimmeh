(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup {:highlight {:enable true}
                   :indent {:enable true}
                   :textobjects {:enable true}
                   :incremental_selection {:enable true
                                           :keymaps {:init_selection "gnn"
                                                     :node_incremental "grn"
                                                     :scope_incremental "grc"
                                                     :node_decremental "grm"}}
                   :ensure_installed "maintained"
                   :matchup {:enable true}
                   :textobjects {:lsp_interop {:enable true
                                               :border :none
                                               :peek_definition_code {:<leader>df "@function.outer"
                                                                      :<leader>dF "@class.outer"}}}})
