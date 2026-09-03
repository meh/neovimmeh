(local {: remap : on-monitor?} (require :config.util))
(local pi (require :pi))

(pi.setup {
 :spinner "classic"
 :expand_startup_details false

 :panels {:history {:title "π"}
         :prompt {:title "prompt"}
         :attachments {:title "files"}}

 :labels {:user_message ">"
          :agent_response "<"
          :system_error "󱚟"
          :tool "●"
          :tool_success "✔"
          :tool_failure "✖"
          :steer_message ">"
          :follow_up_message ">"
          :thinking "<"
          :attachment ">"
          :attachments ">"
          :error "!"}})
