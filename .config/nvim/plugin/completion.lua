vim.pack.add({ "https://github.com/saghen/blink.cmp" })

-- Dependencies
vim.pack.add({
    "https://github.com/saghen/blink.cmp",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets"
})

-- Imports
local blink = require("blink.cmp")

-- Configuration
vim.cmd("highlight Pmenu guibg=none")
vim.cmd("highlight PmenuExtra guibg=none")
vim.cmd("highlight FloatBorder guibg=none")
vim.cmd("highlight NormalFloat guibg=none")

blink.setup({
    snippets = { preset = "luasnip" },
    signature = { enabled = true },
    sources = {
        default = { "lsp", "path", "snippets", "lazydev", "buffer" },
        providers = {
            lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
            cmdline = { min_keyword_length = 2 },
        },
    },
    keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },
    cmdline = {
        enabled = true,
        completion = {
            menu = { auto_show = true },
            list = { selection = { preselect = false, auto_insert = false } }
        },
        keymap = {
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
        },
    },
    completion = {
        list = {
            selection = { preselect = false, auto_insert = false }
        },
        documentation = {
            auto_show = true,
            window = {
                border = "rounded",
                scrollbar = false,
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
            },
        },
        menu = {
            winhighlight =
            "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
            border = "rounded",
            scrolloff = 1,
            scrollbar = false,
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label" },
                    { "kind" },
                },
            },
        },
    },
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
        kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰆧",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
        },
    },
})
