local mode = require("consts").modes

local Direction = {
  horizontal = "horizontal",
  vertical   = "vertical",
  tab        = "tab",
  float      = "float"
}

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = Direction.float,
  size = function(term)
    return math.floor(vim.api.nvim_win_get_height(0) * 0.5)
  end,
  hide_numbers      = true,
  shade_terminals   = false,
  shading_factor    = 3,
  start_in_insert   = true,
  insert_mappings   = true,
  terminal_mappings = true,
  persist_size      = true,
  persist_mode      = true,
  close_on_exit     = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = function()
      math.floor(vim.api.nvim_win_get_width(0) * 0.8)
    end,
    height = function()
      math.floor(vim.api.nvim_win_get_height(0) * 0.8)
    end,
    winblend = 0,
  }
}

--vim.keymap.set(mode.visual_select, "<leader>T", ":ToggleTermSendVisualSelection<CR>", { noremap = true })
vim.keymap.set(mode.normal,        "<leader>t", ":ToggleTerm<CR>", { noremap = true })
vim.keymap.set(mode.normal,        "<leader>tF", ":ToggleTerm direction=float<CR>", { noremap = true })
vim.keymap.set(mode.normal,        "<leader>tV", ":ToggleTerm> direction=vertical<CR>", { noremap = true })
vim.keymap.set(mode.normal,        "<leader>tH", ":ToggleTerm> direction=horizontal<CR>", { noremap = true })
