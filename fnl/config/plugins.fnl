(local {: assoc : map : update : get : merge} (require :nfnl.core))
(local {: plugin} (require :config.util))
(local pckr (require :pckr))

(fn plugin [name spec]
  (let [module (get spec :mod)]
    (do
      (assoc (merge {1 name} spec)
             :config (if module (fn [] (require (.. :plugin. module))))))))

(fn use [...]
  (let [args [...]]
    (do
      (var i 1)
      (var specs [])
      (while (<= i (length args))
        (let [name (get args i)
              spec (get args (+ 1 i))]
          (if (= (type spec) :table)
              (do
                (table.insert specs (plugin name spec))
                (set i (+ 2 i)))
              (do
                (table.insert specs (plugin name {}))
                (set i (+ 1 i))))))
      (pckr.add specs))))

(use
  :Olical/nfnl {:cond (fn [load] (if (= vim.bo.filetype "fnl") (load)))}

  :nvim-lua/plenary.nvim
  ;:liuchengxu/vim-better-default

  ; Productivity
  :jbyuki/instant.nvim
  :Olical/vim-enmasse

  :gpanders/editorconfig.nvim

  :guns/vim-sexp
  :tpope/vim-sexp-mappings-for-regular-people

  ;:phaazon/hop.nvim {:mod :hop}

  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-nvim-lsp
                                :L3MON4D3/LuaSnip]
                     :mod :cmp}

  :hrsh7th/cmp-buffer
  :hrsh7th/cmp-path
  :hrsh7th/cmp-cmdline
  :L3MON4D3/LuaSnip

  :mason-org/mason.nvim {:requires [:jay-babu/mason-nvim-dap.nvim]
                         :mod :mason}
  :jay-babu/mason-nvim-dap.nvim {:requires [:mfussenegger/nvim-dap]}

  :pmizio/typescript-tools.nvim {:requires [:nvim-lua/plenary.nvim
                                            :neovim/nvim-lspconfig]}

  :neovim/nvim-lspconfig {:requires [:hrsh7th/cmp-nvim-lsp
                                     :ray-x/lsp_signature.nvim
                                     :nvim-lua/lsp_extensions.nvim
                                     :nvimdev/lspsaga.nvim
                                     :stevearc/conform.nvim
                                     :RRethy/vim-illuminate]
                          :mod :lsp}
  :olimorris/codecompanion.nvim {:mod :llm
                                 :requires [:nvim-lua/plenary.nvim
                                            :nvim-treesitter/nvim-treesitter
                                            :banjo/contextfiles.nvim]}
  :nvimdev/lspsaga.nvim {:requires [:nvim-treesitter/nvim-treesitter
                                    :nvim-tree/nvim-web-devicons]}
  :stevearc/conform.nvim {:requires [:neovim/nvim-lspconfig]}

  :universal-ctags/ctags

  ;:OXY2DEV/markview.nvim {:mod :preview}
  ;:nvim-mini/mini.diff {:mod :minidiff}

  :nvim-telescope/telescope.nvim {:mod :telescope}
  :nvim-telescope/telescope-fzf-native.nvim {:requires [:nvim-lua/plenary.nvim]
                                             :run :make}
  :nvim-telescope/telescope-ui-select.nvim {}
  :stevearc/oil.nvim {:mod :oil}
  :kyazdani42/nvim-tree.lua {:mod :tree}

  :lewis6991/gitsigns.nvim {:requires [:nvim-lua/plenary.nvim]
                            :mod :gitsigns}

  :andymass/vim-matchup
  :folke/trouble.nvim
  :chentau/marks.nvim

  :lambdalisue/suda.vim
  :simnalamburt/vim-mundo

  :tpope/vim-eunuch
  :tpope/vim-fugitive
  :tpope/vim-repeat

  :b3nj5m1n/kommentary

  :AckslD/nvim-neoclip.lua {:mod :neoclip}

  :nvim-neotest/nvim-nio
  :mfussenegger/nvim-dap {:requires [:nvim-neotest/nvim-nio
                                     :rcarriga/nvim-dap-ui
                                     :mfussenegger/nvim-dap-python
                                     :theHamsta/nvim-dap-virtual-text]
                          :mod :dap}
  :rcarriga/nvim-dap-ui
  :mfussenegger/nvim-dap-python
  :theHamsta/nvim-dap-virtual-text

  :rmagatti/auto-session {:mod :session}

  :akinsho/toggleterm.nvim {:mod :term}
  :jamessan/vim-gnupg

  ; Visual stuff
  :sindrets/diffview.nvim
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  :Olical/AnsiEsc

  :norcalli/nvim-colorizer.lua
  :lukas-reineke/indent-blankline.nvim {:mod :blankline}
  :rcarriga/nvim-notify {:mod :notify}

  :SmiteshP/nvim-navic {:mod :navic
                        :requires [:neovim/nvim-lspconfig]}

  :nvim-lualine/lualine.nvim {:requires [:rmagatti/auto-session]
                              :mod :lualine}
  :arkav/lualine-lsp-progress)
