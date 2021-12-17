(module config.core
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(nvim.command "colorscheme darkblood")

(a.assoc nvim.o :tabstop 2)
(a.assoc nvim.o :shiftwidth 2)
(a.assoc nvim.o :softtabstop 2)

(nvim.command "autocmd FileType rust set tabstop=2 shiftwidth=2 softtabstop=2")
