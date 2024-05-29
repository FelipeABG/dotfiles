return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },

      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        java = { "google-java-format" },
        markdown = { { "prettierd", "prettier" } },
        html = { "htmlbeautifier" },
        rust = { "rustfmt" },
        css = { { "prettierd", "prettier" } },
        tex = { "latexindent" },
        python = { "black" },
      },
    })
  end,
}
