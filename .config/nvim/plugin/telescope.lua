vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })

-- Dependencies
vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim"
})

-- Imports
local builtin = require("telescope.builtin")
local telescope = require("telescope")
local entry_display = require("telescope.pickers.entry_display")
local make_entry = require("telescope.make_entry")
local devicons = require("nvim-web-devicons")

-- Global telescope configuration
telescope.setup({
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
        },
    },
    extensions = {
        fzf = {},
        ["ui-select"] = {},
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    command = "setlocal nofoldenable",
})

-- Helpers
local file_ignore_patterns = {
    "yarn%.lock",
    "node_modules/",
    "raycast/",
    "dist/",
    "%.next",
    "%.git/",
    "%.gitlab/",
    "%.venv/",
    "%.ruff_cache/",
    "build/",
    "target/",
    "package%-lock%.json",
    "migrations/",
    ".turbo/",
    "tmux/plugins"
}

local displayer = entry_display.create({
    separator = " ",
    items = {
        { width = 2 },
        { remaining = true },
    },
})

local grep_filename_only_entry_maker = function(opts)
    local original = make_entry.gen_from_vimgrep(opts)

    return function(line)
        local entry = original(line)
        if not entry then
            return nil
        end
        entry.display = function(e)
            local filename = vim.fn.fnamemodify(e.filename, ":t")
            local icon, hl = devicons.get_icon(filename, nil, { default = true })

            return displayer({ { icon, hl }, string.format("%s:%d", e.filename, e.lnum) })
        end
        return entry
    end
end

local references_entry_maker = function(opts)
    local original = make_entry.gen_from_quickfix(opts)

    return function(entry)
        local item = original(entry)
        if not item then
            return nil
        end
        item.display = function(e)
            local filename = vim.fn.fnamemodify(e.filename, ":t")
            local icon, icon_hl = devicons.get_icon(filename, nil, { default = true })
            local path = vim.fn.fnamemodify(e.filename, ":.")


            return displayer({
                { icon,                                icon_hl },
                { string.format("%s:%d", path, e.lnum) },
            })
        end
        return item
    end
end

-- Keybinds
vim.keymap.set("n", "S", function()
    builtin.find_files({
        file_ignore_patterns = file_ignore_patterns,
    })
end)

vim.keymap.set("n", "grr", function()
    builtin.lsp_references({
        entry_maker = references_entry_maker({
            show_line = false,
            trim_text = true
        })
    })
end)

vim.keymap.set("n", "L", function()
    builtin.live_grep({
        file_ignore_patterns = file_ignore_patterns,
        entry_maker = grep_filename_only_entry_maker({}),
        additional_args = function()
            return { "--hidden" }
        end,
    })
end)

vim.keymap.set("n", "<leader>cfg", function()
    builtin.find_files({
        prompt_title = "Dotfiles",
        cwd = "~/dotfiles",
        hidden = true,
        file_ignore_patterns = file_ignore_patterns,
    })
end)

vim.keymap.set("n", "<leader>gs", function()
    builtin.git_stash({})
end)
