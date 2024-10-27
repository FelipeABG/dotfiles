return {
	"loctvl842/monokai-pro.nvim",
	priority = 1000,
	config = function()
		require("monokai-pro").setup({
			transparent_background = true,
			terminal_colors = true,
			background_clear = {
				"float_win",
				"telescope",
			},
		})
		vim.cmd("colorscheme monokai-pro")
	end,
}
