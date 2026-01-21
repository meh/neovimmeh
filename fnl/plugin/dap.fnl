(local dap (require :dap))
(local ui (require :dapui))
(local python (require :dap-python))
(local virtual-text (require :nvim-dap-virtual-text))

(ui.setup {})
(python.setup (.. (vim.fn.stdpath "data") "/mason/packages/debugpy/venv/bin/python"))
(virtual-text.setup {})

(vim.keymap.set :n "<F5>" dap.continue)
(vim.keymap.set :n "<F1>" dap.step_into)
(vim.keymap.set :n "<F2>" dap.step_over)
(vim.keymap.set :n "<F3>" dap.step_out)

(vim.keymap.set :n "<F7>" ui.toggle)

(tset dap.listeners.after.event_initialized :dapui_config ui.open)
(tset dap.listeners.before.event_terminated :dapui_config ui.close)
(tset dap.listeners.before.event_exited :dapui_config ui.close)

(table.insert
  dap.configurations.python
  {:type "python"
   :request "attach"
   :connect {:port 5678 :host "0.0.0.0"}
   :mode :remote
   :name "Container Attach (with choose remote dir)"
   :cwd (vim.fn.getcwd)
   :pathMappings [{:localRoot (vim.fn.getcwd)
                   :remoteRoot (fn [] (vim.fn.input "Container code folder >" "." "file"))}]})
