(local llm (require :codecompanion))
(local adapters (require :codecompanion.adapters))

(llm.setup {:display {:chat {:window {:layout :float}}}
            :adapters {:http {:furnace (fn [] (adapters.extend :openai
                                                               {:name :furnace
                                                                :formatted_name "Furnace"
                                                                :url "http://192.168.178.22:11434/v1/chat/completions"}))}}
            :strategies {:chat {:adapter :furnace}
                         :inline {:adapter :furnace}
                         :cmd {:adapter :furnace}}
            :extensions {:contextfiles {}}})

(vim.api.nvim_create_autocmd :FileType {
  :pattern "codecompanion"
  :command "setlocal nonu nornu" })


