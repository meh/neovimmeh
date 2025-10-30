(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

(use
  :wbthomason/packer.nvim {}
  :nvim-lua/plenary.nvim {}
  ;:liuchengxu/vim-better-default {}

  ; Fennel
  :Olical/aniseed {:branch :develop}
  :Olical/nvim-local-fennel {}

  ; Productivity
  :jbyuki/instant.nvim {}
  ;:Olical/conjure {:branch :develop
  ;                 :mod :conjure}
  :Olical/vim-enmasse {}

  :gpanders/editorconfig.nvim {}

  :guns/vim-sexp {}
  :tpope/vim-sexp-mappings-for-regular-people {}

  ;:phaazon/hop.nvim {:mod :hop}

  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-nvim-lsp
                                :L3MON4D3/LuaSnip]
                     :mod :cmp}

  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-cmdline {}
  :L3MON4D3/LuaSnip {}

  :mason-org/mason.nvim {:mod :mason}
  :jay-babu/mason-nvim-dap.nvim {}

  :pmizio/typescript-tools.nvim {:requires [:nvim-lua/plenary.nvim
                                            :neovim/nvim-lspconfig]}

  :neovim/nvim-lspconfig {:requires [:hrsh7th/cmp-nvim-lsp
                                     :ray-x/lsp_signature.nvim
                                     :nvim-lua/lsp_extensions.nvim
                                     :RRethy/vim-illuminate]
                          :mod :lsp}
  :olimorris/codecompanion.nvim {:mod :llm
                                 :requires [:nvim-lua/plenary.nvim
                                            :nvim-treesitter/nvim-treesitter
                                            :ravitemer/mcphub.nvim
                                            :banjo/contextfiles.nvim]}
  :ravitemer/mcphub.nvim {:build "bundled_build.lua"}
  :nvimdev/lspsaga.nvim {:requires [:nvim-treesitter/nvim-treesitter
                                    :nvim-tree/nvim-web-devicons]}
  :stevearc/conform.nvim {:requires [:neovim/nvim-lspconfig]}

  :universal-ctags/ctags {}

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

  :andymass/vim-matchup {}
  :folke/trouble.nvim {}
  :chentau/marks.nvim {}

  :lambdalisue/suda.vim {}
  :simnalamburt/vim-mundo {}

  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}

  :b3nj5m1n/kommentary {}

  :AckslD/nvim-neoclip.lua {:mod :neoclip}

  :nvim-neotest/nvim-nio {}
  :mfussenegger/nvim-dap {:requires [:nvim-neotest/nvim-nio :rcarriga/nvim-dap-ui :mfussenegger/nvim-dap-python]
                          :mod :dap}
  :rcarriga/nvim-dap-ui {}
  :mfussenegger/nvim-dap-python {}
  :theHamsta/nvim-dap-virtual-text {}

  :rmagatti/auto-session {:mod :session}

  :akinsho/toggleterm.nvim {:mod :term}
  :jamessan/vim-gnupg {}

  ; Visual stuff
  :sindrets/diffview.nvim {}
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  :nvim-treesitter/nvim-treesitter-textobjects {:requires [:nvim-treesitter/nvim-treesitter]}
  :nvim-treesitter/playground {}

  :Olical/AnsiEsc {}

  :norcalli/nvim-colorizer.lua {}
  :lukas-reineke/indent-blankline.nvim {:mod :blankline}
  :rcarriga/nvim-notify {:mod :notify}

  :SmiteshP/nvim-navic {:mod :navic
                        :requires [:neovim/nvim-lspconfig]}

  :nvim-lualine/lualine.nvim {:requires [:rmagatti/auto-session]
                              :mod :lualine}
  :arkav/lualine-lsp-progress {})
