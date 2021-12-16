(module config.plugin.lsp
  {autoload {nvim aniseed.nvim
             a aniseed.core
             lsp lspconfig
             rust rust-tools
             cmp cmp_nvim_lsp
             signature lsp_signature
             hilight illuminate}})

(defn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
  (vim.fn.sign_define error {:text :x :texthl error})
  (vim.fn.sign_define warn  {:text :! :texthl warn})
  (vim.fn.sign_define info  {:text :i :texthl info})
  (vim.fn.sign_define hint  {:text :? :texthl hint})))

(define-signs "Diagnostic")

(defn attach [?opts]
  (fn [client bufnr]
    (do
      (when client.resolved_capabilities.document_highlight
        (nvim.exec "
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END"
          false))

      (when (not= (?. ?opts :format) false)
        (nvim.exec "
          augroup lsp_formatting_sync
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END"
          false))

      (signature.on_attach {:bind true
                            :hint_enable false
                            :hi_parameter :Title
                            :handler_opts {:border :shadow}}
                           bufnr)
      (hilight.on_attach client)

    ; make omnifunc go via LSP’s completion directly
    (nvim.buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifunc")

    ; keybindings
    (nvim.buf_set_keymap bufnr :n :S "<cmd>lua vim.lsp.buf.hover()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>clr "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>ca "<cmd>Telescope lsp_code_actions previewer=false<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cd "<cmd>lua vim.lsp.buf.definition()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cD "<cmd>Telescope lsp_references theme=get_dropdown <cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>ch "<cmd>lua vim.lsp.buf.signature_help()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cn "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cp "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cr "<cmd>lua vim.lsp.buf.rename()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cs "<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_dropdown <cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>ct "<cmd>lua vim.lsp.buf.type_definition()<cr>" {})
    (nvim.buf_set_keymap bufnr :n :<leader>cx "<cmd>TroubleToggle<cr>" {})
    (nvim.buf_set_keymap bufnr :x :<leader>ca "<cmd>Telescope lsp_range_code_actions theme=get_dropdown<cr>" {})
    (nvim.buf_set_keymap bufnr :i :<C-a> "<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>" {})
    (nvim.buf_set_keymap bufnr :i :<C-h> "<cmd>lua vim.lsp.buf.signature_help()<cr>" {}))))

(def- capabilities
  (cmp.update_capabilities (vim.lsp.protocol.make_client_capabilities)))

(def- flags {})

(defn setup [[lsp-name lsp-settings] settings ?on-attach]
  ((. (. lsp lsp-name) :setup) {:flags flags
                                :capabilities capabilities
                                :on_attach (or ?on-attach (attach))
                                :settings {lsp-settings settings}}))

(setup [:rust_analyzer :rust-analyzer] {})

(rust.setup {:server
             {:assist {:importGroup true
                 :importMergeBehavior :full
                 :importPrefix :by_crate}
              :callInfo {:full true}
              :cargo {:allFeatures true
                      :autoreload true
                      :loadOutDirsFromCheck true}
              :checkOnSave {:enable true
                            :allFeatures true}
              :completion {:addCallArgumentSnippets true
                           :addCallParenthesis true
                           :postfix {:enable true}
                           :autoimport {:enable true}}
              :diagnostics {:enable true
                            :enableExperimental true}
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
