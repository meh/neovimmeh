(local telescope (require :telescope))
(local actions (require :telescope.actions))
(local sorters (require :telescope.sorters))
(local themes (require :telescope.themes))
(local previewers (require :telescope.previewers))

(telescope.setup {:defaults {:vimgrep_arguments ["rg"
                                                 "--color=never"
                                                 "--no-heading"
                                                 "--with-filename"
                                                 "--line-number"
                                                 "--column"
                                                 "--smart-case"]
                             :prompt_prefix "-> "
                             :selection_caret "> "
                             :entry_prefix "  "
                             :initial_mode :insert
                             :selection_strategy :reset
                             :sorting_strategy :descending
                             :layout_strategy :horizontal
                             :layout_config {:horizontal {:mirror false}
                                             :vertical {:mirror false}}
                             :extensions {:ui-select [(themes.get_dropdown)]}
                             :file_sorter sorters.get_fuzzy_file
                             :file_ignore_patterns []
                             :generic_sorter sorters.get_generic_fuzzy_sorter
                             :winblend 0
                             :border []
                             :use_less true
                             :set_env {:COLORTERM :truecolor}
                             :file_previewer previewers.vim_buffer_cat.new
                             :grep_previewer previewers.vim_buffer_vimgrep.new
                             :qflist_previewer previewers.vim_buffer_qflist.new
                             :mappings {:i {"<C-s>" actions.move_selection_previous
                                            "<C-t>" actions.move_selection_next
                                            "<Tab>" actions.add_selection
                                            "<Esc>" actions.close}}}})
