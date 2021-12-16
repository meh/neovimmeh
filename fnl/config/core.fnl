(module config.core
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(a.assoc nvim.o :tabstop 2)
(a.assoc nvim.o :shiftwidth 2)
(a.assoc nvim.o :softtabstop 2)
