(local tree (require :nvim-tree))
(local api (require :nvim-tree.api))

(fn on_attach [bufnr]
  (do
    (api.config.mappings.default_on_attach bufnr)))

(tree.setup {:update_focused_file {:enable true}
             :on_attach on_attach})
