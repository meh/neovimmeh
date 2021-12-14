(module config.plugin.blankline
  {autoload {blankline indent_blankline}})

(blankline.setup {:char "│"
                  :use_treesitter true
                  :space_char_blankline " "
                  :show_current_context true
                  :show_current_context_start true})
