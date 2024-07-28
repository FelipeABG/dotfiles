local function configure()
  local dashboard = require("alpha.themes.dashboard")

  vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#5de4c7" }) -- Starting color
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#51dcb9" }) -- Intermediate color
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#45d4ab" }) -- Intermediate color
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#39cc9d" }) -- Intermediate color
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#2dc48f" }) -- Intermediate color
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#21bc81" }) -- Ending color

  dashboard.section.header.type = "group"
  dashboard.section.header.val = {
    {
      type = "text",
      val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
    },
    {
      type = "text",
      val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
    },
    {
      type = "text",
      val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
    },
    {
      type = "text",
      val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
    },
    {
      type = "text",
      val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
    },
    {
      type = "text",
      val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
    },
  }

  dashboard.section.buttons.val = {
    dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("t", " " .. " File browser", ":Oil<CR>"),
    dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  }

  return dashboard.config
end

return {
  "goolord/alpha-nvim",
  lazy = true,
  event = "VimEnter",
  config = function(_, dashboard)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(configure())
  end,
}
