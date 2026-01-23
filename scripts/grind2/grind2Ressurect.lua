grind2Ressurect = {
		currentRessAngle = 0,	-- res angle
	rX = 0,			-- res position
	rY = 0,			-- res position
	rZ = 0,			-- res position
	rTime = 0,		-- res time
	adjustAggro = 1.5,	-- adjust blacklist distance range
	tarDist = 0,		-- target distance checked with run away from adds range
	waitTimer = 0,
}

function grind2Ressurect:run()

	local player = GetLocalPlayer();

	if (player:IsDead()) then

		-- wait for a moment before anything
		if player:IsDead() and not IsGhost() then

			grind2:setTimer(2500);
		end

		-- Release body
		if (not IsGhost()) then

			-- try to wait before releasing to ghost
			grind2:setTimer(4000);

			-- release to ghost
			if (not RepopMe()) then

				-- wait a moment for the game to load before moving
				grind2:setTimer(2500);

			return true;
			end

		return true;
		end

		-- make sure we are ghost before moving on to finding corpse
		if IsGhost() then

			grind2.grinderMessage = "Walking to corpse...";

			-- Ressurrect within the ress distance to our corpse
			local _lx, _ly, _lz = player:GetPosition();

			-- our distance is greater than set ress distance
			if (GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_grind.ressDistance) then
				script_nav:moveToNav(player, GetCorpsePosition());
			else
				-- if we are close enough and want to safetly res in the area
				if (script_grind.safeRess) then
					local rx, ry, rz = GetCorpsePosition();
					if (grind2Ressurect:safeRess(rx, ry, rz, script_grind.ressDistance)) then
						grind2.grinderMessage = "Finding a safe spot to ress...";
						return true;
					else
						if (script_aggro.rTime > GetTimeEX()) then
							script_nav:moveToNav(player, script_aggro.rX, script_aggro.rY, script_aggro.rZ);	
							grind2.grinderMessage = "Finding a safe spot to ress...";
							return true;
						end
					end
				end

			RetrieveCorpse();

			end
		return true;
		end
	end
end
	-- find a safe spot to ressurect
function grind2Ressurect:safeRess(corpseX, corpseY, corpseZ, ressRadius) 
	local countUnitsInRange = 0;
	local currentObj, typeObj = GetFirstObject();
	local localObj = GetLocalPlayer();
	local closestEnemy = 0;
	local closestDist = 999;
	local aggro = 0;
	local aggroClosest = 0;

	-- run object manager
	while currentObj ~= 0 do

		-- NPC type 3
 		if typeObj == 3 then

			-- acceptable targets
			if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() then

				-- set safe res distances based on level
				aggro = currentObj:GetLevel() - localObj:GetLevel() + 21;

				-- acceptable range to run avoid during ressurection
				if currentObj:GetDistance() <= aggro then
		
					-- set closest enemy
					if (closestEnemy == 0) then
						closestEnemy = currentObj;
						aggroClosest = currentObj:GetLevel() - localObj:GetLevel() + 21;
				else
						-- get nearest enemy from closest enemy position
						local dist = currentObj:GetDistance();
						local closestDist = 999

						-- rerun object manager until you find closest target in range
						if (dist < closestDist) then
		
							-- make that enemy the closest target
							closestDist = dist;

							-- closest enemy to avoid
							closestEnemy = currentObj;
						end
					end
				end
 			end
 		end

		-- get next target
 		currentObj, typeObj = GetNextObject(currentObj);
 	end

	-- avoid the closest mob
	if (closestEnemy ~= 0) then

			-- set res angle each return
			self.currentRessAngle = self.currentRessAngle - 0.01;

			-- set position to move each return
			rX, rY, rZ = corpseX+ressRadius*math.cos(self.currentRessAngle), corpseY+ressRadius*math.sin(self.currentRessAngle), corpseZ;

			-- set res time
			rTime = GetTimeEX();

			-- move to point
			script_navEX:moveToTarget(GetLocalPlayer(), rX, rY, rZ);			
		return true;
	end
return false;
end
