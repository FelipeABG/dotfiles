return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "S", builtin.find_files, {})
      vim.keymap.set("n", "L", builtin.live_grep, {})
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        load_extension = {
          "harpoon",
        },
        pickers = {
          find_files = {
            hidden = true, --Set hidden files to show up
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end,
  },

}
