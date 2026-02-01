grind2Messages = {

}

function grind2Messages:run()

	-- color
	local r, g, b = 0, 0, 0;

	-- position
	local y, x, width = 120, 25, 370;

	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());

	if (onScreen) then
		
		-- only show the separator on screen if grinder is not paused and a message is displayed
		local placeHolder = "";
		if not grind2.pause then
			placeHolder = " | ";
		end

		-- draw the messages from grinder and combat scripts on screen
		DrawText(tempCombatMessage:getClassScriptMessage()..placeHolder..grind2.grinderMessage, x + 500, y - 50, 255, 255, 255);

	end

end