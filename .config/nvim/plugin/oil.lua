vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

-- Imports
local oil = require("oil")

-- Configuration
oil.setup({
    float = {
        padding = 2,
        max_width = 80,
        max_height = 20,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
    view_options = {
        show_hidden = true,
    },
})

-- Keybinds
vim.keymap.set("n", "T", ":Oil --float<CR>")
