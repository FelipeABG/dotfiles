return {
	"ggandor/leap.nvim",

	vim.keymap.set("n", "m", "<Plug>(leap)"),

	vim.api.nvim_create_autocmd("BufWinEnter", { command = "highlight LeapBackdrop guifg=#777777" }),
	vim.api.nvim_create_autocmd("BufWinEnter", { command = "highlight LeapLabelPrimary guifg=#ff69b4" }),
}
