script_debugMenu = {

}

function script_debugMenu:menu()

	-- show debug menu
	if (CollapsingHeader("Debug Info")) then

		-- debug info

		-- tickrate
		Text("Script Tick Rate - " ..script_grind.tickRate);

		-- are we indoors?
		if (IsIndoors()) then
			
			-- true we are indoors
			local a = "true";
			Text("IsIndoors() - " ..a);
	
		else

			-- false we are indoors
			local a = "false";
			Text("IsIndoors() - " ..a);
		end

		-- target has ranged weapon?
		if (GetLocalPlayer():GetUnitsTarget() ~= 0) then
			if (GetLocalPlayer():GetUnitsTarget():HasRangedWeapon()) then

				-- true target has weapon
				local b = "true";
				Text("target:HasRangedWeapon() - " ..b);
			else
			
				-- false target has weapon
				local b = "false";
				Text("target:HasRangedWeapon() - " ..b);
			end
		
			-- true target is casting
			if (GetLocalPlayer():GetUnitsTarget():IsCasting()) then

				-- true target is casting
				local c = "true";
				Text("target:IsCasting() - " ..c);
			else

				-- false target is casting
				local c = "false";
				Text("target:IsCasting() - " ..c);
			end
		else

			-- show the text is casting or has ranged weapon
			Text("target:HasRangedWeapon() - No Target!");
			Text("target:IsCasting() - No Target!");
		end

		-- get target classification
		if (GetTarget() ~= 0) then
			local targetClass = GetTarget():GetClassification();
			Text("target:GetClassification() - " ..targetClass.. "");
		else
			Text("target:GetClassification() - No Target!");
		end

		-- show grinder enemy object name and distance
		if (script_grind.enemyObj ~= 0) and (script_grind.enemyObj ~= nil) then

			-- grinder object
			local d = script_grind.enemyObj:GetUnitName();

			-- grinder object distance
			local ee = script_grind.enemyObj;
			local e = math.floor(ee:GetDistance());

			-- show distance
			Text("Grinder enemyObj - " ..d.. " " ..e.. " (yds)");
			
		else

			-- else show no target text
			Text("Grinder enemyObj - No Target!");
		end

		if (GetTarget() ~= 0 and GetTarget() ~= nil) then
			local za = GetTarget():GetCasting();
			Text("GetCasting() - "..za);
		else
			Text("GetCasting() - No Target!");
		end
			-- show vendor status
			local f = script_vendor.status;
			Text("Vendor status - " ..f);

			-- show blacklist time/new target time out of combat
			local gg = script_grind.newTargetTime;
			local g = (GetTimeEX()-gg)/1000;
			Text("Blacklist time : " ..g.. " sec");

			Separator();
			Text("Blacklist Loot Time : " ..(script_grind.blacklistLootTime/1000).. " sec");
			Text("Time Left : " ..((script_grind.blacklistLootTime - script_grind.blacklistLootTimeCheck)/1000).. " sec");
			-- separator for next menu - counter menu
		Separator();
	end
end