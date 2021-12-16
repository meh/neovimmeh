(module config.plugin.lualine
  {autoload {nvim aniseed.nvim
             lualine lualine
             session auto-session-library}})

(def- timer (vim.loop.new_timer))

; Add a timer to re-render the tabline.
(timer:start 0 250 (vim.schedule_wrap (fn [] (nvim.command :redrawtabline))))

(nvim.command "set guioptions-=e
               set showtabline=2
               set sessionoptions+=tabpages,globals")

(def- theme {:normal {:a {:bg 244 :fg 255 :gui :bold}
                      :b {:bg 238 :fg 255 :gui :bold}
                      :c {:bg 234 :fg 245}}
             :insert {:a {:bg 124 :fg 255 :gui :bold}
                      :b {:bg 88 :fg 255 :gui :bold}
                      :c {:bg 52  :fg 255}}
             :visual {:a {:bg 255 :fg :black}
                      :b {:bg 250 :fg :black}
                      :c {:bg 246 :fg :black}}
             :replace {:a {:bg :black :fg :black}
                       :b {:bg :black :fg :black}
                       :c {:bg :black :fg :black}}
             :command {:a {:bg 237 :fg 255 :gui :bold}
                       :b {:bg 235 :fg 255 :gui :bold}
                       :c {:bg 232 :fg 245}}
             :inactive {:a {:bg 238 :fg 255}
                        :b {:bg 235 :fg 255}
                        :c {:bg 232 :fg 245}}})

(lualine.setup {:extensions [:fugitive :nvim-tree :quickfix :toggleterm]
                :options {:icons_enabled false
                          :component_separators {:left "" :right ""}
                          :section_separators {:left "" :right ""}
                          :theme theme}
                :sections {:lualine_a [{1 :mode :fmt (fn [str] (str:sub 1 1))}]
                           :lualine_b [:branch :diff]
                           :lualine_c [{1 :diagnostics
                                        :symbols {:error :x
                                                  :warn :!
                                                  :info :i
                                                  :hint :?}}
                                       {1 :filename
                                        :path 1}]
                           :lualine_x [:filetype]
                           :lualine_y [:progress]
                           :lualine_z [:location]}
                :tabline {:lualine_a []
                          :lualine_b [{1 :buffers
                                       :show_filename_only false}]
                          :lualine_c []
                          :lualine_x [:lsp_progress]
                          :lualine_y [:tabs]
                          :lualine_z [(fn [] (session.current_session_name))]}
                :inactive_sections {:lualine_a []
                                    :lualine_b [:filename]
                                    :lualine_c [:filename]
                                    :lualine_x [:location]
                                    :lualine_y []
                                    :lualine_z []}})
