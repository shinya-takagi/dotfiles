local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

local os = {
	windows = "x86_64-pc-windows-msvc",
	macos = "x86_64-apple-darwin",
	macos_arm64 = "aarch64-apple-darwin",
	linux = "x86_64-unknown-linux-gnu",
}
local previous_os = wezterm.target_triple

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Set color scheme
config.color_scheme = "Molokai"

-- Window background opacity
config.window_background_opacity = 0.90

-- IME
config.use_ime = true

-- Font
config.font = wezterm.font("CodeNewRoman Nerd Font Mono")

-- 最初からフルスクリーンで起動
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

-- Leader key ctrl+s
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

-- ショートカットキー設定
config.keys = {
	-- Alt(Opt)+Shift+Fでフルスクリーン切り替え
	{
		key = "f",
		mods = "SHIFT|META",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Leader + c で新しいタブを開く
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	-- Leader + d でタブを閉じる
	{
		key = "d",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	-- Leader + v でペインを縦に分割
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Leader + h でペインを横に分割
	{
		key = "h",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Leader + t でタブを移動
	{
		key = "t",
		mods = "LEADER",
		action = act.MoveTabRelative(1),
	},
}
for i = 1, 8 do
	-- Leader + 数字 で数字のタブに移動
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		-- action = act.MoveTab(i - 1),
		action = act.ActivateTab(i - 1),
	})
end

if previous_os == os.windows then
	-- Windows
	config.default_prog = { "wsl.exe", "~" }
end
if previous_os == os.macos then
	-- macOS
	config.default_prog = { "zsh" }
end

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

-- タブのカスタマイズ
-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- 	-- プロセスに合わせてアイコン表示
-- 	local nerd_icons = {
-- 		nvim = wezterm.nerdfonts.custom_vim,
-- 		vim = wezterm.nerdfonts.custom_vim,
-- 		bash = wezterm.nerdfonts.dev_terminal,
-- 		zsh = wezterm.nerdfonts.dev_terminal,
-- 		ssh = wezterm.nerdfonts.mdi_server,
-- 		top = wezterm.nerdfonts.mdi_monitor,
-- 		docker = wezterm.nerdfonts.dev_docker,
-- 		node = wezterm.nerdfonts.dev_nodejs_small,
-- 	}
-- 	local zoomed = ""
-- 	if tab.active_pane.is_zoomed then
-- 		zoomed = "[Z] "
-- 	end
-- 	local pane = tab.active_pane
-- 	local process_name = basename(pane.foreground_process_name)
-- 	local icon = nerd_icons[process_name]
-- 	local index = tab.tab_index + 1
-- 	local cwd = basename(pane.current_working_dir)
--
-- 	-- 例) 1:project_dir | zsh
-- 	local title = index .. ": " .. cwd .. "  | " .. process_name
-- 	if icon ~= nil then
-- 		title = icon .. "  " .. zoomed .. title
-- 	end
-- 	return {
-- 		{ Text = " " .. title .. " " },
-- 	}
-- end)

return config
