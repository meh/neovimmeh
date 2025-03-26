(module config.plugin.tree
  {autoload {nvim aniseed.nvim
             a aniseed.core
             tree nvim-tree
             config nvim-tree.config
             api nvim-tree.api}})

(defn on_attach [bufnr]
  (do
    (api.config.mappings.default_on_attach bufnr)))

(tree.setup {:update_focused_file {:enable true}
             :on_attach on_attach})
