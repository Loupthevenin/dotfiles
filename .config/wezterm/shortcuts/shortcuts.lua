local wezterm = require("wezterm")
local commands = require("commands")

local shortcuts = {}

shortcuts.binds = {
	-- Rename Tab
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
	-- 🔥 Toggle transparency
	{
		key = "T",
		mods = "CTRL|SHIFT",
		action = commands.toggle_transparency.action,
	},
}

return shortcuts
