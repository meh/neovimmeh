(local {: map : merge} (require :nfnl.core))

(fn on-monitor? []
	(> vim.o.columns 400))

(fn remap [mode lhs rhs flags?]
  (vim.keymap.set mode lhs rhs (merge {:silent true :remap false} flags)))

(fn on-filetype [filetype callback]
  (vim.api.nvim_create_autocmd
    :FileType
    {:pattern filetype
     :callback callback}))

{: on-monitor?
 : remap
 : on-filetype}
