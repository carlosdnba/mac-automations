-- Hello there!
-- This applescript will toggle your dock position when another screen is connected.

property displayCount : missing value
property tempDisplayCount : missing value

countDisplays()

repeat
	repeat until displayCount is greater than 1
		countDisplays()
	end repeat
	displayConnected()
	countDisplays()
	copy displayCount to tempDisplayCount
	repeat until tempDisplayCount is not equal to displayCount
		countDisplays()
	end repeat
	copy displayCount to tempDisplayCount
	if tempDisplayCount is greater than displayCount then
		displayConnected()
	else if tempDisplayCount is equal to displayCount then
		displayDisconnected()
	end if
end repeat

on displayConnected()
	-- The Following Lines Will Execute When An Additional Display Is Connected
	-- Replace The Following Code With Whatever Actions You Choose
	-- OR use the "run script" command as in the sample below
	-- set theScript to (path to desktop as text) & "whatever.scpt"
	-- set runScript to run script alias theScript
	
	moveDockToLeft()
	
	-- activate
	-- set newDisplayConnected to button returned of (display dialog "New Display Connected" buttons {"Stop Monitoring", "Continue Monitoring"} default button "Continue Monitoring")
	-- if newDisplayConnected is "Stop Monitoring" then
	--     quit me
	-- end if
end displayConnected

on displayDisconnected()
	-- The Following Lines Will Execute When A Display Is Disconnected
	-- Replace The Following Code With Whatever Actions You Choose
	-- OR use the "run script" command as in the sample below
	-- set theScript to (path to desktop as text) & "whatever.scpt"
	-- set runScript to run script alias theScript
	
	moveDockToBottom()
	
	-- activate
	-- set newDisplayDisconnected to button returned of (display dialog "A Display Was Disconnected" buttons {"Stop Monitoring", "Continue Monitoring"} default button "Continue Monitoring")
	-- if newDisplayDisconnected is "Stop Monitoring" then
	--     quit me
	-- end if
end displayDisconnected

on countDisplays()
	tell application "Image Events"
		set theDisplays to count of displays
	end tell
	set displayCount to theDisplays
	delay 2 -- How Often To Check How Many Connected Monitors.. In Seconds
end countDisplays

on moveDockToLeft()
	tell application "System Events" to tell dock preferences
		set screen edge to left
	end tell
end moveDockToLeft

on moveDockToBottom()
	tell application "System Events" to tell dock preferences
		set screen edge to bottom
	end tell
end moveDockToBottom

