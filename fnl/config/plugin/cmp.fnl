(module config.plugin.cmp
  {autoload {nvim aniseed.nvim
             a aniseed.core
             cmp cmp
             snip luasnip}})

(defn- has-words-before []
  (let [[line col] (nvim.win_get_cursor 0)]
    (and (not= col 0)
         (nil? (: (: (. 1 (nvim.buf_get_lines 0 (- 1 line) line true))
                     :sub col col)
                  :match :%s)))))

(a.assoc nvim.o :completeopt "menuone,noselect")

(cmp.setup {:sources [{:name :nvim_lsp}
                      {:name :buffer}
                      {:name :path}
                      {:name :cmdline}
                      {:name :luasnip}]
            :mapping {:<C-u> (cmp.mapping (cmp.mapping.scroll_docs -4) [:i :c])
                      :<C-d> (cmp.mapping (cmp.mapping.scroll_docs 4) [:i :c])
                      :<C-Space> (cmp.mapping (cmp.mapping.complete) [:i :c])
                      :<Esc> (cmp.mapping {:i (cmp.mapping.abort)
                                           :c (cmp.mapping.close)})
                      :<CR> (cmp.mapping.confirm {:select true})
                      :<Tab> (cmp.mapping (fn [fallback]
                                            (if (cmp.visible) (cmp.select_next_item)
                                                (snip.expand_or_jumpable) (snip.expand_or_jump)
                                                (has-words-before) (cmp.complete)
                                                (fallback)))
                                          [:i :s])
                      :<S-Tab> (cmp.mapping (fn [fallback]
                                              (if (cmp.visible) (cmp.select_prev_item)
                                                  (snip.jumpable -1) (snip.jump -1)
                                                  (fallback))))}
            :snippet {:expand (fn [args] (snip.lsp_expand args.body))}
            :experimental {:native_menu true
                           :ghost_text true}})
