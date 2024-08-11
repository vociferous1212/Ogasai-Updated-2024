script_grindMenu = {

	selectedHotspotID = 0,
	showIDD = false,
	debugMenu = false,
	useHotSpotArea = true,
	selectedWalkPath = false,
	helpMenu = false,
	showGarbageBox = true,
	isSetup = false,

}

function script_grindMenu:setup()

	if (not self.isSetup) then
		script_shaman:setup();
		script_druid:setup();
		script_mage:setup();
		script_warlock:setup();
		script_priest:setup();
		script_paladin:setup();
		script_warrior:setup();
		script_rogue:setup();
	end

	self.isSetup = true;
end

function script_grindMenu:printHotspot()
	if (script_grind.autoSelectVendors) then
		DEFAULT_CHAT_FRAME:AddMessage("Closest vendors loaded from vendorDB.");
	end
	DEFAULT_CHAT_FRAME:AddMessage('Add hotspot to database by copy/paste the following line in hotspotDB. Added line to log files.');
	local race, level = UnitRace("player"), GetLocalPlayer():GetLevel();
	local x, y, z = GetLocalPlayer():GetPosition();
	local hx, hy, hz = math.floor(x*100)/100, math.floor(y*100)/100, math.floor(z*100)/100;
	local addString = 'hotspotDB:addHotspot("' .. GetMinimapZoneText() .. ' ' .. level .. ' - ' .. level+2 .. '", "' .. race
					.. '", ' .. level .. ', ' .. level+2 .. ', ' .. hx .. ', ' .. hy .. ', ' .. hz .. ');'	
	DEFAULT_CHAT_FRAME:AddMessage(addString);
	ToFile(addString);
end

function script_grindMenu:menu()

	-- display paranoia logout time above menu
	local time = math.floor((script_grind.currentTime2 - script_paranoia.currentTime) + script_grind.setParanoidTimer);
	if (script_paranoia.paranoiaUsed) then
		Text("Paranoia Logout Timer  -  ");
		SameLine();
		Text(""..time);
		Separator();
	end

	--garbage collection info
	local a = gcinfo();
	if (self.showGarbageBox) then
		Text("Garbage Data Lost " ..a);
		if (self.showGarbageBox) then
			SameLine();
			Text(" - Can Cause Lag!");
		end
	end
	wasClicked, self.showGarbageBox = Checkbox("Force Garbage Collect", self.showGarbageBox);
	if (self.showGarbageBox) then
		SameLine();
		Text(" - Includes AddOns!");
	end
		--show help menu checkbox
		--SameLine();
		--Text("  ");
		--SameLine();
		--wasClicked, script_grindMenu.helpMenu = Checkbox("Help Menu", script_grindMenu.helpMenu);

	--OM timer...
	--local qwq = (script_grind.omTimer - GetTimeEX()) / 1000;
	--Text(math.floor(qwq));

	--nav mesh progress
	local qqq = math.floor(GetLoadNavmeshProgress()*100);
	if (qqq ~= 100) then
	Text("Navmesh Loading Progress... " ..qqq);
	end

	-- rested exp
	if (GetXPExhaustion() ~= nil) and (not script_paranoia.paranoiaUsed) then
		if (math.ceil(20*GetXPExhaustion()/UnitXPMax("player")) == 30) then
			Text('Rested Exp: MAX RESTED - '..math.ceil(20*GetXPExhaustion()/UnitXPMax("player")).. ' bubbles');
		else
	Text('Rested Exp: '..GetXPExhaustion()..' - '..math.ceil(20*GetXPExhaustion()/UnitXPMax("player")).. ' bubbles');
		end
	end

	-- only show bot menu when navmesh has completed loading
	if (qqq == 100) then
	if (not script_grind.pause) then
		if (Button("Pause Bot")) then
			script_paranoia.currentTime = GetTimeEX() + (45*1000);
			script_grind.pause = true;
		end
	else
		if (Button("Resume Bot")) then
			script_grind.myTime = GetTimeEX();
			script_paranoia.currentTime = GetTimeEX() + (45*1000);
			script_grind.pause = false;
		end
	end

	SameLine();
	if (Button("Reload Scripts")) then
		coremenu:reload();
		self.isSetup = false;
	end

	SameLine();
	if (Button("Exit Bot")) then
		StopBot();
	end

	SameLine();
	Text(""..GetTimeStamp());

	if (script_grindMenu.helpMenu) then
		Text("HELP *press tab key to change settings on this screen");
		Text("	 click back on WoW screen to regain focus");
		Text("	 helpful info is listed about each control available below*");
		Separator();
	end
	
	local wasClicked = false;
	-- Load combat menu by class

	script_grindMenu:setup()

	local class = UnitClass("player");
	if (class == 'Mage') then
		script_mageEX:menu();
	elseif (class == 'Hunter') then
		script_hunterEX:menu();
	elseif (class == 'Rogue') then
		script_rogueEX:menu();
	elseif (class == 'Druid') then
		script_druidEX:menu();
	elseif (class == 'Warlock') then
		script_warlockEX:menu();
	elseif (class == 'Priest') then
		script_priestEX:menu();
	elseif (class == 'Warrior') then
		script_warriorEX:menu();
	elseif (class == 'Paladin') then
		script_paladinEX:menu();
	elseif (class == 'Shaman') then
		script_shamanEX:menu();
	end	

	script_miscMenu:menu();

	script_targetMenu:menu();

	script_lootMenu:menu();
	
	script_gatherMenu:menu();

	script_displayOptionsMenu:menu();

	script_grindPartyMenu:menu();

	if (script_grindMenu.debugMenu) then
		script_debugMenu:menu();
	end

	script_counterMenu:menu();

	wasClicked, script_grind.drawChests = Checkbox("Draw Chests", script_grind.drawChests);
	if (script_grindMenu.helpMenu) then
		Text("HELP *Show chests and lootable boxes on screen");
	end

	wasClicked, script_gatherEX.drawFishingPools = Checkbox("Draw Fishing Pools", script_gatherEX.drawFishingPools);


	if (script_grind.getSpells) then
		Separator();
	end
	wasClicked, script_grind.getSpells = Checkbox("Get Class Spells", script_grind.getSpells);
	if (script_grind.getSpells) then
		Text("More or less a proof of concept...");
		Text("Why let bot run all the way to a trainer?");
		Separator();
	end
	
end
end