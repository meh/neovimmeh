(module config.plugin.markview
  {autoload {nvim aniseed.nvim
             a aniseed.core
             mkv markview}})

(mkv.setup {:preview {:filetypes [:markdown :codecompanion]
                      :ignore_buftypes []}})
