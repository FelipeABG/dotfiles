return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufEnter",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			indent = {
				char = "▏", -- thinner line (alternatives: "¦", "┆", "┊")
			},
			scope = {
				enabled = false,
				show_start = false,
				show_end = false,
			},
		})
	end,
}
