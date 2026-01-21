-- [nfnl] fnl/config/plugins.fnl
local _local_1_ = require("nfnl.core")
local assoc = _local_1_.assoc
local map = _local_1_.map
local update = _local_1_.update
local get = _local_1_.get
local merge = _local_1_.merge
local _local_2_ = require("config.util")
local plugin = _local_2_.plugin
local pckr = require("pckr")
local function plugin0(name, spec)
  local module = get(spec, "mod")
  local function _4_()
    if module then
      local function _3_()
        return require(("plugin." .. module))
      end
      return _3_
    else
      return nil
    end
  end
  return assoc(merge({name}, spec), "config", _4_())
end
local function use(...)
  local args = {...}
  local i = 1
  local specs = {}
  while (i <= #args) do
    local name = get(args, i)
    local spec = get(args, (1 + i))
    if (type(spec) == "table") then
      table.insert(specs, plugin0(name, spec))
      i = (2 + i)
    else
      table.insert(specs, plugin0(name, {}))
      i = (1 + i)
    end
  end
  return pckr.add(specs)
end
local function _6_(load)
  if (vim.bo.filetype == "fnl") then
    return load()
  else
    return nil
  end
end
return use("Olical/nfnl", {cond = _6_}, "nvim-lua/plenary.nvim", "jbyuki/instant.nvim", "Olical/vim-enmasse", "gpanders/editorconfig.nvim", "guns/vim-sexp", "tpope/vim-sexp-mappings-for-regular-people", "hrsh7th/nvim-cmp", {requires = {"hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip"}, mod = "cmp"}, "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "mason-org/mason.nvim", {requires = {"jay-babu/mason-nvim-dap.nvim"}, mod = "mason"}, "jay-babu/mason-nvim-dap.nvim", {requires = {"mfussenegger/nvim-dap"}}, "pmizio/typescript-tools.nvim", {requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}}, "neovim/nvim-lspconfig", {requires = {"hrsh7th/cmp-nvim-lsp", "ray-x/lsp_signature.nvim", "nvim-lua/lsp_extensions.nvim", "nvimdev/lspsaga.nvim", "stevearc/conform.nvim", "RRethy/vim-illuminate"}, mod = "lsp"}, "olimorris/codecompanion.nvim", {mod = "llm", requires = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "banjo/contextfiles.nvim"}}, "nvimdev/lspsaga.nvim", {requires = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}}, "stevearc/conform.nvim", {requires = {"neovim/nvim-lspconfig"}}, "universal-ctags/ctags", "nvim-telescope/telescope.nvim", {mod = "telescope"}, "nvim-telescope/telescope-fzf-native.nvim", {requires = {"nvim-lua/plenary.nvim"}, run = "make"}, "nvim-telescope/telescope-ui-select.nvim", {}, "stevearc/oil.nvim", {mod = "oil"}, "kyazdani42/nvim-tree.lua", {mod = "tree"}, "lewis6991/gitsigns.nvim", {requires = {"nvim-lua/plenary.nvim"}, mod = "gitsigns"}, "andymass/vim-matchup", "folke/trouble.nvim", "chentau/marks.nvim", "lambdalisue/suda.vim", "simnalamburt/vim-mundo", "tpope/vim-eunuch", "tpope/vim-fugitive", "tpope/vim-repeat", "b3nj5m1n/kommentary", "AckslD/nvim-neoclip.lua", {mod = "neoclip"}, "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap", {requires = {"nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap-python", "theHamsta/nvim-dap-virtual-text"}, mod = "dap"}, "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap-python", "theHamsta/nvim-dap-virtual-text", "rmagatti/auto-session", {mod = "session"}, "akinsho/toggleterm.nvim", {mod = "term"}, "jamessan/vim-gnupg", "sindrets/diffview.nvim", "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate", mod = "treesitter"}, "Olical/AnsiEsc", "norcalli/nvim-colorizer.lua", "lukas-reineke/indent-blankline.nvim", {mod = "blankline"}, "rcarriga/nvim-notify", {mod = "notify"}, "SmiteshP/nvim-navic", {mod = "navic", requires = {"neovim/nvim-lspconfig"}}, "nvim-lualine/lualine.nvim", {requires = {"rmagatti/auto-session"}, mod = "lualine"}, "arkav/lualine-lsp-progress")
