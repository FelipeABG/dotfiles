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

vim.o.hlsearch = false
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.fillchars = { eob = " " }

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "U", "<C-r>")
