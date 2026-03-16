return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" }, -- fuente de snippets para cmp
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		local map = vim.keymap.set
		local create = vim.api.nvim_create_user_command

		-- CMP + LSP
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", { capabilities = capabilities })

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-f>"] = function()
					luasnip.jump(1)
				end,
				["<C-b>"] = function()
					luasnip.jump(-1)
				end,

				-- opcional: moverte por el menú con C-j/C-k
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
			},
			sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
		})
	end,
}
