return {
	"L3MON4D3/LuaSnip",
	config = function()
		local luasnip = require("luasnip")
		local extras = require("luasnip.extras")

		-- Set html snips to work with other extensions
		luasnip.filetype_extend("htmldjango", { "html" })
		luasnip.filetype_extend("html", { "htmldjango" })
		luasnip.filetype_extend("javascriptreact", { "html" })

		local snippet = luasnip.snippet
		local text = luasnip.text_node
		local insert = luasnip.insert_node
		local rep = extras.rep

		--Latex snippets
		luasnip.add_snippets("tex", {
			--Fraction
			snippet("\\frac", {
				text("\\frac{"),
				insert(1),
				text("}{"),
				insert(2),
				text("}"),
				insert(3),
			}),

			--Limit
			snippet("\\lim", {
				text("\\lim_{x \\to "),
				insert(1),
				text("}"),
				insert(2),
			}),

			--Begin
			snippet("\\begin", {
				text("\\begin{"),
				insert(1),
				text("}"),
				text({ "", "\\end{" }),
				rep(1),
				text("}"),
			}),

			--Derivative
			snippet("\\derivative", {
				text("\\frac{d}{dx"),
				text("}"),
				insert(2),
			}),

			--Math enviroment
			snippet("$", {
				text("$$"),
				text({ "", "" }),
				insert(1),
				text({ "", "" }),
				text("$$"),
			}),
		})
	end,
}
