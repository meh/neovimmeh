(local auto (require :auto-session))

(tset vim.o :sessionoptions "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions")

(auto.setup {:suppressed_dirs ["~/"]
             :git_use_branch_name true
             :git_auto_restore_on_branch_change true
             :session_lens {:buftypes_to_ignorre [:terminal]
                            :filetypes_to_ignore [:toggleterm :codecompanion]}})
