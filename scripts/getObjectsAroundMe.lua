getObjectsAroundMe = {}

function getObjectsAroundMe:GetObjectsAroundMe()

	local i, t = GetFirstObject();
	if NewWindow("Object Manager", 320, 320) then
		if (CollapsingHeader("All Players In Range")) then
			while i ~= 0 do
				if t == 4 then
					local table = {}
					for o = 0, 1 -1 do
						-- show we can attack horde if we are alliance
						if (i:CanAttack()) and (script_getSpells:areWeAlliance()) then
							Text(i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetLevel().." lvl - Horde");
						end
						-- show we can attack alliance if we are horde
						if (i:CanAttack()) and (not script_getSpells:areWeAlliance()) then
							Text(i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetLevel().." lvl - Alliance");
						end
						-- show we can't attack alliance if we are alliance
						if (not i:CanAttack()) and (script_getSpells:areWeAlliance()) then
							Text(i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetLevel().." lvl - Alliance");
						end
						-- show we can't attack horde if we are horde
						if (not i:CanAttack()) and (not script_getSpells:areWeAlliance()) then
							Text(i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetLevel().." lvl - Horde");
						end
					end
				end
			i, t = GetNextObject(i);
			end
		end
		Separator();
		if (CollapsingHeader("All NPC In Range")) then
			while i ~= 0 do
				if t == 3 then
					if (i:GetClassification() == 4) then
						for oo = 0, 1 -1 do
							Text("RARE ("..i:GetLevel()..") "..i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetCreatureType());
						end
					else
						for oo = 0, 1 -1 do
							Text("("..i:GetLevel()..") "..i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetCreatureType());
						end
					end

				end
			i, t = GetNextObject(i);
			end
		end
		Separator();
		if (CollapsingHeader("All Items In Range")) then
			while i ~= 0 do
				if t ~= 3 and t ~= 4 then
					if (i:GetDistance() <= 300) then
						for ooo = 0, 1 -1 do
							Text(i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetObjectDisplayID().." ID | "..i:GetGUID());
						end
					end
				end
			i, t = GetNextObject(i);
			end
		end
	end
end
	