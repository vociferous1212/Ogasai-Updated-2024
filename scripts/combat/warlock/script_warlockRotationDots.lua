script_warlockRotationDots = {}

function script_warlockRotationDots:forFun()

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 or t == 4 then
				if (i:GetDistance() <= 29) and (i:IsInLineOfSight()) then
					if (not script_warlockFunctions:targetHasImmolate(i)) or (not script_warlockFunctions:targetHasCurseOfAgony(i)) or (not script_warlockFunctions:targetHasCorruption(i)) then
					
						if (script_warlockDOTS:corruption()) then
							self.waitTimer = GetTimeEX() + 1000;
							script_warlock.waitTimer = GetTimeEX() + 1500;
							return true;
						end
						if (script_warlockDOTS:curseOfAgony()) then
							self.waitTimer = GetTimeEX() + 1000;
							script_warlock.waitTimer = GetTimeEX() + 1500;
							return true;
						end
						if (script_warlockDOTS:immolate()) then
							self.waitTimer = GetTimeEX() + 1000;
							script_warlock.waitTimer = GetTimeEX() + 1500;
							return true;
						end
						ClearTarget();
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end