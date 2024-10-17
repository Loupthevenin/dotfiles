local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0

-- background
config.window_background_opacity = 0.7
config.macos_window_background_blur = 8
config.enable_scroll_bar = false

-- tab_bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 200
config.colors = {
	tab_bar = {
		background = "#1b1b2b", -- Couleur de fond de la tab_bar sans opacité
		active_tab = {
			bg_color = "#1b1b2b", -- Couleur de fond de l'onglet actif
			fg_color = "#ffffff", -- Couleur du texte de l'onglet actif
		},
		inactive_tab = {
			bg_color = "#2b2b3b", -- Couleur de fond des onglets inactifs avec opacité (80 = 50% d'opacité)
			fg_color = "#888888", -- Couleur du texte des onglets inactifs
		},
		inactive_tab_hover = {
			bg_color = "#3b3b4b", -- Couleur de fond au survol d'un onglet inactif (60 = 37.5% d'opacité)
			fg_color = "#ffffff", -- Couleur du texte au survol
		},
	},
}

config.window_decorations = "RESIZE"

-- Shortcuts
config.keys = {
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Rename Tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
}

return config
