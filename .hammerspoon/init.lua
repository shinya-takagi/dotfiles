-- Setting for hammerspoon
local spaces = require("hs._asm.undocumented.spaces")

function MoveFullScreenWindow(app)
	local activeSpace = spaces.activeSpace()
	local win = app:focusedWindow()
	-- Reset Fullscreen
	win = win:toggleFullScreen()
	win = win:toggleFullScreen()
	app:hide()
	win:spacesMoveTo(activeSpace)
	win:focus()
end

hs.hotkey.bind({ "ctrl" }, "t", function()
	local appname = "Alacritty"
	local app = hs.application.get(appname)

	if app == nil then
		hs.application.launchOrFocus(appname)
	elseif app:isFrontmost() then
		app:hide()
	else
		hs.application.launchOrFocus(appname)
		-- MoveFullScreenWindow(app)
		-- or app:isHidden() then
	end
end)
