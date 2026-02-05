(local {: assoc : nil?} (require :nfnl.core))
(local blink (require :blink.cmp))
(local colorful-menu (require :colorful-menu))

(blink.setup {
  :completion {
    :ghost_text {:enabled true
                 :show_with_menu false}
    :menu {
      :auto_show false
      :max_height 30

      :draw {
        :columns [[:kind_icon] {1 :label :gap 1}]
        :components {
          :label {
            :width {:fill true}
            :text colorful-menu.blink_components_text
            :highlight colorful-menu.blink_components_highlight}}}}}
  :keymap {
    :preset :none

    :<Tab> [:show :fallback]
    :<Enter> [:select_and_accept :fallback]
    :<M-j> [:select_next :fallback]
    :<M-k> [:select_prev :fallback]
    :<Esc> [:hide :fallback] }

  :cmdline {
    :keymap {
      :<Esc> [:hide :fallback]}
    :completion { :ghost_text {:enabled true}}}

  :signature {:enabled true}
  :enabled (fn [] true)})
