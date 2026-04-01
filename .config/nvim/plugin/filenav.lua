vim.pack.add({ "https://github.com/wojciech-kulik/filenav.nvim" })

-- Imports
local filenav = require("filenav")

-- Configuration
filenav.setup({
    next_file_key = "<leader>nf",
    prev_file_key = "<leader>pf",
    max_history = 100,
    remove_duplicates = false,
})
