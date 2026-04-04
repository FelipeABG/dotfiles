vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-- Imports
local gitsigns = require("gitsigns")

-- Configuration
gitsigns.setup({
    on_attach = function(bufnr)
        vim.keymap.set("n", "gshi", function()
            gitsigns.preview_hunk_inline()
        end, { buf = bufnr })

        vim.keymap.set("n", "]c", function()
            gitsigns.nav_hunk("next")
        end, { buf = bufnr })

        vim.keymap.set("n", "[c", function()
            gitsigns.nav_hunk("prev")
        end, { buf = bufnr })

        vim.keymap.set("n", "gsd", function()
            gitsigns.diffthis(nil, {})
            -- Move cursor to left window
            vim.cmd('wincmd w')
        end, { buf = bufnr })

        vim.keymap.set("n", "gshr", function()
            gitsigns.reset_hunk()
        end, { buf = bufnr })

        vim.keymap.set("n", "gshq", function()
            gitsigns.setqflist(bufnr)
        end, { buf = bufnr })
    end
})
