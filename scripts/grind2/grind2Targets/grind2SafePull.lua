grind2SafePull = {

	safePullLevel = 5,	-- safe to pull targets 5 levels below player in groups

	skipSafePull = false,

}


--[[


	check for safe pull to pass through object manager in IsTargetValid


]]


function grind2SafePull:targetHasAdds(target)
	local localObj = GetLocalPlayer();
	local countUnitsInRange = 0;
	local i, t = GetFirstObject();
	local aggro = 0;
	local cx, cy, cz = 0, 0, 0;
	local tx, ty, tz = target:GetPosition();

	-- run object manager
	while i ~= 0 do
	
		-- NPC type 3
 		if (t == 3)  then

			-- target aggro based on level -- 16.5
			aggro = i:GetLevel() - localObj:GetLevel() + 14.5;

			-- acceptable targets
			if (i:CanAttack()) and (not i:IsDead()) and (not i:IsCritter()) and (i:GetGUID() ~= GetLocalPlayer():GetGUID()) and (i:GetLevel() >= GetLocalPlayer():GetLevel() - self.safePullLevel) and (not i:IsCasting()) then

				-- i position
				cx, cy, cz = i:GetPosition();

				-- acceptable range
				if (GetDistance3D(tx, ty, tz, cx, cy, cz) <= aggro) then	

					-- accpetable targets in range
					countUnitsInRange = countUnitsInRange + 1;
				end
 			end
 		end

		-- get next target
 		i, t = GetNextObject(i);
 	end

	-- avoid pull if more than 1 add
	if (countUnitsInRange > 1) then
		return true;
	end

return false;
end
