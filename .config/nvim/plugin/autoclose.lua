vim.pack.add({ "https://github.com/m4xshen/autoclose.nvim" })

-- Imports
local autoclose = require("autoclose")

-- Configuration
autoclose.setup({
    keys = {
        ["("] = { escape = false, close = true, pair = "()" },
        ["["] = { escape = false, close = true, pair = "[]" },
        ["{"] = { escape = false, close = true, pair = "{}" },

        [")"] = { escape = false, close = false, pair = "()" },
        ["]"] = { escape = false, close = false, pair = "[]" },
        ["}"] = { escape = false, close = false, pair = "{}" },

        ['"'] = { escape = false, close = true, pair = '""' },
        ["'"] = { escape = false, close = true, pair = "''" },
        ["`"] = { escape = false, close = true, pair = "``" },
    },
    options = {
        disabled_filetypes = { "text" },
        disable_when_touch = false,
        touch_regex = "[%w(%[{]",
        pair_spaces = false,
        auto_indent = true,
        disable_command_mode = false,
    },
})
