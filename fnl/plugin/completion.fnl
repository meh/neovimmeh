(local {: assoc : nil?} (require :nfnl.core))
(local cmp (require :cmp))
(local context (require :cmp.config.context))

(assoc vim.o :completeopt "menuone,noselect")

(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))
        line-content (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1)
        before-cursor (line-content:sub col col)]
    (and (not= col 0)
         (= (before-cursor:match "%s") nil))))

(local next (cmp.mapping (fn [fallback]
                          (if (cmp.visible) (cmp.select_next_item)
                              (has-words-before) (cmp.complete)
                              (fallback)))
                        [:i :s]))

(local prev (cmp.mapping (fn [fallback]
                          (if (cmp.visible) (cmp.select_prev_item)
                              (fallback)))
                        [:i :s]))

(fn enabled []
  (not (context.in_treesitter_capture :comment)))

(cmp.setup {:sources [{:name :nvim_lsp :priority 8}
                      {:name :buffer :priority 7}
                      {:name :fuzzy_path :priority 4}]
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
                                    cmp.config.scopes]}
	    :enabled enabled})

(cmp.setup.cmdline [:/ :?] {:mapping (cmp.mapping.preset.cmdline)
                            :sources [{:name :buffer}]})

(cmp.setup.cmdline [::] {:mapping (cmp.mapping.preset.cmdline)
                         :sources [{:name :path :priority 1} {:name :cmdline :priority 0} {:name :buffer :priority 99}]})
