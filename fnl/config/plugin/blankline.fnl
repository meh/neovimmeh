(module config.plugin.blankline
  {autoload {blankline indent_blankline}})

(blankline.setup {:char "│"
                  :space_char_blankline " "
                  :show_current_context true
                  :show_current_context_start true})
