script_grindMenu = {

	selectedHotspotID = 0,
	targetMenu = include("//scripts//script_targetMenu.lua"),
	mageMenu = include("scripts\\combat\\script_mageEX.lua"),
	warlockMenu = include("scripts\\combat\\script_warlockEX.lua"),
	priestMenu = include("scripts\\combat\\script_priestEX.lua"),
	warriorMenu = include("scripts\\combat\\script_warriorEX.lua"),
	rogueMenu = include("scripts\\combat\\script_rogueEX.lua"),
	paladinMenu = include("scripts\\combat\\script_paladinEX.lua"),
	shamanMenu = include("scripts\\combat\\script_shamanEX.lua"),
	druidMenu = include("scripts\\combat\\script_druidEX.lua"),
	useHotSpotArea = true,
	selectedWalkPath = false,

}

function script_grindMenu:printHotspot()
	DEFAULT_CHAT_FRAME:AddMessage('script_grind: Add this hotspot to your database by adding the following line in the setup-function in hotspotDB.lua:');
	DEFAULT_CHAT_FRAME:AddMessage('You can copy the line from logs//.txt');
	local race, level = UnitRace("player"), GetLocalPlayer():GetLevel();
	local x, y, z = GetLocalPlayer():GetPosition();
	local hx, hy, hz = math.floor(x*100)/100, math.floor(y*100)/100, math.floor(z*100)/100;
	local addString = 'hotspotDB:addHotspot("' .. GetMinimapZoneText() .. ' ' .. level .. ' - ' .. level+2 .. '", "' .. race
					.. '", ' .. level .. ', ' .. level+2 .. ', ' .. hx .. ', ' .. hy .. ', ' .. hz .. ');'	
	DEFAULT_CHAT_FRAME:AddMessage(addString);
	ToFile(addString);
end

function script_grindMenu:menu()

	-- display time above menu and logout timer when paranoid
	local time = (script_grind.currentTime2 - script_paranoia.currentTime) + script_grind.setParanoidTimer;
	if (script_paranoia.paranoiaUsed) then
		Text("Paranoia Logout Timer  -  ");
		SameLine();
		Text(""..time);
		Separator();
	end

	if (not script_grind.pause) then
		if (Button("Pause Bot")) then
			script_grind.pause = true;
		end
	else
		if (Button("Resume Bot")) then
			script_grind.myTime = GetTimeEX();
				script_grind.pause = false;
		end
	end

	SameLine();
	if (Button("Reload Scripts")) then
		coremenu:reload();
	end

	SameLine();
	if (Button("Exit Bot")) then
		StopBot();
	end

	SameLine();
	Text(""..GetTimeStamp());

	local wasClicked = false;
	-- Load combat menu by class
	local class = UnitClass("player");
	if (class == 'Mage') then
		script_mageEX:menu();
	elseif (class == 'Hunter') then
		script_hunterEX:menu();
	elseif (class == 'Warlock') then
		script_warlockEX:menu();
	elseif (class == 'Paladin') then
		script_paladinEX:menu();
	elseif (class == 'Druid') then
		script_druidEX:menu();
	elseif (class == 'Priest') then
		script_priestEX:menu();
	elseif (class == 'Warrior') then
		script_warriorEX:menu();
	elseif (class == 'Rogue') then
		script_rogueEX:menu();
	elseif (class == 'Shaman') then
		script_shamanEX:menu();
	end	
	if (CollapsingHeader("Talents, Paranoia & Misc Options")) then

		--if (GetLocalPlayer():GetLevel() >= 40) then
		--	wasClicked, script_grind.useMount = Checkbox("Use Mount", script_grind.useMount); Text('Dismount range');
		--	script_grind.disMountRange = SliderInt("DR (yd)", 1, 100, script_grind.disMountRange);
		--	Separator();
		--end

		wasClicked, script_grind.autoTalent = Checkbox("Spend Talent Points  ", script_grind.autoTalent);
		SameLine();
		Text("Change Talents In script_talent.lua");
		if (script_grind.autoTalent) then
			Text("Spending Next Talent Point In: " .. (script_talent:getNextTalentName() or " "));
		end
		
		script_paranoia:menu();

		wasClicked, script_grind.adjustTickRate = Checkbox("Adjust Script Speed !!CAUTION!!", script_grind.adjustTickRate);
		if (script_grind.adjustTickRate) then
			Text("Script Tick Rate - How Fast The Scripts Run"); script_grind.tickRate = SliderInt("TR (ms)", 0, 3000, script_grind.tickRate);	
		end

	end

	if (CollapsingHeader("Vendor Options")) then
		wasClicked, script_grind.useVendor = Checkbox("Vendoring On/Off", script_grind.useVendor);
		if (script_hunter.useVendor) then
			script_grind.useVendor = true;
		end
		if (script_grind.useVendor) then 
			script_vendorMenu:menu(); Separator();
		else
			Separator(); Text("If Inventory Is Full - ");
			wasClicked, script_grind.hsWhenFull = Checkbox("Use Hearthstone", script_grind.hsWhenFull); SameLine();
			wasClicked, script_grind.stopWhenFull = Checkbox("Stop The Bot", script_grind.stopWhenFull); SameLine();
			wasClicked, script_grindEX.logoutOnHearthstone = Checkbox("Exit On Hearth", script_grindEX.logoutOnHearthstone); Separator();
		end
	end
	if (CollapsingHeader("Path Options")) then

		local wasClicked = false;

		-- checkbox use auto hotspots
		if (script_grindMenu.useHotSpotArea) then
			Text("Move to area - Click save current location - Click resume bot");
		end
		wasClicked, script_grindMenu.useHotSpotArea = Checkbox("Use Auto Hotspots", script_grindMenu.useHotSpotArea);

		
		
		-- show auto hotspot button
		if (script_grindMenu.useHotSpotArea) then
			if (Button("Save Current Location As Hotspot")) then script_nav:newHotspot(GetMinimapZoneText() .. ' ' .. GetLocalPlayer():GetLevel() .. ' - ' .. GetLocalPlayer():GetLevel()+2);
				script_grind.staticHotSpot = false;
				script_grindMenu:printHotspot(); 
			end

		-- distance from hotspot slider
			Text('Distance To Move From Hotspot');
			script_grind.distToHotSpot = SliderInt("DHS (yd)", 1, 1000, script_grind.distToHotSpot); Separator();
		end

		-- if not use hotspot then show rest of pathing
		if (not script_grindMenu.useHotSpotArea) then

			-- click auto pathing (nav)
			wasClicked, script_grind.autoPath = Checkbox("Auto Pathing (Disable To Use Walk Paths)", script_grind.autoPath);

			--click walk path (no nav)
			wasClicked, script_grindMenu.selectedWalkPath = Checkbox("Use Walk Paths", script_grindMenu.selectedWalkPath);

			-- if auto pathing then show hotspot
			if (script_grind.autoPath) then
				wasClicked, script_grind.staticHotSpot = Checkbox("Auto Load Hotspots From - HotspotDB.lua", script_grind.staticHotSpot);

			-- draw save current location button
			if (Button("Save Current Location To Log File")) then script_nav:newHotspot(GetMinimapZoneText() .. ' ' .. GetLocalPlayer():GetLevel() .. ' - ' .. GetLocalPlayer():GetLevel()+2);
				script_grind.staticHotSpot = false;
				script_grindMenu:printHotspot(); 
			end

				-- select hotspot dropdown menu
				Text("Select A Hotspot From Database:");

				wasClicked, self.selectedHotspotID = 
					ComboBox("", self.selectedHotspotID, unpack(hotspotDB.selectionList));
				SameLine();

				if Button("Load") then script_grind.staticHotSpot = false; script_nav:loadHotspotDB(self.selectedHotspotID+1);
				end
			end

				-- select walk path input text box
				if (script_grindMenu.selectedWalkPath) then
					Separator();

					Text("Current Walk Path"); Text("E.g. paths\\1-5 Durotar.xml"); script_grind.pathName = InputText(' ', script_grind.pathName);
				
					Separator();

			-- set next to node distance for walk paths
			Text('Next Node Distance'); script_grind.nextToNodeDist = SliderFloat("ND (yd)", 1, 10, script_grind.nextToNodeDist);
					Separator();
				end
		
		end
		
		-- checkbox use unstuck script
		wasClicked, script_grind.useUnstuck = Checkbox("Use Unstuck Feature (script_unstuck)", script_grind.useUnstuck);

		wasClicked, script_grind.useUnstuckTwo = Checkbox("Increase Unstuck Sensitivity", script_grind.useUnstuckTwo);

		if (not script_grind.useUnstuckTwo) and (script_grind.useUnstuck) then
			Text("Adjust Unstuck Sensitivity");
			script_unstuck.turnSensitivity = SliderFloat("Sensitivity", .01, 3, script_unstuck.turnSensitivity);
		end

		Separator()
		
		-- ressurect distance
		wasClicked, script_grind.safeRess = Checkbox("Ressurect In Safe Area", script_grind.safeRess);
		Text('Ressurect To Corpse Distance'); script_grind.ressDistance = SliderFloat("RD (yd)", 1, 35, script_grind.ressDistance); Separator();
	end

	script_targetMenu:menu();

	if (CollapsingHeader("Loot Options")) then
		local wasClicked = false;
		wasClicked, script_grind.skipLooting = Checkbox("Skip Looting", script_grind.skipLooting);
		
		SameLine();

		wasClicked, script_grind.skinning = Checkbox("Use Skinning", script_grind.skinning);
		Text('Search For Loot Distance'); script_grind.findLootDistance = SliderFloat("SFL (yd)", 1, 100, script_grind.findLootDistance); Text('Loot Corpse Distance');	 script_grind.lootDistance = SliderFloat("LCD (yd)", 1, 5, script_grind.lootDistance);
	end

	script_gather:menu();
		local wasClicked = false;

	if (CollapsingHeader('Display Options')) then

		local wasClicked = false;

		wasClicked, script_grind.drawEnabled = Checkbox('Display Status Window', script_grind.drawEnabled);

			if (script_grind.drawEnabled) then
				if (CollapsingHeader("|+| Move Status Window")) then
					script_grind.adjustX = SliderInt("adjust X scale", -300, 300, script_grind.adjustX);
					script_grind.adjustY = SliderInt("adjust Y scale", -300, 300, script_grind.adjustY);
				end
			end
		
		if (GetLocalPlayer():GetLevel() < 60) then
		
			wasClicked, script_grind.useExpChecker = Checkbox("Display Exp Tracker", script_grind.useExpChecker);
		end

		wasClicked, script_grind.drawAggro = Checkbox('Display Aggro Range', script_grind.drawAggro);

		if (CollapsingHeader("|+| Draw Radar")) then
		local wasClicked = false;
				script_radar:menu()
		end

		wasClicked, script_grind.drawUnits = Checkbox("Display Unit Info On Screen", script_grind.drawUnits);
		wasClicked, script_grind.drawAutoPath = Checkbox('Display Auto-Path Nodes', script_grind.drawAutoPath);
		wasClicked, script_grind.drawPath = Checkbox('Display Move Path', script_grind.drawPath);
		wasClicked, script_grind.drawGather = Checkbox('Display Gather Nodes', script_grind.drawGather);
	end
end