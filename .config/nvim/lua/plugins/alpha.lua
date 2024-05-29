local function configure()
	local dashboard = require("alpha.themes.dashboard")

	vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#FFB6C1" }) -- pastel pink
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#FFDAB9" }) -- pastel peach
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFECB3" }) -- pastel yellow
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#BDFCC9" }) -- pastel green
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#B0E0E6" }) -- pastel blue
	vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#D8BFD8" }) -- pastel lavender

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
