return {
	"sainnhe/everforest",
	dependencies = "stevearc/dressing.nvim", --Code actions UI
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_background = "hard"
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_enable_bold = 1
		vim.g.everforest_float_style = "dim"
		vim.g.everforest_transparent_background = "2"

		vim.cmd.colorscheme("everforest")
		local hl_groups = { "DiagnosticUnderlineError", "DiagnosticUnderlineWarn" }

		for _, hl in ipairs(hl_groups) do
			vim.cmd.highlight(hl .. " gui=underline")
		end
		require("dressing").setup()
	end,
}
