(local {: merge!} (require :nfnl.core))

; Stuff
(vim.cmd "colorscheme darkblood")
(merge! vim.o {:updatetime 250})
(merge! vim.o {:number true
               :relativenumber true
               :signcolumn "yes"
               :statuscolumn "%l%s"
               :winhighlight "Normal:ActiveWindow,NormalNC:InactiveWindow"
               :numberwidth 3
               :cmdheight 0
               :scrollback 100000})

; Indentation
(merge! vim.o {:tabstop 2
               :shiftwidth 2
               :softtabstop 2
               :wrap false})

; Disable mouse shit
(merge! vim.o {:mouse ""})

; Undo history.
(merge! vim.o {:undofile true
               :undodir "/home/meh/.config/nvim/undo"})

(merge! vim.opt {:fillchars {:stl " "
                             :stlnc " "
                             :vert "│"
                             :fold " "}
                 :list true
                 :listchars {:tab "· "
                             :trail "░"
                             :extends "»"
                             :precedes "«"
                             :eol " "}})
(require :config.keys)
(require :config.plugins)
