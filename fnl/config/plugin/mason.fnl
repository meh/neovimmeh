(module config.plugin.mason
  {autoload {nvim aniseed.nvim
             a aniseed.core
             mason mason
             mason-dap mason-nvim-dap}})

(mason.setup)
(mason-dap.setup {:automatic_setup true
                  :handlers {}
                  :ensure_installed ["debugpy"]})
