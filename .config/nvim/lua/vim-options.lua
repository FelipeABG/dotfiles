vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set scrolloff=10")
vim.cmd("set relativenumber")
vim.cmd("set termguicolors")
vim.cmd("set updatetime=50")
vim.cmd("set pumheight=15")
vim.cmd("set foldopen-=block")
vim.cmd("set foldtext=MyFoldText()")

vim.o.hlsearch = false
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.fillchars = { eob = " " }

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<leader>f", ":set foldmethod=indent<CR> :set foldnestmax=2<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("n", "K", ":suspend<CR>")

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd("TermClose", {
	group = vim.api.nvim_create_augroup("term-close", { clear = true }),
	callback = function()
		vim.opt.number = true
		vim.opt.relativenumber = true
	end,
})

vim.keymap.set("n", "P", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })
