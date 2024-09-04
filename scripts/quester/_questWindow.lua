_questWindow = {}

function _questWindow:window()

	-- end debug window - we don't need it
	EndWindow();

	-- open new window and desired x, y coords on screen
	if(NewWindow("Quester", 320, 300)) then

		-- run quest menu window
		_questMenu:menu();

	end

	-- color
	local r, g, b = 0, 0, 0;

	-- position
	local y, x, width = 120, 25, 370;

	-- get position on screen to display text
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());

	-- display on screen
	if (onScreen) then

		-- set x, y coords to display text/window
		y, x = tY-25, tX+75;

	end

		
		DrawText("Quester", x, y-4, r+255, g+255, b+0) y = y + 15;

		DrawText("Quester Status:", x, y, r+255, g+255, b+0);

		DrawText(_quest.message or "error", x + 115, y, 255, 255, 255);

		DrawText("_______________", x, y+3, r+255, g+255, b);

		y = y + 20; DrawText('Combat Script Status:', x, y, r+255, g+255, b+0); y = y + 15;

		-- show combat script text
		if (script_grind.showClassOptions) then
			RunCombatDraw();
		end

		DrawText("_____________________", x, y-12, r+255, g+255, b);

		DrawText('Vendor - ' .. script_vendorMenu:getInfo(), x, y, r+255, g+255, b+0); y = y + 15;

		DrawText('Vendor Status: ', x, y, r+255, g+255, b+0);

		DrawText(script_vendor:getMessage(), x+105, y, 0, 255, 255);

end