script_drawData = {

}

-- draw monster/player/node data on screen

function script_drawData:drawSavedTargetLocations()

	-- for each location
	for i = 0,script_nav.numSavedLocation-1 do

		-- draw locations on screen
		local tX, tY, onScreen = WorldToScreen(script_nav.savedLocations[i]['x'], script_nav.savedLocations[i]['y'], script_nav.savedLocations[i]['z']);
	
		-- if locations are on screen then show text
		if (onScreen) then
				-- draw 15
			if (script_nav.numSavedLocation < 15) then
				DrawText('Auto Path Node', tX, tY-20, 0, 255, 255);
				DrawText('ID: ' .. i+1, tX, tY-10, 0, 255, 255);
				DrawText('ML: ' .. script_nav.savedLocations[i]['level'], tX, tY, 255, 255, 0);

				-- draw between 5 and 10
			elseif (script_nav.numSavedLocation > 15) then
				DrawText('Auto Path Node', tX, tY-20, 0, 255, 255);
				DrawText('ID: ' .. i+3, tX, tY-10, 0, 255, 255);
				DrawText('ML: ' .. script_nav.savedLocations[i]['level'], tX, tY, 255, 255, 0);

				-- draw 10 + to save your eyes from trying to sort the screen
			elseif (script_nav.numSavedLocation > 30) then
				DrawText('Auto Path Node', tX, tY-20, 0, 255, 255);
				DrawText('ID: ' .. i+3, tX, tY-10, 0, 255, 255);
				DrawText('ML: ' .. script_nav.savedLocations[i]['level'], tX, tY, 255, 255, 0);
			end

		end
	end

	-- if we have a hotspot
	if (script_nav.currentHotSpotName ~= 0) then

		-- draw current hotspot name
		local tX, tY, onScreen = WorldToScreen(script_nav.currentHotSpotX , script_nav.currentHotSpotY, script_nav.currentHotSpotZ);

		-- if locations are on screen then draw text
		if (onScreen) then
			local x, y, z = GetLocalPlayer():GetPosition();
			local hsDist = math.floor(GetDistance3D(script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ, x, y, z));
			DrawText('HOTSPOT: ' .. script_nav.currentHotSpotName.. " | " ..hsDist.. " (yd)", tX, tY, 0, 255, 255);
		end
	end
end

function script_drawData:drawUnitsDataOnScreen()
	local i, targetType = GetFirstObject();

	-- run object manager
	while i ~= 0 do

		-- NPC targets
		if (targetType == 3 and not i:IsCritter() and not i:IsDead() and i:CanAttack()) then
			
			-- draw NPC data
			script_drawData:drawMonsterDataOnScreen(i);
		end
		-- show my selected target whatever it is
		if (targetType == 3 and PlayerHasTarget() and i:GetGUID() == GetLocalPlayer():GetUnitsTarget():GetGUID()) then
			-- draw NPC data
			script_drawData:drawMonsterDataOnScreen(i);
		end

		-- player targets
		if (targetType == 4 and not i:IsCritter() and not i:IsDead()) then
	
			-- draw player data
			script_drawData:drawPlayerDataOnScreen(i);
		end

		-- get next target
		i, targetType = GetNextObject(i);
	end
end

function script_drawData:drawMonsterDataOnScreen(target)
	local player = GetLocalPlayer();
	local distance = target:GetDistance();
	local tX, tY, onScreen = WorldToScreen(target:GetPosition());

	-- if targets on screen
	if (onScreen) then
	
		-- draw creature level
		DrawText(target:GetCreatureType() .. ' - ' .. target:GetLevel(), tX, tY-10, 255, 255, 0);

		-- draw my target TARGETED
		if (GetTarget() == target) or (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget():GetGUID() == target:GetGUID()) then 

			-- draw text targeted
			DrawText('(TARGETED)', tX, tY-40, 255, 0, 0); 

			-- grinder target TARGETED

		elseif (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
			if (script_grind.enemyObj:GetGUID() == target:GetGUID()) then
				-- draw text targeted
				DrawText('(Grinder Target)', tX, tY-40, 255, 0, 0); 
			end
		end
		-- draw avoiding targets
		if (script_grind:isTargetBlacklisted(target:GetGUID())) and (script_grind.skipHardPull)
			and (not script_grind:isTargetHardBlacklisted(target:GetGUID())) then
					-- draw text avoiding
					DrawText("(Adds)", tX, tY-20, 255, 0, 0);
		end

		-- draw hard blacklisted targets
		if (script_grind:isTargetHardBlacklisted(target:GetGUID())) then

			-- draw text blacklisted
			DrawText('(Blacklisted)', tX, tY-20, 255, 150, 150);
		end

		-- draw rares
		if (target:GetClassification() == 4) then
			DrawText("(Rare)", tX, tY-25, 255, 255, 255);
		-- draw elites if not in dungeon group (party members less than 3)
		elseif (target:GetClassification() == 1) and (GetNumPartyMembers() > 4) then
			DrawText("(Elite)", tX, tY-25, 255, 255, 255);
		end

		-- draw unit HP
		DrawText('HP: ' .. math.floor(target:GetHealthPercentage()) .. '%', tX, tY, 255, 0, 0);

		-- draw unit distance
		DrawText('' .. math.floor(distance) .. ' yd.', tX, tY+10, 255, 255, 255);
	end
end

function script_drawData:drawPlayerDataOnScreen(target)
	local player = GetLocalPlayer();
	if (target:GetGUID() ~= player:GetGUID()) then 
		local distance = target:GetDistance();
		local tX, tY, onScreen = WorldToScreen(target:GetPosition());
		if (onScreen) then
			if (target:CanAttack()) then 
				DrawText('' .. target:GetUnitName() .. ' - ' .. target:GetLevel(), tX, tY-10, 255, 0, 0);
			elseif (not target:CanAttack()) then 
				DrawText('' .. target:GetUnitName() .. ' - ' .. target:GetLevel(), tX, tY-10, 0, 255, 0);
			end
			DrawText('HP: ' .. math.floor(target:GetHealthPercentage()) .. '%', tX, tY, 255, 0, 0);
			DrawText('' .. math.floor(distance) .. ' yd.', tX, tY+10, 255, 255, 255);
			-- draw my target TARGETED
			if (GetTarget() == target) or (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget():GetGUID() == target:GetGUID()) then 

			-- draw text targeted
			DrawText('(TARGETED)', tX, tY-40, 255, 0, 0); 
			end
			if (target:GetUnitsTarget() ~= 0) then
				if (target:GetUnitsTarget():GetGUID() == player:GetGUID()) then 
					DrawText('TARGETING US!', tX, tY+20, 255, 0, 0); 
				end
			end
		end
	end
end

function script_drawData:drawPath()
	local firstIndex = 0;
	local mx, my, mz = GetLocalPlayer():GetPosition();
	if (IsPathLoaded(5)) then
		if (script_nav.drawNav) then
			firstIndex = script_nav.lastpathnavIndex;
		elseif (not script_nav.drawNav) then
			firstIndex = script_nav.lastnavIndex;
		end
		if (script_nav.lastnavIndex <= GetPathSize(5)) then
			for index = firstIndex, GetPathSize(5) - 4 do
				local _x, _y, _z = GetPathPositionAtIndex(5, index);
				local _xx, _yy, _zz = GetPathPositionAtIndex(5, index+1);
				local _tX, _tY, onScreen = WorldToScreen(_x, _y, _z);
				local _tXX, _tYY, onScreens = WorldToScreen(_xx, _yy, _zz);
				if(onScreen and onScreens) then
					DrawLine(_tX, _tY, _tXX, _tYY, 255, 255, 0, 0);
					if (GetDistance3D(mx, my, mz, _xx, _yy, _zz) < 50) then
						script_aggro:DrawCircles(_x, _y, _z, 0.1);
						script_aggro:DrawCircles(_xx, _yy, _zz, .3);
					end
				end
			end
		end
	end
end