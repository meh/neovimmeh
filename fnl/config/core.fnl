(module config.core
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

; Stuff
(nvim.command "colorscheme darkblood")
(a.merge! nvim.o {:updatetime 250})

; Indentation
(a.merge! nvim.o {:tabstop 2
                  :shiftwidth 2
                  :softtabstop 2})

(nvim.command "autocmd FileType rust set tabstop=2 shiftwidth=2 softtabstop=2")

; Undo history.
(a.merge! nvim.o {:undofile true
                  :undodir "~/.config/nvim/undo"})
