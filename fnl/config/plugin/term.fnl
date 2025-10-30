(module config.plugin.term
  {autoload {nvim aniseed.nvim
             term toggleterm}})

(term.setup {:size (fn [term] (math.min 50 (math.floor (/ vim.o.lines 2))))})
