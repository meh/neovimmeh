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
  :liuchengxu/vim-better-default {}

  ; Fennel
  :Olical/aniseed {:branch :develop}
  :Olical/nvim-local-fennel {}

  ; Productivity
  :jbyuki/instant.nvim {}
  :Olical/conjure {:branch :develop
                   :mod :conjure}
  :Olical/vim-enmasse {}

  :gpanders/editorconfig.nvim {}

  :guns/vim-sexp {}
  :tpope/vim-sexp-mappings-for-regular-people {}

  :phaazon/hop.nvim {:mod :hop}
  :kyazdani42/nvim-tree.lua {:mod :tree}

  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-nvim-lsp
                                :L3MON4D3/LuaSnip]
                     :mod :cmp}

  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-cmdline {}
  :L3MON4D3/LuaSnip {}

  :neovim/nvim-lspconfig {:requires [:hrsh7th/cmp-nvim-lsp
                                     :ray-x/lsp_signature.nvim
                                     :RRethy/vim-illuminate]
                          :mod :lsp}
  :simrat39/rust-tools.nvim {}

  :universal-ctags/ctags {}

  :nvim-telescope/telescope.nvim {:mod :telescope}
  :nvim-telescope/telescope-fzf-native.nvim {:requires [:nvim-lua/plenary.nvim]
                                             :run :make}
  :nvim-telescope/telescope-ui-select.nvim {}

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

  :mfussenegger/nvim-dap {:mod :dap}
  :rcarriga/nvim-dap-ui {:requires [:mfussenegger/nvim-dap]
                         :mod :dap-ui}

  :rmagatti/session-lens {:requires [:rmagatti/auto-session :nvim-telescope/telescope.nvim]
                          :mod :session}

  :akinsho/toggleterm.nvim {:mod :term}

  ; Visual stuff
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  :nvim-treesitter/nvim-treesitter-textobjects {}
  :nvim-treesitter/playground {}

  :Olical/AnsiEsc {}

  :norcalli/nvim-colorizer.lua {}
  :lukas-reineke/indent-blankline.nvim {:mod :blankline}
  :rcarriga/nvim-notify {:mod :notify}

  :nvim-lualine/lualine.nvim {:requires [:rmagatti/auto-session]
                              :mod :lualine}
  :arkav/lualine-lsp-progress {})
