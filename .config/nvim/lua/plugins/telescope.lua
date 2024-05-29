return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "S", builtin.find_files, {})
			vim.keymap.set("n", "L", builtin.live_grep, {})
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
				load_extension = {
					"bibtex",
					"harpoon",
				},
			})
			bibtex = {
				depth = 1,
				-- Depth for the *.bib file
				global_files = { "~/Library/texmf/bibtex/bib/Zotero.bib" },
				-- Path to global bibliographies (placed outside of the project)
				search_keys = { "author", "year", "title" },
				-- Define the search keys to use in the picker
				citation_format = "{{author}} ({{year}}), {{title}}.",
				-- Template for the formatted citation
				citation_trim_firstname = true,
				-- Only use initials for the authors first name
				citation_max_auth = 2,
				-- Max number of authors to write in the formatted citation
				-- following authors will be replaced by "et al."
				custom_formats = {
					{ id = "citet", cite_maker = "\\citet{%s}" },
				},
				-- Custom format for citation label
				format = "citet",
				-- Format to use for citation label.
				-- Try to match the filetype by default, or use 'plain'
				context = true,
				-- Context awareness disabled by default
				context_fallback = true,
				-- Fallback to global/directory .bib files if context not found
				-- This setting has no effect if context = false
				wrap = false,
				-- Wrapping in the preview window is disabled by default
			}
			require("telescope").load_extension("ui-select")
		end,
	},
}
