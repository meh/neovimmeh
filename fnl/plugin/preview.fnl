(local markdown (require :render-markdown))

(markdown.setup {:anti_conceal {:enabled false}
   :file_types [:markdown :opencode_output]})
