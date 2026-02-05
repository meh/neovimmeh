(local {: merge} (require :nfnl.core))
(local {: remap} (require :config.util))
(local saga (require :lspsaga))
(local blink (require :blink.cmp))
(local conform (require :conform))
(local hilight (require :illuminate))

(fn on-attach [args]
  (let [client (vim.lsp.get_client_by_id args.data.client_id)
	bufnr args.buf]
    (do
      (when client.server_capabilities.document_highlight
        (nvim.command "
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END"))
      (hilight.on_attach client)

    ; make omnifunc go via LSP’s completion directly
    (vim.api.nvim_buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifunc"))))

(local capabilities (blink.get_lsp_capabilities {}))
(local flags {})

(vim.api.nvim_create_autocmd :LspAttach {:callback on-attach})

(fn setup [[lsp-name ?lsp-settings] settings ?raw ?on-attach]
  (do
    (vim.lsp.config lsp-name (merge ?raw
                                      {:flags flags
                                       :capabilities capabilities
                                       :settings {(or ?lsp-settings lsp-name) settings}}))
    (vim.lsp.enable lsp-name)))

(vim.diagnostic.config {:underline false
                        :signs {:text {vim.diagnostic.severity.ERROR :x
                                       vim.diagnostic.severity.WARN :!
                                       vim.diagnostic.severity.INFO :i
                                       vim.diagnostic.severity.HINT :?}}})

(conform.setup {:formatters_by_ft {:lua {1 "stylua"}
                                   :python {1 "black"}
                                   :rust {1 "rustfmt"
                                          :lsp_format :fallback}
                                   :nix ["nixfmt"]
                                   :javascript {1 "prettierd"
                                                2 "prettier"
                                                :lsp_format :fallback
                                                :stop_at_first true}}
               :display {:chat {:window {:width 0.2}}}
               :log_level vim.log.levels.DEBUG
               :format_on_save {:timeout_ms 2000
                                :lsp_format "fallback"}})

(saga.setup {:symbol_in_winbar {:enable false}
             :lightbulb {:enable false}})

(setup [:svelte] {:format {:enable true}})
(setup [:ts_ls :typescript] {:tsserver {:useSyntaxServer false}
                              :inlayHints {:includeInlayParameterNameHints "all"
                                           :includeInlayParameterNameHintsWhenArgumentMatchesName true
                                           :includeInlayFunctionParameterTypeHints true
                                           :includeInlayVariableTypeHints true
                                           :includeInlayVariableTypeHintsWhenTypeMatchesName  true
                                           :includeInlayPropertyDeclarationTypeHints true
                                           :includeInlayFunctionLikeReturnTypeHints true
                                           :includeInlayEnumMemberValueHints true}}
                {:init_options {:plugins [{:name "@vue/typescript-plugin"
                                           :location (.. (vim.fn.stdpath "data") "/mason/packages/vue-language-server/node_modules/@vue/language-server")
                                           :languages ["javascript" "typescript" "vue"]}]}
                 :filetypes ["typescript" "javascript" "javascriptreact" "typescriptreact" "vue"]
                 :inlay_hints {:enabled true}})
(setup [:tailwindcss] {})
(setup [:denols] {})
(setup [:texlab] {})
(setup [:kotlin_language_server] {})
(setup [:gopls] {})
(setup [:clojure_lsp] {})
(setup [:basedpyright] {:analysis {:reportMissingTypeStubs false}})
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
