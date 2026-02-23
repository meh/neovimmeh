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

  :folke/snacks.nvim {:mod :snacks}
  :nvim-lua/plenary.nvim
  ;:liuchengxu/vim-better-default

  ; Productivity
  :jbyuki/instant.nvim
  :Olical/vim-enmasse
  :gbprod/yanky.nvim {:mod :yank
                      :requires [:kkharji/sqlite.lua]}

  :smoka7/hop.nvim {:mod :hop}

  :saghen/blink.cmp {:mod :completion
                     :run "nix run .#build-plugin"
                     :requires [:xzbdmw/colorful-menu.nvim]}

  :mason-org/mason.nvim {:requires [:jay-babu/mason-nvim-dap.nvim]
                         :mod :mason}
  :jay-babu/mason-nvim-dap.nvim {:requires [:mfussenegger/nvim-dap]}

  ;:mrcjkb/rustaceanvim {:mod :rust}
  :nvim-flutter/flutter-tools.nvim {:mod :flutter}
  :pmizio/typescript-tools.nvim {:requires [:nvim-lua/plenary.nvim
                                            :neovim/nvim-lspconfig]}

  :neovim/nvim-lspconfig {:requires [:saghen/blink.cmp
                                     :nvim-lua/lsp_extensions.nvim
                                     :nvimdev/lspsaga.nvim
                                     :stevearc/conform.nvim
                                     :RRethy/vim-illuminate]
                          :mod :lsp}

  :ravitemer/mcphub.nvim
  :olimorris/codecompanion.nvim {:mod :llm
                                 :requires [:nvim-lua/plenary.nvim
                                            :ravitemer/mcphub.nvim
                                            :ravitemer/codecompanion-history.nvim
                                            :franco-ruggeri/codecompanion-spinner.nvim
                                            :nvim-treesitter/nvim-treesitter
                                            :banjo/contextfiles.nvim]}

  :nvimdev/lspsaga.nvim {:requires [:nvim-treesitter/nvim-treesitter
                                    :nvim-tree/nvim-web-devicons]}
  :stevearc/conform.nvim {:requires [:neovim/nvim-lspconfig]}

  :universal-ctags/ctags

  :OXY2DEV/markview.nvim {:mod :preview}
  :nvim-mini/mini.diff {:mod :minidiff}

  :nvim-telescope/telescope.nvim {:mod :telescope}
  :nvim-telescope/telescope-fzf-native.nvim {:requires [:nvim-lua/plenary.nvim]
                                             :run :make}
  :nvim-telescope/telescope-ui-select.nvim {}
  :stevearc/oil.nvim {:mod :oil}
  :kyazdani42/nvim-tree.lua {:mod :tree}

  :andymass/vim-matchup
  :folke/trouble.nvim
  :chentau/marks.nvim
  :yorickpeterse/nvim-window {:mod :window-picker}

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
  :RaafatTurki/hex.nvim {:mod :hex}
  :sindrets/diffview.nvim
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}


  :hakonharnes/img-clip.nvim
  :Olical/AnsiEsc

  :folke/noice.nvim {:mod :noice
                     :requires [:MunifTanjim/nui.nvim
                                :rcarriga/nvim-notify
                                :nvim-telescope/telescope.nvim]}
  :norcalli/nvim-colorizer.lua
  :lukas-reineke/indent-blankline.nvim {:mod :blankline}

  :SmiteshP/nvim-navic {:mod :navic
                        :requires [:neovim/nvim-lspconfig]}

  :nvim-lualine/lualine.nvim {:requires [:rmagatti/auto-session :folke/noice.nvim]
                              :mod :lualine}
  :arkav/lualine-lsp-progress)
