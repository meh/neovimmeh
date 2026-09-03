(local bionic (require :bionic-reading))

(bionic.setup {
  :file_types {
    :text :any
    :lua [:comment]
    :markdown :any}})

