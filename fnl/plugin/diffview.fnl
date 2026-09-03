(local diffview (require :diffview))

(diffview.setup {
  :enhanced_diff_hl true
  :use_icons true
  :view {
    :default {
      :layout :diff1_inline
    }
  }
	:file_panel {
	  :win_config {
		  :width :auto
		}
	}
})
