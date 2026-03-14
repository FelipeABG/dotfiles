return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local make_entry = require("telescope.make_entry")
            local devicons = require("nvim-web-devicons")
            local entry_display = require("telescope.pickers.entry_display")

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

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "TelescopeResults",
                command = "setlocal nofoldenable",
            })

            vim.keymap.set("n", "S", function()
                builtin.find_files({
                    file_ignore_patterns = file_ignore_patterns,
                })
            end, {})

            vim.keymap.set("n", "L", function()
                builtin.live_grep({
                    file_ignore_patterns = file_ignore_patterns,
                    entry_maker = grep_filename_only_entry_maker({}),
                    additional_args = function()
                        return { "--hidden" }
                    end,
                })
            end, {})

            vim.keymap.set("n", "<leader>cfg", function()
                builtin.find_files({
                    prompt_title = "Dotfiles",
                    cwd = "~/dotfiles",
                    hidden = true,
                    file_ignore_patterns = file_ignore_patterns,
                })
            end, { desc = "Open dotfiles" })

            vim.keymap.set("n", "<leader>gs", function()
                builtin.git_stash({})
            end)
        end,
    },
}
