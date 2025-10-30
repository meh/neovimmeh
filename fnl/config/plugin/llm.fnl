(module config.plugin.llm
  {autoload {nvim aniseed.nvim
             a aniseed.core
             adapters codecompanion.adapters
             mcp mcphub
             llm codecompanion}})

(llm.setup {:display {:chat {:window {:layout :float}}}
            :adapters {:http {:furnace (fn [] (adapters.extend :openai
                                                               {:name :furnace
                                                                :formatted_name "Furnace"
                                                                :url "http://192.168.178.22:11434/v1/chat/completions"}))}}
            :strategies {:chat {:adapter :furnace}
                         :inline {:adapter :furnace}
                         :cmd {:adapter :furnace}}
            :extensions {:contextfiles {}
                         :mcphub {:callback :mcphub.extensions.codecompanion
                                  :opts {:make_vars true
                                         :make_slash_commands true
                                         :show_result_in_chat true}}}})

(vim.api.nvim_create_autocmd :FileType {
  :pattern "codecompanion"
  :command "setlocal nonu nornu" })
