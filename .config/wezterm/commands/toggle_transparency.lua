local wezterm = require("wezterm")
local constants = require("constants")

local function file_exists(path)
	local f = io.open(path, "r")
	if f then
		f:close()
	end
	return f ~= nil
end

local command = {
	brief = "Toggle terminal transparency",
	icon = "md_circle_opacity",
	action = wezterm.action_callback(function(window)
		local overrides = window:get_config_overrides() or {}

		if not overrides.window_background_opacity or overrides.window_background_opacity == 1 then
			overrides.window_background_opacity = 0.7
			overrides.window_background_image = ""
		else
			overrides.window_background_opacity = 1
			if file_exists(constants.bg_image) then
				overrides.window_background_image = constants.bg_image
			else
				overrides.window_background_image = ""
				wezterm.log_error("Background image not found: " .. tostring(constants.bg_image))
			end
		end

		window:set_config_overrides(overrides)
	end),
}

return command
