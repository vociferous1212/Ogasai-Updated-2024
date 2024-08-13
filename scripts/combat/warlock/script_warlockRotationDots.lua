script_warlockRotationDots = {
	
	waitTimer = 0,

}

function script_warlockRotationDots:assignTarget()

	i, t = GetFirstObject();
	local bestDist = 30;
	local bestTarget = nil;
		while i ~= 0 do
			if t == 3 or t == 4 then
				if (i:GetDistance() <= 29) and (i:IsInLineOfSight()) and (i:CanAttack()) and (not i:IsDead()) then
					if (not script_warlockFunctions:targetHasImmolate(i)) or (not script_warlockFunctions:targetHasCurseOfAgony(i)) or (not script_warlockFunctions:targetHasCorruption(i)) then
						local dist = i:GetDistance();
						if (dist < 30 and bestDist > dist) then
							bestDist = dist;
							bestTarget = i;
						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
return bestTarget;
end

function script_warlockRotationDots:forFun(target)

	target = script_warlockRotationDots:assignTarget();
	if target ~= 0 and target ~= nil and (not script_warlockFunctions:targetHasImmolate(target)) or (not script_warlockFunctions:targetHasCurseOfAgony(target)) or (not script_warlockFunctions:targetHasCorruption(target)) then
					
						if (self.waitTimer > GetTimeEX()) then
							return false;
						end
						if (script_warlockDOTS:corruption()) then
							self.waitTimer = GetTimeEX() + 200;
							return true;
						elseif (script_warlockDOTS:curseOfAgony()) then
							self.waitTimer = GetTimeEX() + 200;
							return true;
						elseif (target:FaceTarget()) and (script_warlockDOTS:immolate()) then
								self.waitTimer = GetTimeEX() + 200;
								return true;
						end
						
		end
return false;
end