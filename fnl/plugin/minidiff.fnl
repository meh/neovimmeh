(local mini (require :mini.diff))

(mini.setup {:view {:style :sign
                    :priority 1
                    :signs {:add "│" :change "│" :delete "│"}}})
