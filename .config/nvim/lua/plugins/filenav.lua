return {
    "wojciech-kulik/filenav.nvim",
    config = function()
        require("filenav").setup({
            next_file_key = "<leader>nf",
            prev_file_key = "<leader>pf",
            max_history = 100,
            remove_duplicates = false,
        })
    end,
}
