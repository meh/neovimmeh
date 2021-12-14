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
                   :ensure_installed "maintained"})
