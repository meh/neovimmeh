(module config.plugin.blankline
  {autoload {blankline indent_blankline}})

(blankline.setup {:char_list [:│ :¦ :┆ :┊]
                  :use_treesitter true
                  :strict_tabs true
                  :space_char_blankline " "
                  :show_current_context true
                  :show_current_context_start true
                  :show_current_context_start_on_current_line true})
