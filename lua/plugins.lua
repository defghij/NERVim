--------------------
-- Bootstrap lazy --
--------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

--------------------
----- Plugins ------
--------------------
local function get_setup(conf_name)
  return function(_plugin, _opts)
    local mod = string.format("configs.%s", conf_name)
    require(mod)
  end
end

local plugins = {
  -- Helper For KeyMaps
  {
    "folke/which-key.nvim",
    lazy = false,
    config = get_setup("which-key"),
  },

  
  -- Extensive collection of Quality of Life features
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = get_setup("snacks"),
  },

  -- Language server installations and LSP client configs and relevant keymaps
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },
      { "ray-x/lsp_signature.nvim" },
    },
    config = get_setup("lsp"),
  },

  -- Autocomplete and snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },
      },
    },
    config = get_setup("cmp"),
  },


  -- File/fuzzy finder and diagnostics
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make'
      }
    },
    config = get_setup("telescope"),
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = get_setup("treesitter"),
  },

  -- Treesitter playground
  {
    "nvim-treesitter/playground",
    build = ":TSInstall query",
  },

  -- GitSigns
  {
    "lewis6991/gitsigns.nvim",
    config = get_setup("gitsigns")
  },

  -- Extended glyphs
  { "kyazdani42/nvim-web-devicons" },

  -- Buffer tabs
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = get_setup("barbar"),
  },

  -- Commenting utility
  { "preservim/nerdcommenter" },

  -- Vim terminal friendly interface
  {
    "akinsho/toggleterm.nvim",
    config = get_setup("toggleterm"),
  },

  -- Colorscheme and Lualine
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "nvim-lualine/lualine.nvim",
    },
    config = get_setup("colorscheme"),
  },

  -- Auto-highlight other instances of work under the cursor
  {
    "RRethy/vim-illuminate",
    config = get_setup("vim_illuminate")
  },

  -- Better marks experience
  {
    "chentoast/marks.nvim",
    config = get_setup("marks"),
  },

  -- Folding Support
  {
    'kevinhwang91/promise-async'
  },

  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = get_setup("nvim_ufo"),
  },

  -- Knowledge Management 
  {
    "vimwiki/vimwiki", 
    init = function()
      require("configs.vimwiki").init()
    end,
  },

  -- Linguistic (Dictionary, Thesaurus, etc) Support
  {
    "Praczet/words-the-def.nvim",
    -- depends on `dict`
    config = function()
      require("words-the-def").setup({})
    end,
  },

  -- Prioritized To-Do lists
  {
    "atiladefreitas/dooing",
    config = get_setup("dooing"),
  },

  ---- Splash Page for Startup
  --{
    --'nvimdev/dashboard-nvim',
    --event = 'VimEnter',
    --dependencies = { {'nvim-tree/nvim-web-devicons'}}
  --}
}

local opts = {}

require("lazy").setup(plugins, opts)
