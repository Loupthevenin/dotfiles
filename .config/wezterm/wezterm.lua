local wezterm = require("wezterm")
local commands = require("commands")
local constants = require("constants")
local config = wezterm.config_builder()
-- local shortcuts = require("shortcuts.shortcuts")

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
config.colors = require("colors.default")

config.window_decorations = "RESIZE"

config.max_fps = 120
config.prefer_egl = true

config.window_background_image = constants.bg_image

-- Shortcuts
-- config.keys = shortcut.binds;
config.keys = { -- Rename Pane
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
	-- Split Vertical
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	-- Split Horizontal
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
}

-- Commands palette
wezterm.on("augment-command-palette", function()
	return commands
end)

return config
