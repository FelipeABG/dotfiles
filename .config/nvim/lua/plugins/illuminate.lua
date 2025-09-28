return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			-- delay: delay in milliseconds
			delay = 100,
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
			},
			under_cursor = false,
			large_file_cutoff = nil,
			large_file_overrides = nil,
			min_count_to_highlight = 1,
			should_enable = function(bufnr)
				return true
			end,
			case_insensitive_regex = false,
		})
	end,
}
