return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "onsails/lspkind-nvim" },
	},

	config = function()
		local lsp = require("lsp-zero")
		local lspkind = require("lspkind")
		local window = require("lspconfig.ui.windows")

		window.default_options.border = "single"

		vim.diagnostic.config({ virtual_text = true })

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gr", function()
				vim.cmd("Telescope lsp_references")
			end, opts, { desc = "LSP Goto Reference" })

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts, { desc = "LSP Goto Definition" })

			vim.keymap.set("n", "<leader>h", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, opts, { desc = "LSP Hover" })

			vim.keymap.set("n", "ca", function()
				vim.lsp.buf.code_action()
			end, opts, { desc = "LSP Code Action" })

			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float({ border = "rounded" })
			end, opts, { desc = "LSP full diagnostic window" })
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"eslint",
				"rust_analyzer",
				"lua_ls",
				"jdtls",
				"pyright",
				"gopls",
			},
			handlers = {
				lsp.default_setup,
				lua_ls = function()
					local lua_opts = lsp.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})

		local cmp = require("cmp")

		require("luasnip.loaders.from_vscode").lazy_load()

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
		cmp.setup({
			preselect = "",
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path", max_item_count = 5 },
			},

			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				}),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "",
						nvim_lsp = "",
						luasnip = "",
						nvim_lua = "",
					},
					maxwidth = 50,
					ellipsis = "...",
					symbol_map = {
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰆧",
						Constructor = "",
						Field = "󰜢",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "",
					},
				}),
			},
		})
	end,
}
