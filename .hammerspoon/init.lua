-- Setting for hammerspoon

hs.hotkey.bind({ "ctrl" }, "t", function()
	local appname = "Alacritty"
	local app = hs.application.get(appname)

	if app == nil or app:isHidden() then
		hs.application.launchOrFocus(appname)
	else
		app:hide()
	end
end)
