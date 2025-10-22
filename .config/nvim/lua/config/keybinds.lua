vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<leader>f", ":set foldmethod=indent<CR> :set foldnestmax=2<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("n", "K", ":suspend<CR>")
vim.keymap.set("n", "<leader>lsp", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    if vim.diagnostic.is_enabled() then
        print("LSP: On")
    else
        print("LSP: Off")
    end
end, { silent = true, noremap = true })
