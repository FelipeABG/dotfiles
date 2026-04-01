vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

-- Imports
local conform = require("conform")

-- Configuration
conform.setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },

    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        rust = { "rustfmt" },
        css = { "prettier" },
        python = { "ruff" },
        go = { "gofmt" },
    },
})
