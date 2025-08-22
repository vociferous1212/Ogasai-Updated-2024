getObjectsAroundMe = {}

function getObjectsAroundMe:GetObjectsAroundMe()

	-- open a new window
	if NewWindow("Object Manager", 320, 320) then

		-- run first object
		local i, t = GetFirstObject();


	-- table won't work so show individual tabs to limit the object manager running and lag

		-- show tab for players in range
		if (CollapsingHeader("All Players In Range")) then
			
			while i ~= 0 do

				-- type 4 == player
				if t == 4 then

					-- table won't work....
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

		-- show tab for all npcs
		if (CollapsingHeader("All NPC In Range")) then

			while i ~= 0 do

				-- type 3 == npcs
				if t == 3 then

					-- show rares
					if (i:GetClassification() == 4) then

						for oo = 0, 1 -1 do

							-- show rare not killed
							if not i:IsDead() then
								Text("RARE ("..i:GetLevel()..") "..i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetCreatureType());

							-- show rare if killed
							elseif i:IsDead() then
								Text("RARE DEAD ("..i:GetLevel()..") "..i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetCreatureType());
							end

						end

					-- show targets if not already killed
					elseif not i:IsDead() then

						for oo = 0, 1 -1 do
						Text("("..i:GetLevel()..") "..i:GetUnitName()..", "..math.floor(i:GetDistance()).."(yd), "..i:GetCreatureType());
						end
					end

				end
			i, t = GetNextObject(i);
			end
		end

		Separator();

		-- show tab for all items
		if (CollapsingHeader("All Items In Range")) then

			while i ~= 0 do
		
				-- items can vary by type but most are 3 or 4...
				if t ~= 3 and t ~= 4 then

					-- limit the distance we can find items across the world
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
	