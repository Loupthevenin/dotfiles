local wezterm = require("wezterm")
-- local commands = require("commands")

local shortcuts = {}

shortcuts.binds = {
	-- Rename Pane
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
	-- {
	-- 	key = "T",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action_callback(function(window)
	-- 		if commands.toggle_transparency then
	-- 			commands.toggle_transparency.action(window) -- Appelle la fonction action
	-- 		else
	-- 			wezterm.log_error("La commande 'toggle_transparency' est toujours nil.")
	-- 		end
	-- 	end),
	-- },
}

return shortcuts
