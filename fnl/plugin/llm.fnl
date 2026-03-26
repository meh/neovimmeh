(local {: remap : on-monitor?} (require :config.util))
(local mcphub (require :mcphub))
(local opencode (require :opencode))
(local oryx (require :opencode-jobs))
;(local companion (require :codecompanion))
;(local adapters (require :codecompanion.adapters))

(mcphub.setup {:global_env {:FIGMA_ACCESS_TOKEN vim.env.FIGMA_ACCESS_TOKEN}
               :make_tools true
               :show_server_tools_in_chat true
               :make_slash_commands true})

;(companion.setup {:display {:chat {:window {:layout :float}}}
;                  :adapters {:acp {:claude_code
;                                   (fn [] (adapters.extend
;                                            :claude_code
;                                            {:env {:CLAUDE_CODE_OAUTH_TOKEN vim.env.CLAUDE_CODE_TOKEN}}))}
;
;                              :http {:furnace (fn [] (adapters.extend
;                                                       :openai
;                                                       {:name :furnace
;                                                        :formatted_name "Furnace"
;                                                        :url "http://127.0.0.1:11434/v1/chat/completions"}))}}
;                  :strategies {:chat {:adapter :opencode :model "Qwen3-Coder: a3b-30b (local)"};:claude_code :model :opus}
;                               :inline {:adapter :opencode};:claude_code}
;                               :cmd {:adapter :furnace}};:claude_code}}
;                  :interactions {:chat {:opts {:completion_provider :cmp}
;                                        :slash_commands {:file {:opts {:provider :telescope}}}}}
;                  :extensions {:contextfiles {}
;                               :spinner {:opts {:style :noice}}
;                               :history {
;                                 :enabled true}
;                               :mcphub {:callback "mcphub.extensions.codecompanion"
;                                         :opts {:make_vars true
;                                                :make_slash_commands true
;                                                :show_result_in_chat true}}}})
;
;(vim.api.nvim_create_autocmd :FileType {
;  :pattern "codecompanion"
;  :command "setlocal nonu nornu" })
;
;(fn open-chat []
;  (if (on-monitor?)
;      (companion.toggle {:window_opts {:layout :vertical :width 120}})
;      (companion.toggle {:window_opts {:layout :vertical :width 80}})))
;
;(remap :n :<leader>cc open-chat)

(opencode.setup {:ui {:position :left
                      :window_width 0.33
                      ;:questions {:use_vim_ui_select true}
                      :input {:min_height 0.15
                              :max_height 0.15}}})

(oryx.setup {})
