local ok, ai = pcall(require, "mini.ai")
if not ok then
	return
end

ai.setup({
	n_lines = 500,
	custom_textobjects = {
		o = ai.gen_spec.treesitter({ -- code block
			a = { "@block.outer", "@conditional.outer", "@loop.outer" },
			i = { "@block.inner", "@conditional.inner", "@loop.inner" },
		}),
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
		t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
		d = { "%f[%d]%d+" }, -- digits
		e = { -- Word with case
			{
				"%u[%l%d]+%f[^%l%d]",
				"%f[%S][%l%d]+%f[^%l%d]",
				"%f[%P][%l%d]+%f[^%l%d]",
				"^[%l%d]+%f[^%l%d]",
			},
			"^().*()$",
		},
		g = function() -- Whole buffer
			local from = { line = 1, col = 1 }
			local to = {
				line = vim.fn.line("$"),
				col = math.max(vim.fn.getline("$"):len(), 1),
			}
			return { from = from, to = to }
		end,
		u = ai.gen_spec.function_call(), -- u for "Usage"
		U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
	},
})
