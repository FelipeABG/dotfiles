return {
	"ThePrimeagen/harpoon",
	lazy = true,
	vim.keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>"),
	vim.keymap.set("n", "<leader>o", ":Telescope harpoon marks<CR>"),
	vim.keymap.set("n", "X", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
	vim.keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>"),
	vim.keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>"),
	vim.keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>"),
	vim.keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>"),
	vim.keymap.set("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>"),
}
