require("tokyonight").setup {
  style = "night",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments  = { italic = true },
    keywords  = { italic = false },
    functions = { italic = false },
    variabes  = { italic = false },
    sidebars  = "transparent",
    floats    = "transparent",
  },
  dim_inactive = true,
  lualine_bold = false,

  on_colors = function(colors) end,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
}

require('lualine').setup {
  options = {
    theme = 'nightfly'
  }
}

vim.cmd("colorscheme tokyonight")
