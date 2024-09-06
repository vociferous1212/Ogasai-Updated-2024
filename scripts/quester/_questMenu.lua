_questMenu = { 
	
	addSetupFile = include("scripts\\db\\questDB\\_questDBSetup.lua");
}

function _questMenu:menu()

	local wasClicked = false;

	Text("Reaction Speed - need for testing | 3 = 3 seconds");
	_quest.tickRate = SliderFloat("Tick Rate", 0, 3.5, _quest.tickRate);
	
	--nav mesh progress
	local qqq = math.floor(GetLoadNavmeshProgress()*100);
	if (qqq ~= 100) then
	Text("Navmesh Loading Progress... " ..qqq);
	end


	-- pause bot
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

	local _ , class = UnitClass("player");
	if (class == 'MAGE') then
		script_mageEX:menu();
	elseif (class == 'HUNTER') then
		script_hunterEX:menu();
	elseif (class == 'ROGUE') then
		script_rogueEX:menu();
	elseif (class == 'DRUID') then
		script_druidEX:menu();
	elseif (class == 'WARLOCK') then
		wasClicked, script_grindMenu.useOtherWarlockScript = Checkbox("Use Warlock 2", script_grindMenu.useOtherWarlockScript);
		if (not script_grindMenu.useOtherWarlockScript) then
			script_warlockEX:menu();
		elseif (script_grindMenu.useOtherWarlockScript) then
			script_warlock2:menu();
		end
	elseif (class == 'PRIEST') then
		script_priestMenu:menu();
	elseif (class == 'WARRIOR') then
		script_warriorEX:menu();
	elseif (class == 'PALADIN') then
		script_paladinEX:menu();
	elseif (class == 'SHAMAN') then
		script_shamanEX:menu();
	end
	
	if (CollapsingHeader("Quester")) then
	if (CollapsingHeader(">>> |+| Quest Options")) then

		Text("Options:"); SameLine(); Text("Gather DB Stuff");

		Text("");

		if Button("Add Current Target Info To Log File") then
			ToFile("Quest Giver");
			local x, y, z = GetTarget():GetPosition();
			ToFile(x..", "..y..", "..z);
			ToFile(GetTarget():GetUnitName());
			ToFile("Map ID - "..GetMapID());
			ToFile("Quest Objectives - "..GetObjectiveText(1));
			ToFile("");
		end
		SameLine();
		if Button("Add Current Location To Log File") then
			ToFile("Grind/return Location");
			local x, y, z = GetLocalPlayer():GetPosition();
			ToFile(x..", "..y..", "..z);
			ToFile("");
		end

		-- quest auto complete button
		wasClicked, _quest.autoComplete = Checkbox("Auto Complete Quests In Order", _quest.autoComplete);
		Text("Until bot reaches current quest in quest log");
		Text("YOU MUST HAVE A QUEST IN QUEST LOG");

		-- grind spot reached
		Separator();
		if (Button("Current Spot Is Grind Spot")) then
			_quest.grindSpotReached = true;
			_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = GetLocalPlayer():GetPosition();
		end
		if _quest.grindSpotReached then
			Text("Grind Spot Reached!");
		elseif not _quest.grindSpotReached then
			Text("Grind Spot NOT Reached!");
		end
		Separator();
		Text("Distance To Travel From Grindspot");
		_quest.distToGrindFromHotspot = SliderInt("Distance From Grindspot", 50, 600, _quest.distToGrindFromHotspot);
		
	
		Separator();

		if (Button("Mark Current DB Quest As Complete")) then
			_questDB:turnQuestCompleted();
		end
		Text("You cannot mark your current quest in quest log as complete...");
		Text("");			
	end

	if (CollapsingHeader(">>> |+| Quest Kill Options")) then
		Text("Options:");
		Text("Target Name - ".._questDBTargets.target.."");
		Text("Number of targets killed for current quest - ".._quest.targetKilledNum.."");
		Text("Target Name2 - ".._questDBTargets.target2.."");
		Text("Number of targets2 killed for current quest - ".._quest.targetKilledNum2.."");
		Text("Target Name3 - ".._questDBTargets.target3.."");
		Text("Number of targets3 killed for current quest - ".._quest.targetKilledNum3.."");
	end

	if (CollapsingHeader(">>> |+| Quest Gather Options")) then
		Text("Options:");
		Text("Number of items needed to gather for current quest - ".._quest.gatheredNum.."");
		Text("ID of item to gather for current quest - ".._questDBGather.gatherTarget);
		Text("Number of items2 needed to gather for current quest - ".._quest.gatheredNum2.."");
		Text("ID of item2 to gather for current quest - ".._questDBGather.gatherTarget);
	end

	if (CollapsingHeader(">>> |+| DB info")) then
		_questDBSetup:menu();
	end
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