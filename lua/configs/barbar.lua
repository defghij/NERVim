local Mode = require("consts").modes
local wk   = require("which-key")

vim.g.barbar_auto_setup = false

require("barbar").setup({
  animation = true,
  auto_hide = true,
  closable = true,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  icons = {
    filetype = { enabled = true },
    button = '',
    visible = default,
    alternate = default,
    --current = default,
    diagnostics = {
        enabled = true,
        { enabled = true, icon = ' ' }, -- Error.
        { enabled = true, icon = ' ' }, -- Warning.
        { enabled = false }, -- Info.
        { enabled = false }, -- Hint.
    },
    pinned = {
        button = ''
    },
    separator = {
        left = '▎',
        right = ''
    },
    inactive = {
        separator = {
            left = '▎',
            right = ''
        }
    },
    gitsigns = {
        --enabled = true,
        -- Disabled becasue Tokyonight doesnt support all the hightlight
        -- groups
        enabled = false, 
        added = {enabled = true, icon = '+'},
        changed = {enabled = true, icon = '~'},
        deleted = {enabled = true, icon = '-'},
    },
    modified = { button = '●' },
  },
  insert_at_end = false,
  insert_at_start = false,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  maximum_padding = 1,
  maximum_length = 30,
  no_name_title = nil,
  semantic_letters = true,
})

wk.add({
  {"gt",  ":BufferNext<CR>",         mode="n", desc="Next buffer (barbar)"          },
  {"gT",  ":BufferPrevious<CR>",     mode="n", desc="Previous buffer (barbar)"      },
  {"gq",  ":BufferClose<CR>",        mode="n", desc="Close current buffer (barbar)" },
  {"gmr", ":BufferMoveNext<CR>",     mode="n", desc="Move buffer right (barbar)"    },
  {"gml", ":BufferMovePrevious<CR>", mode="n", desc="Move buffer left (barbar)"     },
})
