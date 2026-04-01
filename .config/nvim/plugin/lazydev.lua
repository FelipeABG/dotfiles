vim.pack.add({ "https://github.com/folke/lazydev.nvim" })

local lazydev = require("lazydev")

lazydev.setup({
    library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
})
