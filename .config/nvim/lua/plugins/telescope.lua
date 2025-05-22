return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true, --Set hidden files to show up
            no_ignore = true,
          },
        },
        extensions = {
          fzf = {},
        },
      })

      local file_ignore_patterns = {
        "yarn%.lock",
        "node_modules/",
        "raycast/",
        "dist/",
        "%.next",
        "%.git/",
        "%.gitlab/",
        "%.venv/",
        "%.ruff_cache/",
        "build/",
        "target/",
        "package%-lock%.json",
      }

      require("telescope").load_extension("fzf")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        command = "setlocal nofoldenable",
      })
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "S", function()
        builtin.find_files({ file_ignore_patterns = file_ignore_patterns })
      end, {})

      vim.keymap.set("n", "L", function()
        builtin.live_grep({
          file_ignore_patterns = file_ignore_patterns,
          additional_args = function()
            return { "--hidden" }
          end,
        })
      end, {})
    end,
  },
}
