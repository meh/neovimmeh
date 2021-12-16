(module config.plugin.session
  {autoload {nvim aniseed.nvim
             auto auto-session
             lens session-lens}})

(tset nvim.o :sessionoptions "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal")

(auto.setup {:auto_session_enable_last_session true})
(lens.setup {:path_display [:shorten]
             :theme_conf {:border false}
             :previewer true})
