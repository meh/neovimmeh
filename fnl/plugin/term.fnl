(local {: using-monitor?} (require :config.util))
(local term (require :toggleterm))

(term.setup {:orientation (if (using-monitor?) :vertical :horizontal)
             :size (fn [term]
                     (if (using-monitor?)
                         120
                         (math.min 50 (math.floor (/ vim.o.lines 2)))))})
