grind2Messages = {

}

function grind2Messages:run()

	-- color
	local r, g, b = 0, 0, 0;

	-- position
	local y, x, width = 120, 25, 370;

	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());

	if (onScreen) then

		DrawText(grind2.grinderMessage, x + 600, y - 10, 255, 255, 255);

		-- combat messages
		--DrawText(script_druid.message, x + 600, y - 25, 255, 255, 255);
	end

end