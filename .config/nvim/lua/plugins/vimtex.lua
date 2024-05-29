return {
	"lervag/vimtex",
	init = function()
		vim.g["vimtex_context_pdf_viewer"] = "skim"
		vim.g["tex_flavor"] = "latex"
		vim.g["vimtex_view_method"] = "skim"
		vim.g["vimtex_indent_enabled"] = 1
	end,
}
