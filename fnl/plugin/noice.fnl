(local {: merge!} (require :nfnl.core))
(local {: on-filetype} (require :config.util))
(local noice (require :noice))
(local notify (require :notify))
(local telescope (require :telescope))

(set vim.notify notify)
(fn setup-noice []
  (noice.setup {
    :lsp
    {:override
      {"vim.lsp.util.convert_input_to_markdown_lines" true
       "vim.lsp.util.stylize_markdown" true
       "cmp.entry.get_documentation" true}}

    :cmdline
    {:format
     {:cmdline {:icon ">"}
      :search_down {:icon "v"}
      :search_up {:icon "^"}
      :filter {:icon "$"}
      :lua {:icon "L"}
      :help {:icon "?"}}}

    :format
    {:level
     {:icons
      {:error "x"
       :warn "!"
       :info "?"}}}

    :popupmenu
    {:kind_icons true}

    :inc_rename
    {:cmdline
     {:format
      {:IncRename {:icon "#"}}}}

     :presets
     {:bottom_search false
      :command_palette true
      :long_message_to_split true
      :inc_rename false
      :lsp_doc_border false}

     :views {
       :cmdline_popup {
         :relative :editor
         :position {
           :row "50%"}
         :size {
           :min_width (math.min 60 (- vim.o.columns 12))
           :max_width (math.floor (* 0.9 vim.o.columns))}}}}))

(setup-noice)

(vim.api.nvim_create_autocmd :VimResized
  {:callback setup-noice})


(notify.setup {
  :background_colour :NotifyBackground
  :fps 30
  :icons
  {:DEBUG ""
   :ERROR ""
   :INFO ""
   :TRACE "✎"
   :WARN ""}
  :level 2
  :minimum_width 50
  :render :wrapped-compact
  :stages :static
  :time_formats
  {:notification "%T"
   :notification_history "%FT%T"}
  :timeout 5000
 :top_down true})

(telescope.load_extension :noice)
(telescope.load_extension :notify)

(on-filetype :noice (fn [] (merge! vim.o {:number false :relativenumber false})))
