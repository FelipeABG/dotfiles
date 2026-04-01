vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })

--Imports
local ibl = require("ibl")

-- Configuration
ibl.setup({
    indent = {
        char = "▏", -- thinner line (alternatives: "¦", "┆", "┊")
    },
    scope = {
        enabled = false,
        show_start = false,
        show_end = false,
    },
})
