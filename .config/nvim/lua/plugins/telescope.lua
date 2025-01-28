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
				},
				extensions = {
					fzf = {},
				},
			})

			require("telescope").load_extension("fzf")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				command = "setlocal nofoldenable",
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "S", builtin.find_files, {})
			vim.keymap.set("n", "L", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>f", builtin.lsp_dynamic_workspace_symbols, {})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
