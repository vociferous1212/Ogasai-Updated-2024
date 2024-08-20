script_rotationEX = {

drawEnabled = false,
	drawAggro = false,
	drawGather = false,
	drawUnits = false,
	drawChests = true,
	aggroRangeTank = 50,


}

function script_rotationEX:draw()

	script_rotation:window();

	if (script_radar.showRadar) then
		script_radar:draw()
	end

	if (self.drawAggro) then 
		script_aggro:drawAggroCircles(self.aggroRangeTank); 
	end

	if (self.drawGather) then 
		script_gather:drawGatherNodes(); 
	end

	if (self.drawUnits) then 
		script_drawData:drawUnitsDataOnScreen(); 
	end

	if (not self.drawEnabled) then 
		return; 
	end

	if (script_rotationEX.drawChests) then
		script_gather:drawChestNodes();
	end

	-- color
	local r, g, b = 255, 55, 55;

	-- position
	local y, x, width = 120, 25, 370;
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		y, x = tY-25, tX+75;
	end

	-- info
	if (not script_rotation.pause) then
		--DrawRect(x - 10, y - 5, x + width, y + 120, 255, 255, 0,  1, 1, 1);
		--DrawRectFilled(x - 10, y - 5, x + width, y + 80, 0, 0, 0, 60, 0, 0);
		--DrawText('Rotation', x-5, y-4, r, g, b) y = y + 15;
		DrawText('Script Idle: ' .. math.max(0, math.floor(script_rotation.waitTimer-GetTimeEX())) .. ' ms.', x+255, y, 255, 255, 255); y = y + 20;
		--DrawText('Rotation status: ', x+255, y, r, g, b); y = y + 20;
		DrawText(script_rotation.message or "error", x+255, y, 100, 255, 255);
		DrawText('Status: ', x+255, y+30, r, g, b);
	end
end