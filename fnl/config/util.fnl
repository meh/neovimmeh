(local {: map : merge} (require :nfnl.core))

(fn using-monitor? []
  (let [xrandr (vim.fn.system ["xrandr"])]
    (string.match xrandr "DP-1 connected")))

{: using-monitor?}
