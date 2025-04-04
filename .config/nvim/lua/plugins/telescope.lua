return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true, --Set hidden files to show up
						no_ignore = true,
					},
					git_files = {
						hidden = true,
					},
				},
				extensions = {
					fzf = {},
				},
			})

			local file_ignore_patterns = {
				"yarn%.lock",
				"node_modules/",
				"raycast/",
				"dist/",
				"%.next",
				"%.git/",
				"%.gitlab/",
				"build/",
				"target/",
				"package%-lock%.json",
			}

			require("telescope").load_extension("fzf")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				command = "setlocal nofoldenable",
			})
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "S", function()
				local is_git_dir = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")

				if is_git_dir then
					builtin.git_files({})
				else
					builtin.find_files({})
				end
			end, {})
			vim.keymap.set("n", "L", function()
				builtin.live_grep({ file_ignore_patterns = file_ignore_patterns })
			end, {})
		end,
	},
}
