tell application "System Events" to tell process "GlobalProtect"
	click menu bar item 1 of menu bar 2 -- Activates the GlobalProtect "window" in the menubar
	click button 2 of window 1 -- Clicks either Connect or Disconnect
	click menu bar item 1 of menu bar 2 -- This will close the GlobalProtect "window" after clicking Connect/Disconnect. This is optional.
end tell
