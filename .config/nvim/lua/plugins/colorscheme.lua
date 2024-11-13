return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			transparent = true,
			terminalColors = true,
			theme = "dragon",
			colors = {
				theme = { all = { ui = { bg_gutter = "none" } } },
			},
		})
		vim.cmd("colorscheme kanagawa")
		vim.cmd(":hi! LspInlayHint guibg=#00000000, guifg=#727072")
	end,
}
