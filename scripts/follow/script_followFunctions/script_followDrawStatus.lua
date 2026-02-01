script_followDrawStatus = {}

function script_followDrawStatus:drawStatus()
	if (script_follow.drawPath) then
		script_drawData:drawPath();
	end 

	if (script_follow.drawUnits) then
		script_drawData:drawUnitsDataOnScreen();
	end
	if (script_aggro.drawAggro) then 
		script_aggro:drawAggroCircles(script_followMenu.drawAggroRange);
	end
	-- color
	local r, g, b = 255, 255, 0;
	-- position
	local y, x, width = 120, 25, 370; local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		y, x = tY+25, tX+50; 
	end

	--DrawRect(x - 10, y - 5, x + width, y + 80, 255, 255, 0,  1, 1, 1);
	--DrawRectFilled(x - 10, y - 5, x + width, y + 80, 0, 0, 0, 160, 0, 0);

	if (GetPartyLeaderObject() ~= 0) then
		if (GetPartyLeaderObject()) and (GetNumPartyMembers() > 0) then
			DrawText('Follower - Range: ' .. math.floor(script_follow.followLeaderDistance) .. ' yd. ' .. 
			'Master target: ' .. GetPartyLeaderObject():GetUnitName(), x-5, y-4, r, g, b) y = y + 15;
		elseif (GetNumPartyMembers() > 0) then
			DrawText('Follower - Follow range: ' .. math.floor(script_follow.followDistance) .. ' yd. ' .. 
			'Master target: ' .. '', x-5, y-4, r, g, b) y = y + 15;
		end
	end

		DrawText('Status: ', x, y, r, g, b); 
		y = y + 15; DrawText(script_follow.message or "error", x, y, 0, 255, 255);
		y = y + 20; DrawText('Combat script status: ', x, y, r, g, b); y = y + 30;
		x = x -20; RunCombatDraw();
end
