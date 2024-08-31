_questMenu = { addSetupFile = include("scripts\\db\\_questDBSetup.lua");
}

-- menu items to draw in window() function
function _questMenu:menu()

	local wasClicked = false;
	
	Text("You may have to run grinder once to load mmaps...");

	if (not _quest.pause) then
		if (Button("Pause Bot")) then
			script_paranoia.currentTime = GetTimeEX() + (45*1000);
			_quest.pause = true;
		end
	else
		if (Button("Resume Bot")) then
			script_grind.myTime = GetTimeEX();
			script_paranoia.currentTime = GetTimeEX() + (45*1000);
			_quest.pause = false;
		end
	end

	SameLine();
	if (Button("Reload Scripts")) then
		if (coremenu:reload()) then
			coremenu:reload();
			_quest.isSetup = false;
		end
	end

	SameLine();
	if (Button("Exit Bot")) then
		StopBot();
	end

	SameLine();
	Text(""..GetTimeStamp());

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
		wasClicked, script_grindMenu.useOtherWarlockScript = Checkbox("Use Warlock 2", script_grindMenu.useOtherWarlockScript);
		if (not script_grindMenu.useOtherWarlockScript) then
			script_warlockEX:menu();
		elseif (script_grindMenu.useOtherWarlockScript) then
			script_warlock2:menu();
		end
	elseif (class == 'Priest') then
		script_priestMenu:menu();
	elseif (class == 'Warrior') then
		script_warriorEX:menu();
	elseif (class == 'Paladin') then
		script_paladinEX:menu();
	elseif (class == 'Shaman') then
		script_shamanEX:menu();
	end
	
--[[faction, quest name, quest giver name, quest giver pos, mapID, minLevel, maxLevel, grind pos, type, kill number, gather number, return pos, return target name, kill target 1, kill target 2, gather target 1, gather target 2, is completed ]]--


	if (CollapsingHeader("Quest Options")) then
		Text("Options:"); SameLine(); Text("Gather DB Stuff");
		Text("");
		Text("you might have to push it a few times... bug...");
		if (Button("Mark Current Quest As Complete")) then
			_questDB:turnQuestCompleted()	
		end

		_questDBSetup:menu();

		if (Button("Add To DB")) then
			--ToFile(
			--db:add(
		end
		
				
	end
	if (CollapsingHeader("Quest Kill Options")) then
		Text("Options:");
		Text("Number of targets kill for current quest - ".._quest.targetKilledNum.."");
	end
	if (CollapsingHeader("Quest Gather Options")) then
		Text("Options:");
	Text("Number of items gathered for current quest - ");

	end
	if (CollapsingHeader("Quest Debug Data")) then
		Text("".._quest.currentDebugStatus.."");
	end

	script_miscMenu:menu();

	script_lootMenu:menu();
	
	script_gatherMenu:menu();

	script_displayOptionsMenu:menu();

	if (CollapsingHeader("Trainers and Flight Path Options")) then
		wasClicked, script_grind.getSpells = Checkbox("Get Class Spells (level 22 and under)", script_grind.getSpells);
		wasClicked, script_grind.useFPS = Checkbox("Use Flight Paths (level 20 areas and under)", script_grind.useFPS);
		
	end

	if (script_grindMenu.debugMenu) then
		script_debugMenu:menu();
	end

	script_counterMenu:menu();
end