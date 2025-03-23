require("which-key").setup({
    
    preset = "modern",
    notify = true,    -- show a warning when issues were detected with your mappings
    expand = 0,       -- expand groups when <= n mappings
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line


    delay = function(ctx) -- Wait 1 second before displaying pop-up
      return ctx.plugin and 0 or 1000
    end,
    filter = function(mapping) -- Filter items without a description
      return true
    end,


    plugins = {
      marks = true,     -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode

      spelling = {
        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },

      presets = {
        operators = true,    -- adds help for operators like d, y, ...
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },

    disable = { -- disable WhichKey for certain buf types and file types.
      ft = {},
      bt = {},
    },

    icons = {
      mappings = false
    },

    keys = {
      scroll_down = "<c-j>", -- binding to scroll down inside the popup
      scroll_up = "<c-k>", -- binding to scroll up inside the popup
    },
})

--    keys = {
--      {
--        "<leader>?",
--        function()
--          require("which-key").show({ global = false })
--        end,
--        desc = "Buffer Local Keymaps (which-key)",
--      },
--    },

