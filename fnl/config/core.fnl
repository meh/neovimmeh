(module config.core
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

; Stuff
(nvim.command "colorscheme darkblood")
(a.merge! nvim.o {:updatetime 250})
(a.merge! nvim.o {:number true
                  :relativenumber true
                  :signcolumn "auto"
                  :statuscolumn "%l%s"
                  :numberwidth 3})

; Indentation
(a.merge! nvim.o {:tabstop 2
                  :shiftwidth 2
                  :softtabstop 2
                  :wrap false})

; Disable mouse shit
(a.merge! nvim.o {:mouse ""})

; Undo history.
(a.merge! nvim.o {:undofile true
                  :undodir "/home/meh/.config/nvim/undo"})

(a.merge! nvim.opt {:fillchars {:stl " "
                                :stlnc " "
                                :vert "│"
                                :fold " "}
                    :list true
                    :listchars {:tab "· "
                                :trail "░"
                                :extends "»"
                                :precedes "«"
                                :eol " "}})
