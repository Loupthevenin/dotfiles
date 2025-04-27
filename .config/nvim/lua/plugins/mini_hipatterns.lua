return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				signs = true, -- Active les icônes
				sign_priority = 8, -- Priorité des icônes

				-- Configuration des mots-clés avec les icônes
				keywords = {
					FIX = { icon = "", color = "error", alt = { "FIXME", "FIXIT" } },
					TODO = { icon = "", color = "info", alt = { "WIP" } },
					HACK = { icon = "", color = "warning" },
					WARN = { icon = "", color = "warning" },
					PERF = { icon = "", color = "perf" },
					NOTE = { icon = "", color = "hint" },
				},

				-- Configuration des couleurs de fond et de texte
				colors = {
					error = { "red", "#D70000" }, -- Couleur de l'erreur (Solarized)
					info = { "blue", "#268BD2" }, -- Couleur de l'info (Solarized)
					warning = { "yellow", "#B58900" }, -- Couleur de l'avertissement (Solarized)
					perf = { "green", "#859900" }, -- Couleur de la perf (Solarized)
					hint = { "cyan", "#2AA198" }, -- Couleur du hint (Solarized)
				},

				-- Optionally, you can customize the background highlighting for the entire line, but ensure it fits with the Solarized theme
				highlight = {
					TodoBg = "#268BD2", -- Solarized blue background for TODO
					FixmeBg = "#D70000", -- Solarized red background for FIXME
				},
			})
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				-- Color HSL(...)
				hsl_color = {
					pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
					group = function(_, match)
						local utils = require("solarized-osaka.hsl")
						local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
						local hex_color = utils.hslToHex(h, s, l)
						return require("mini.hipatterns").compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},
}
