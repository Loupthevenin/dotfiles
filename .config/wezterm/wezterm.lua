local wezterm = require("wezterm")
local commands = require("commands")
local constants = require("constants")
local shortcuts = require("shortcuts.shortcuts")

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
config.colors = require("colors.default")

-- Window
config.window_decorations = "RESIZE"
config.max_fps = 120
config.prefer_egl = true
config.window_background_image = constants.bg_image

-- Shortcuts
config.keys = shortcuts.binds

-- Commands palette
wezterm.on("augment-command-palette", function()
	return commands
end)

return config
