(local {: on-monitor? : remap} (require :config.util))
(local term (require :toggleterm))
(local {: Terminal} (require :toggleterm.terminal))

(fn terminal []
  (if (on-monitor?)
      (Terminal:new {:id 0
                     :direction :vertical})
      (Terminal:new {:id 0
                     :direction :horizontal})))

(fn terminal-size [term]
  (if (on-monitor?)
      120
      30))

(term.setup {:size terminal-size})
(remap :n :<leader>tt (fn [] (: (terminal) :toggle)))
