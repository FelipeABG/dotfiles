return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ -- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
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

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, opts, { desc = "LSP Goto Reference" })

			vim.keymap.set("n", "<leader>gd", function()
				vim.lsp.buf.definition()
			end, opts, { desc = "LSP Goto Definition" })

			vim.keymap.set("n", "<leader>h", function()
				vim.lsp.buf.hover()
			end, opts, { desc = "LSP Hover" })

			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts, { desc = "LSP Workspace Symbol" })

			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.setloclist()
			end, opts, { desc = "LSP Show Diagnostics" })

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts, { desc = "Next Diagnostic" })

			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts, { desc = "Previous Diagnostic" })

			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts, { desc = "LSP Code Action" })

			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts, { desc = "LSP References" })

			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts, { desc = "LSP Rename" })

			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts, { desc = "LSP Signature Help" })
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"tsserver",
				"eslint",
				"rust_analyzer",
				"lua_ls",
				"jsonls",
				"html",
				"jdtls",
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
				{ name = "neorg" },
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
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
