(local gs (require :gitsigns))

(fn on_attach [bufnr]
  (let [map (fn [mode l r] (vim.keymap.set mode l r { :buffer bufnr }))]
    (do
      (vim.keymap.set :n "]c" (fn []
        (if (vim.wo.diff)
          "]c"
          (do
            (vim.schedule gs.next_hunk)
            "<Ignore>")))
        { :buffer bufnr :expr true })

      (vim.keymap.set :n "[c" (fn []
        (if (vim.wo.diff)
          "[c"
          (do
            (vim.schedule gs.prev_hunk)
            "<Ignore>")))
        { :buffer bufnr :expr true })

      (map :n "<leader>hs" gs.stage_hunk)
      (map :n "<leader>hr" gs.reset_hunk)
      (map :v "<leader>hs" (fn [] (gs.stage_hunk [(vim.fn.line :.) (vim.fn.line :v)])))
      (map :v "<leader>hr" (fn [] (gs.reset_hunk [(vim.fn.line :.) (vim.fn.line :v)])))
      (map :n "<leader>hS" gs.stage_buffer)
      (map :n "<leader>hu" gs.undo_stage_hunk)
      (map :n "<leader>hR" gs.reset_buffer)
      (map :n "<leader>hp" gs.preview_hunk)
      (map :n "<leader>hb" (fn [] (gs.blame_line {:full true})))
      (map :n "<leader>tb" gs.toggle_current_line_blame)
      (map :n "<leader>hd" gs.diffthis)
      (map :n "<leader>hD" (fn [] (gs.diffthis "~")))
      (map :n "<leader>td" gs.toggle_deleted)

      (map [:o :x] :ih ":<C-U>Gitsigns select_hunk<CR>"))))

(gs.setup {:on_attach on_attach})
