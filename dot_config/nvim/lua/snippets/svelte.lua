local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define Svelte snippet
ls.add_snippets("svelte", {
	s("s-init", {
		t({ "<script lang='ts'>", "" }),
		t({ "  ", "" }),
		i(1, "// TypeScript code here"),
		t({ "", "</script>", "", "" }),
		t({ "<div>", "" }),
		t({ "  ", "" }),
		i(2, "<!-- HTML here -->"),
		t({ "", "</div>" }),
	}),
})
