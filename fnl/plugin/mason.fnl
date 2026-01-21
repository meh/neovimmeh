(local mason (require :mason))
(local mason-dap (require :mason-nvim-dap))

(mason.setup)
(mason-dap.setup {:automatic_setup true
                  :handlers {}
                  :ensure_installed ["debugpy"]})
