(module config.init
  {autoload {nvim aniseed.nvim}})

(require :config.core)
(require :config.keys)
(require :config.plugin)

(nvim.command "colorscheme darkblood")
