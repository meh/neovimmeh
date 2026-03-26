(local snacks (require :snacks))

(snacks.setup {
  :bigfile {:enabled true}
  :input {}
  :picker {:enabled true
           :actions {:opencode_send (fn [...] ((. (require :opencode) :snacks_picker_send) ...))}
           :win {:input {:keys {:<a-a> [:opencode_send {:mode [:n :i]}]}}}}
  :quickfile {:enabled true}})
