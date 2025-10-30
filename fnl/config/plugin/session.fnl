(module config.plugin.session
  {autoload {nvim aniseed.nvim
             auto auto-session}})

(tset nvim.o :sessionoptions "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions")

(auto.setup {:suppressed_dirs ["~/"]
             :git_use_branch_name true
             :git_auto_restore_on_branch_change true})
