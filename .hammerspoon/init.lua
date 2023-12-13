-- Setting for hammerspoon
-- local spaces = require("hs._asm.undocumented.spaces")
local hotkey = require("hs.hotkey")
local application = require("hs.application")
-- hs.spaces
local spaces = require("hs.spaces")

-- Fullscreen window move to current space
function MoveFullScreenWindow(app)
	local activeSpace = spaces.focusedSpace()
	local win = app:focusedWindow()
	-- Reset Fullscreen
	win = win:toggleFullScreen()
	win = win:toggleFullScreen()
	app:hide()
	spaces.moveWindowToSpace(win, activeSpace)
	win:focus()
end

-- Move window to current space
function MoveWindowToSpace(app)
	local activeSpace = spaces.focusedSpace()
	local win = app:focusedWindow()
	spaces.moveWindowToSpace(win, activeSpace)
	-- app:setFrontmost()
	-- win:spacesMoveTo(space)
	win:focus()
end

hotkey.bind({ "ctrl" }, "t", function()
	local appname = "Alacritty"
	local app = application.get(appname)

	if app == nil then
		application.launchOrFocus(appname)
	elseif app:isFrontmost() then
		app:hide()
	else
		-- application.launchOrFocus(appname)
		-- MoveWindowToSpace(app)
		MoveFullScreenWindow(app)
		-- or app:isHidden() then
	end
end)
