(module config.plugin.lsp
  {autoload {nvim aniseed.nvim
             a aniseed.core
             lsp lspconfig
             cmp cmp_nvim_lsp
             signature lsp_signature
             hilight illuminate}})

(defn attach [?opts]
  (fn [client bufnr]
    (do
      (when client.server_capabilities.document_highlight
        (nvim.command "
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END"))

      (signature.on_attach {:bind true
                            :hint_enable false
                            :handler_opts {:border :none}}
                           bufnr)
      (hilight.on_attach client)

    ; make omnifunc go via LSP’s completion directly
    (nvim.buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifunc")

    ; keybindings
    (nvim.buf_set_keymap bufnr :n :K "<cmd>lua vim.lsp.buf.hover()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>clr "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>ca "<cmd>Telescope lsp_code_actions previewer=false<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cd "<cmd>lua vim.lsp.buf.definition()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cD "<cmd>Telescope lsp_references theme=get_dropdown <cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>ch "<cmd>lua vim.lsp.buf.signature_help()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cn "<cmd>lua vim.diagnostic.goto_next()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cp "<cmd>lua vim.diagnostic.goto_prev()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cr "<cmd>lua vim.lsp.buf.rename()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cs "<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_dropdown <cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>ct "<cmd>lua vim.lsp.buf.type_definition()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cx "<cmd>TroubleToggle<cr>" {})
    (nvim.buf_set_keymap bufnr :x :<leader>ca "<cmd>Telescope lsp_range_code_actions theme=get_dropdown<cr>" {})
    (nvim.buf_set_keymap bufnr :i :<C-a> "<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>" {})
    (nvim.buf_set_keymap bufnr :i :<C-h> "<cmd>lua vim.lsp.buf.signature_help()<cr>" {}))))

(def- capabilities (cmp.default_capabilities))

(def- flags {})

(defn setup [[lsp-name ?lsp-settings] settings ?on-attach]
  ((. (. lsp lsp-name) :setup) {:flags flags
                                :capabilities capabilities
                                :on_attach (or ?on-attach (attach))
                                :settings {(or ?lsp-settings lsp-name) settings}}))

(vim.diagnostic.config {:underline false
                        :signs {:text {vim.diagnostic.severity.ERROR :x
                                       vim.diagnostic.severity.WARN :!
                                       vim.diagnostic.severity.INFO :i
                                       vim.diagnostic.severity.HINT :?}}})

(nvim.command "autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})")
(nvim.command "autocmd BufWritePre * lua vim.lsp.buf.format()")

(setup [:svelte] {:format {:enable true}})
(setup [:tailwindcss] {})
(setup [:denols] {})
(setup [:texlab] {})
(setup [:kotlin_language_server] {})
(setup [:gopls] {})
(setup [:clojure_lsp] {})
(setup [:pyright] {})
(setup [:gleam] {})
(setup [:rust_analyzer] {:rust-analyzer
       {:assist {:importGroup true
                 :importMergeBehavior :preserve
                 :importPrefix :by_crate}
        :callInfo {:full true}
        :cargo {:allFeatures true
                :autoreload true
                :loadOutDirsFromCheck true}
        :checkOnSave {:enable true
                      :allFeatures true
                      :extraArgs ["--target-dir" "/home/meh/.cache/nvim/rust"]}
        :completion {:addCallArgumentSnippets true
                     :addCallParenthesis true
                     :postfix {:enable true}
                     :autoimport {:enable true}}
        :diagnostics {:enable true
                      :enableExperimental true
                      :disabled [:unresolved-proc-macro]}
        :hoverActions {:enable true
                       :debug true
                       :gotoTypeDef true
                       :implementations true
                       :run true
                       :linksInHover true}
        :lens {:enable true
               :debug true
               :implementations true
               :run true
               :methodReferences true
               :references true}
        :notifications {:cargoTomlNotFound true}
        :procMacro {:enable true}}})
