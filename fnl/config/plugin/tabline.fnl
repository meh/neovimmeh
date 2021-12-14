(module config.plugin.lualine
  {autoload {nvim aniseed.nvim
             tabline tabline}})

(tabline.setup {})
(nvim.command "set guioptions-=e
               set showtabline=2
               set sessionoptions+=tabpages,globals")
