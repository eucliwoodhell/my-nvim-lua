-- Variable global para el modelo (puedes cambiar el default aquí)
_G.abacus_current_model = "route-llm"

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- Opcional: hace que el selector se vea mejor
	},
	opts = {
		adapters = {
			http = {
				abacus = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://routellm.abacus.ai",
							api_key = "ABACUS_API_KEY", -- Lee de tu variable de entorno Fish
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = _G.abacus_current_model, -- Usa la variable dinámica
							},
						},
					})
				end,
			},
		},
		-- Configuración para v19+
		interactions = {
			chat = { adapter = "abacus" },
			inline = { adapter = "abacus" },
			cmd = { adapter = "abacus" },
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)

		local map = vim.keymap.set

		-- Keybindings básicos
		map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "IA Acciones" })
		map({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "IA Chat" })

		-- Función para seleccionar modelo
		map("n", "<leader>am", function()
			local models = {
				"route-llm",
				"claude-3-7-sonnet-20250219",
				"gpt-4o-2024-11-20",
				"gemini-2.5-flash",
				"meta-llama/Meta-Llama-3.1-405B-Instruct-Turbo",
				"deepseek-ai/DeepSeek-R1",
			}

			vim.ui.select(models, {
				prompt = "Seleccionar Modelo Abacus:",
				format_item = function(item)
					return "󱚣  " .. item
				end,
			}, function(choice)
				if choice then
					_G.abacus_current_model = choice
					vim.notify("Modelo cambiado a: " .. choice, vim.log.levels.INFO, { title = "Abacus AI" })

					-- Forzamos a CodeCompanion a recargar el adaptador con el nuevo modelo
					package.loaded["codecompanion.adapters"] = nil
				end
			end)
		end, { desc = "IA Seleccionar Modelo" })
	end,
}
