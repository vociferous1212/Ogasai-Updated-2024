script_gatherEX2 = {waitTimer = 0,}


-- if there is a mob within gathering distance based on aggro range then
function script_gatherEX2:checkForTargetsOnGatherRoute()

	if (self.waitTimer > GetTimeEX()) then
		return false;
	end
	if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) and (not script_gather:isNodeBlacklisted(script_gather.nodeGUID)) then

		i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if (i:GetDistance() <= 40) and (not i:IsDead()) and (not i:IsCritter()) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) and (i:IsInLineOfSight()) then
					local node = script_gather.nodeObj;
					local iX, iY, iZ = i:GetPosition();	
					local lX, lY, lZ = GetLocalPlayer():GetPosition();
					local nX, nY, nZ = script_gather.nodeObj:GetPosition();
					local targetToNode = GetDistance3D(iX, iY, iZ, nX, nY, nZ);
					local meToTarget = GetDistance3D(lX, lY, lZ, iX, iY, iZ);
					local meToNode = GetDistance3D(lX, lY, lZ, nX, nY, nZ);
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