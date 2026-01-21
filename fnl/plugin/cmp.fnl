(local {: assoc : nil?} (require :nfnl.core))
(local cmp (require :cmp))

(fn has-words-before []
  (let [[line col] (vim.api.nvim_win_get_cursor 0)]
    (and (not= col 0)
         (not (nil? (-?> (vim.buf_get_lines 0 (- 1 line) line true)
                           (. 1)
                           (: :sub col col)
                           (: :match :%s)))))))

(assoc vim.o :completeopt "menuone,noselect")

(local next (cmp.mapping (fn [fallback]
                          (if (cmp.visible) (cmp.select_next_item)
                              (snip.expand_or_jumpable) (snip.expand_or_jump)
                              (has-words-before) (cmp.complete)
                              (fallback)))
                        [:i :s]))

(local prev (cmp.mapping (fn [fallback]
                          (if (cmp.visible) (cmp.select_prev_item)
                              (fallback)))
                        [:i :s]))

(cmp.setup {:sources [{:name :vim_lsp}
                      {:name :buffer}
                      {:name :path}]
            :mapping {:<C-u> (cmp.mapping (cmp.mapping.scroll_docs -4) [:i :c])
                      :<C-d> (cmp.mapping (cmp.mapping.scroll_docs 4) [:i :c])
                      :<C-Space> (cmp.mapping (cmp.mapping.complete) [:i :c])
                      :<C-c> (cmp.mapping {:i (cmp.mapping.abort)
                                           :c (cmp.mapping.close)})
                      :<CR> (cmp.mapping.confirm {:select true
                                                  :behavior cmp.ConfirmBehavior.Replace})
                      :<C-k> prev
                      :<C-j> next
                      :<Tab> next
                      :<S-Tab> prev}
            :sorting {:priority_weight 2
                      :comparators [cmp.config.compare.order
                                    cmp.config.recently_used
                                    cmp.config.locality
                                    cmp.config.scopes]}})

(cmp.setup.cmdline [:/ :?] {:mapping (cmp.mapping.preset.cmdline)
                            :sources [{:name :buffer}]})

(cmp.setup.cmdline [::] {:mapping (cmp.mapping.preset.cmdline)
                         :sources [{:name :path :priority 1} {:name :cmdline :priority 0} {:name :buffer :priority 99}]})
