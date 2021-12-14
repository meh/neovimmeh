(module config.plugin.tree
  {autoload {nvim aniseed.nvim
             a aniseed.core
             tree nvim-tree
             config nvim-tree.config}})

(defn keymap [...]
  {})
;  (let [keys [...]]
;    (a.map (fn [k cb]
;             {:key k :cb (config.nvim_tree_callback cb)})
;           (a.kv-pairs keys))))

(tree.setup {:update_to_buf_dir {:auto_open false :auto_close true}
             :tab_open false
             :update_focused_file {:enable true}
             :view {:mappings {:custom_only true
                               :list (keymap ["<CR>" "<TAB>"] :edit
                                             ["o"] :cd
                                             ["<C-v>"] :vsplit
                                             ["<C-o>"] :split
                                             ["<C-t>"] :tabnew
                                             ["<BS>"] :close_node
                                             ["<S-CR>"] :close_node
                                             ["<Tab>"] :preview
                                             ["I"] :toggle_ignore
                                             ["."] :toggle_dotfiles
                                             ["R"] :refresh
                                             ["a"] :create
                                             ["d"] :remove
                                             ["r"] :rename
                                             ["<C-r>"] :full_rename
                                             ["x"] :cut
                                             ["y"] :copy
                                             ["p"] :paste
                                             ["c"] :dir_up
                                             ["q"] :close)}}})
