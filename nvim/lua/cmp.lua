return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require('cmp')
		local sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer"},
		})
		local mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}
		cmp.setup({ sources = sources, mapping = mapping })
	end,
}
