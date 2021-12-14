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
  :Olical/conjure {:branch :develop
                   :mod :conjure}
  :Olical/vim-enmasse {}

  :guns/vim-sexp {}
  :tpope/vim-sexp-mappings-for-regular-people {}

  :phaazon/hop.nvim {:mod :hop}
  :kyazdani42/nvim-tree.lua {:mod :tree}
  
  :ms-jpq/coq_nvim {}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :nvim-lua/lsp-status.nvim {}

  :universal-ctags/ctags {}

  :nvim-telescope/telescope.nvim {:mod :telescope}
  :nvim-telescope/telescope-fzf-native.nvim {:requires [:nvim-lua/plenary.nvim]
                                             :run :make}

  ;:saecki/crates.nvim {:requires [:nvim-lua/plenary.nvim]
  ;                     :event ["BufRead Cargo.toml"]
  ;                     :mod :crates}

  :lewis6991/gitsigns.nvim {:requires [:nvim-lua/plenary.nvim]
                            :mod :gitsigns}

  :andymass/vim-matchup {}
  :folke/trouble.nvim {}
  :chentau/marks.nvim {}

  :lambdalisue/suda.vim {}
  :simnalamburt/vim-mundo {}

  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dadbod {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}

  ; Visual stuff
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}
  :Olical/AnsiEsc {}

  :norcalli/nvim-colorizer.lua {}
  :lukas-reineke/indent-blankline.nvim {:mod :blankline}
  :rcarriga/nvim-notify {:mod :notify}

  :nvim-lualine/lualine.nvim {:mod :lualine}

  :kdheepak/tabline.nvim {:required [:nvim-lualine/lualine.nvim]
                          :mod :tabline}
)
