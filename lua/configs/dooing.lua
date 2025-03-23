local wk = require("which-key")

require("dooing").setup({
    -- Core settings
    save_path = vim.fn.stdpath('data') .. '/dooing_todos.json',
    
    -- Window appearance
    window = {
        width = 123,         -- Width of the floating window
        height = 20,        -- Height of the floating window
        border = 'rounded', -- Border style
    },
    
    -- Icons
    icons = {
        pending = '○',      -- Pending todo icon
        done = '✓',        -- Completed todo icon
    },
    
    -- Make use of the Eisenhower Matrix for Task Prioritization
    -- +--------------+-----------------|--------------------------+
    -- |              |   Urgent        |    Not-Urgent            | 
    -- +--------------+-----------------+--------------------------+
    -- |Important     |Do: Tasks with   | Schedule: Tasks with     |
    -- |              |deadlines or     | unclear deadlines that   | 
    -- |              |consequences     | contribute to long       | 
    -- |              |                 | term success             |  
    -- +--------------+-----------------|--------------------------+
    -- |Not-Important | Delegate: Tasks | Delete: Distractions     |
    -- |              | that must get   | and unnecessary tasks    | 
    -- |              | done but dont   |                          |    
    -- |              | match my skill  |                          | 
    -- |              | set             |                          | 
    -- +--------------+-----------------|--------------------------+
    --
    -- Not-Important Tasks will likely either be removed or spawn follow-on
    -- tasks.
    prioritization = true,
    priorities = {
      {
        name = "Urgent",
        weight = 5,
      },
      {
        name = "Not-Urgent",
        weight = 1,
      },
      {              
        name = "Important",
        weight = 3,
      },
      {
        name = "Not-Important",
        weight = 1,
      },
    },
    priority_thresholds = {
      {
        min = 8, -- Corresponds to `Urgent` and `Important` tasks
        max = 999,
        color = nil,
        hl_group = "DiagnosticError",
      },
      {
        min = 6, -- Corresponds to `Not-Urgent` but `Important` tasks
        max = 7,
        color = nil,
        hl_group = "DiagnosticWarn",
      },
      {
        min = 3, -- Corresponds to `Urgent` but `Not-Important` tasks`
        max = 4,
        color = nil,
        hl_group = "DiagnosticInfo",
      },
      {
        min = 0, -- Corresponds to `Not-Urgent` and `Not-Important` tasks`
        max = 2,
        color = nil,
        hl_group = "DiagnosticHint",
      },
    },

    -- Keymaps
    keymaps = {
        --toggle_window = "<leader>td", -- Toggle the main window
        new_todo = "i",              -- Add a new todo
        toggle_todo = "x",           -- Toggle todo status
        delete_todo = "d",           -- Delete the current todo
        delete_completed = "R",      -- Remove all completed todos
        add_due_date = "D",          -- Add due date to todo
        remove_due_date = "r",       -- Remove due date from todo
        toggle_help = "?",           -- Toggle help window
        toggle_tags = "t",           -- Toggle tags window
        clear_filter = "c",          -- Clear active tag filter
        edit_todo = "e",             -- Edit todo item
        edit_tag = "e",              -- Edit tag [on tag window]
        delete_tag = "d",            -- Delete tag [on tag window]
        search_todo = "/",           -- Toggle todo searching
        close_window = "q",          -- Close the window
        toggle_priority = "t"  -- Toggle todo priority on creation
    },

    -- Calendar settings
    calendar = {
        language = "en",             -- Calendar language ("en" or "pt")
        keymaps = {
            previous_day = "h",      -- Move to previous day
            next_day = "l",          -- Move to next day
            previous_week = "k",     -- Move to previous week
            next_week = "j",         -- Move to next week
            previous_month = "H",    -- Move to previous month
            next_month = "L",        -- Move to next month
            select_day = "<CR>",     -- Select the current day
            close_calendar = "q",    -- Close the calendar
        },
    },

})

wk.add({
  { "<leader>td", ":Dooing<CR>", mode="n", desc = "Open to-do list (dooing)" },
})
