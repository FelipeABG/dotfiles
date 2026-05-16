vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
})

vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    root_markers = { "tsconfig.json", "package.json", ".git" },
})

vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                features = "all"
            }
        }
    }
})

vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { ".git", "pyproject.toml" },
})

vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { ".git", "pyproject.toml" },
})

vim.lsp.enable({ "lua_ls", "ts_ls", "rust_analyzer", "ty", "ruff" })

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }

        vim.keymap.set("n", "grh", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, opts)

        vim.keymap.set("n", "grd", function()
            vim.diagnostic.open_float({ border = "rounded" })
        end, opts)

        vim.keymap.set("n", "<leader>lsp", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
            if vim.diagnostic.is_enabled() then
                print("LSP: On")
            else
                print("LSP: Off")
            end
        end, { silent = true, noremap = true })
    end,
})
