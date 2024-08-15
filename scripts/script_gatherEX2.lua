script_gatherEX2 = {waitTimer = 0,}

-- is there a node anywhere on the map we can see
function script_gatherEX2:isThereAnyValidNode()
	local i, t = GetFirstObject();
	while i ~= 0 do
		if t == 5 then
			return true;
		end
	i, t = GetNextObject(i);
	end
return false;
end

-- if there is a mob within gathering distance based on aggro range then
function script_gatherEX2:checkForTargetsOnGatherRoute()

	-- wait out timer to stop targeting diffrent mobs over and over again
	if (self.waitTimer > GetTimeEX()) then
		return false;
	end
	-- if we have a valid node and it's not blacklisted then
	if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) and (not script_gather:isNodeBlacklisted(script_gather.nodeGUID)) then

		i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				-- check targets within 40 yards
				if (i:GetDistance() <= 40) and (not i:IsDead()) and (not i:IsCritter()) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) and (i:IsInLineOfSight()) then
					local node = script_gather.nodeObj;
					local iX, iY, iZ = i:GetPosition();	
					local lX, lY, lZ = GetLocalPlayer():GetPosition();
					local nX, nY, nZ = script_gather.nodeObj:GetPosition();

					-- target distance to node
					local targetToNode = GetDistance3D(iX, iY, iZ, nX, nY, nZ);

					-- my distance to target
					local meToTarget = GetDistance3D(lX, lY, lZ, iX, iY, iZ);
			
					-- my distance to node
					local meToNode = GetDistance3D(lX, lY, lZ, nX, nY, nZ);

					-- aggro range of mobs around me and node
					local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 19.5;
					local bestDist = aggro;
					local bestTarget = nil;

					-- if we can see the node and it is within 40 yards then attack enemies within 25 yards
					if (targetToNode <= aggro and meToNode <= 40 and node:IsInLineOfSight())
					-- or attack targets near me on my way to gather node
					or (meToTarget <= aggro) and (not GetLocalPlayer():HasBuff("Stealth")) and (not GetLocalPlayer():HasBuff("Prowl")) then
						
						script_grind.enemyObj = i;
						i:AutoAttack();
						self.waitTimer = GetTimeEX() + 4000;
						return true;
					end
				
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end

function script_gatherEX2:isNodeSafeToGather()
	local i, t = GetFirstObject();

-- if we have a valid node and it's not blacklisted then
	if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) and (not script_gather:isNodeBlacklisted(script_gather.nodeObj:GetGUID())) then

		


		while i ~= 0 do
			if t == 3 then

				local nx, ny, nz = script_gather.nodeObj:GetPosition();
				local ix, iy, iz = i:GetPosition();
				local numberOfEnemiesNearNode = 0;

				local dist = GetDistance3D(nx, ny, nz, ix, iy, iz);

				-- aggro range of mobs around me and node
				local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 19.5;
				
				if (dist <= aggro) then
					numberOfEnemiesNearNode = numberOfEnemiesNearNode + 1;

					if (numberOfEnemiesNearNode >= 3) then
						script_gather.messageSent = true;
						script_gather:addNodeToBlacklist(script_gather.nodeObj:GetGUID());
						DEFAULT_CHAT_FRAME:AddMessage("3 or more enemies in range of node - blacklisting "..script_gather.nodeObj:GetUnitName().." "..script_gather.nodeObj:GetDistance().." (yd)");
					return false;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return true;
end
