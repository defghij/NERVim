-- Vanilla nvim mappings.. mapping specific to plugins
-- found in setup folders for each respective plugin.

local mode = require("consts").modes

vim.g.mapleader = "\\"

-- Pane navigation
vim.keymap.set(mode.normal, "<C-j>", "<C-w><C-j>", { noremap = true })
vim.keymap.set(mode.normal, "<C-k>", "<C-w><C-k>", { noremap = true })
vim.keymap.set(mode.normal, "<C-l>", "<C-w><C-l>", { noremap = true })
vim.keymap.set(mode.normal, "<C-h>", "<C-w><C-h>", { noremap = true })

-- Equalize pane widths
vim.keymap.set(mode.normal, "<leader>=", "<C-W><C-=>", { noremap = true })

-- copy/paste
vim.keymap.set(mode.visual_select, '<leader>c', '"*yy<CR>', { noremap = true })
vim.keymap.set(mode.visual_select, '<leader>v', '"+p<CR>',  { noremap = true })
vim.keymap.set(mode.normal,        '<leader>v', '"+p<CR>',  { noremap = true })

-- Misc
vim.keymap.set(mode.normal, "=", ":lua update_buf_width(2)<CR>",   { noremap = true })
vim.keymap.set(mode.normal, "-", ":lua update_buf_width(-2)<CR>",  { noremap = true })
vim.keymap.set(mode.normal, "+", ":lua update_buf_height(2)<CR>",  { noremap = true })
vim.keymap.set(mode.normal, "_", ":lua update_buf_height(-2)<CR>", { noremap = true })


-- Kana (ひらがな & かたかな) Key Map for Input Mode 
function ToggleKanaKeymap()
    local iminsert = vim.opt.iminsert:get()
    if iminsert == 0 then
        vim.opt.iminsert = 1  -- Enable Kana input
        vim.opt.keymap = "kana"
        --print("Kana input enabled")
    else
        vim.opt.iminsert = 0  -- Switch to English
        vim.opt.keymap = ""
        --print("English input enabled")
    end
end

-- Map Ctrl+J to toggle between English and Romaji input
vim.api.nvim_set_keymap("n", "<C-j>", ":lua ToggleKanaKeymap()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>:lua ToggleKanaKeymap()<CR>", { noremap = true, silent = true })



-- Terminal buffer-scoped maps
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<esc>", [[<C-\><C-n>]],       opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-j>", [[<C-\><C-n><C-w>j]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-k>", [[<C-\><C-n><C-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-h>", [[<C-\><C-n><C-w>h]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.normal,   "<C-c>", [[i]],                opts)
  vim.api.nvim_buf_set_keymap(0, mode.normal,   "q",     [[i]],                opts)
  vim.api.nvim_buf_set_keymap(0, mode.normal,   "p",     [[pi]],               opts)
end

vim.cmd [[ autocmd TermOpen term://* lua set_terminal_keymaps() ]]
