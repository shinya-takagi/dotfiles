local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Set color scheme
config.color_scheme = "AdventureTime"

-- Window background opacity
config.window_background_opacity = 0.90

-- Font
-- config.font = wezterm.font("CodeNewRoman Nerd Font Mono")

-- 最初からフルスクリーンで起動
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
	-- Alt(Opt)+Shift+Fでフルスクリーン切り替え
	{
		key = "f",
		mods = "SHIFT|META",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
