_questMenu = { 
	
	addSetupFile = include("scripts\\db\\questDB\\_questDBSetup.lua"),
	
	showDBInfo = true,	-- show all quests window
}

function _questMenu:menu()

	local x, y, z = PlayerPosition();
	if _quest.currentQuest ~= nil and not _quest.isQuestComplete and _quest.curGrindX ~= 0 then
		local target = "";
		if _questDBTargets.target ~= nil then
			target = _questDBTargets.target;
		end
		local dist = math.floor(GetDistance3D(x, y, z, _quest.curGrindX, _quest.curGrindY, _quest.curGrindz));
		Text("Current Quest To Complete = ".._quest.currentQuest.. " | "..dist.." (yds) "..target)


	elseif _quest.currentQuest ~= nil and _quest.isQuestComplete and _quest.distToGiver ~= 0 then
		local xx, yy, zz = _questDB:getReturnTargetPos();
		local name = "";
		if _questDB:getReturnTargetName() ~= nil and _questDB:getReturnTargetName() ~= 0 then
			name = _questDB:getReturnTargetName()
		end
		local dist = math.floor(GetDistance3D(x, y, z, xx, yy, zz));
		Text("Current Quest To Complete = ".._quest.currentQuest.. " | "..dist.." (yds) "..name)


	elseif _questDB.curListQuest ~= nil then
		local dist = math.floor(GetDistance3D(x, y, z, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ))
		Text("Current Quest To Obtain = ".._questDB.curListQuest.. " | "..dist.." (yds)");
	end
		
	Separator();

	local wasClicked = false;

	-- show rested exp if we have any
	if GetXPExhaustion() ~= nil and GetLocalPlayer():GetLevel() < 60 then
	
		-- exp bubbles count
		local expBubbles = math.ceil(20 * GetXPExhaustion() / UnitXPMax("player"));

		-- if we have 30 bubbles / max rested exp
		if expBubbles == 30 then

			Text('Rested Exp: MAX - '..expBubbles.. ' bubbles');
		else

			-- show reamining bubbles
			Text('Rested Exp: '..GetXPExhaustion()..' - '..expBubbles.. ' bubbles');
		end
	Separator();
	end


	-- get navmesh load progress
	local navProgress = math.floor(GetLoadNavmeshProgress()*100);

-- only show bot menu when navmesh has completed loading
	if navProgress == 100 then

		-- resume / pause / reload buttons
		if not _quest.grindSpotReached and _quest.weHaveQuest and not _quest.questIsComplete then
			if (Button("Current Spot Is Grind Spot")) then
				_quest.grindSpotReached = true;
				_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = GetLocalPlayer():GetPosition();
			end
		end

		-- pause bot
		if (not _quest.pause) then
			if (Button("Pause Bot")) then
				script_paranoia.currentTime = GetTimeEX() + (45*1000);
				_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
				_quest.pause = true;
				runOgasai.pause = true;
			end
		else
			if (Button("Resume Bot")) then
				script_grind.myTime = GetTimeEX();
				script_paranoia.currentTime = GetTimeEX() + (45*1000);
				_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
				_quest.pause = false;
				runOgasai.pause = false;
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

		-- show exp / hour
		Text("| "..script_expChecker:calculateXPPerHour().." EXP/hour");

		SameLine();

		if Button("Reset EXP") then
			script_expChecker.initialXP = UnitXP("player");
			script_expChecker.startTime = GetTimeEX() / 1000;
			script_expChecker.lastXPPerHour = 0;
			script_expChecker.lastTimeToLevel = "N/A";
			script_expChecker.lastLevel = GetLocalPlayer():GetLevel();
		end

		SameLine();

		Text("Time to level | "..script_expChecker:calculateTimeToLevel());

	else

		ProgressBar("LOADING | ".. navProgress.."%", GetLoadNavmeshProgress());
	end

	SameLine();
	Text(""..GetTimeStamp());

	local _ , class = UnitClass("player");
	if (class == 'MAGE') then
		script_mageEX:menu();
	elseif (class == 'HUNTER') then
		script_hunterMenu:menu();
	elseif (class == 'ROGUE') then
		script_rogueEX:menu();
	elseif (class == 'DRUID') then
		script_druidEX:menu();
	elseif (class == 'WARLOCK') then
		wasClicked, script_grindMenu.useOtherWarlockScript = Checkbox("Use Warlock 2", script_grindMenu.useOtherWarlockScript);
		if (not script_grindMenu.useOtherWarlockScript) then
			script_warlockEX:menu();
		end
	elseif (class == 'PRIEST') then
		script_priestMenu:menu();
	elseif (class == 'WARRIOR') then
		script_warriorEX:menu();
	elseif (class == 'PALADIN') then
		script_paladinMenu:menu();
	elseif (class == 'SHAMAN') then
		script_shamanMenu:menu();
	end
	
	if (CollapsingHeader("Quester")) then

		if Button("Add Quest Info To File... Must Have Target!") then
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(1)
			local questDescription, descr = GetQuestLogQuestText();
			ToFile(""..title.."");
			local x, y, z = GetTarget():GetPosition();
			ToFile(x..", "..y..", "..z);
			ToFile(GetMapID());
			ToFile('"'..GetTarget():GetUnitName()..'"')
			ToFile('"'..descr..'"');
			ToFile(" ________________________________________________ ");
			Text("");
		end
		Separator();



		Text("");
		Text("Auto Complete Quest In DB Timer - ");
		local removeQuestEntryTime = math.floor((_questAcceptQuest.noQuestTimer - GetTimeEX()) / 1000);
		SameLine();
		Text(removeQuestEntryTime.." seconds")
		Separator();



		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(1);
		local questDescription, desc = GetQuestLogQuestText(1);

		if (Button("Mark Current DB Quest As Complete")) then
			if _quest.currentDesc ~= desc then
				_questDBHandleDB:turnQuestCompleted();
			end
			if _quest.currentDesc == desc then
				DEFAULT_CHAT_FRAME:AddMessage("Cannot remove - current quest is in progress - change quest in quest log");
			end
		end

		Separator();

	

		Separator();

		if _quest.currentQuest == _questDB.curListQuest then
			if (Button("Current Spot Is Grind Spot")) then
				_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = GetLocalPlayer():GetPosition();
				_quest.grindSpotReached = true;

			end
		end

		local distToHotspot = 0;
		local x, y, z = PlayerPosition();

		if _quest.curGrindX ~= 0 then
			distToHotspot = math.floor(GetDistance3D(x, y, z, _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ));
		end

		if _quest.grindSpotReached then
			Text("Grind Spot Reached! | "..distToHotspot.." (yds)");
		elseif not _quest.grindSpotReached then
			Text("Grind Spot NOT Reached! | "..distToHotspot.." (yds)");
		end

		Separator();

		Text("Distance To Travel From Grindspot");
		_quest.distToGrindFromHotspot = SliderInt("Distance From Grindspot", 50, 600, _quest.distToGrindFromHotspot);
		
	
		Separator();

		


		if _quest.currentQuest ~= nil then
			Text("Current quester quest to run");
			Text("_quest.currentQuest - ".._quest.currentQuest);
		else
			Text("Current quester quest to run");
			Text("_quest.currentQuest - NIL");
		end

		if _quest.currentDesc ~= nil then
			Text("_quest.currentDesc - ".._quest.currentDesc);
		else
			Text("_quest.currentDesc - NIL");
		end

		Text("");

		Text("Current questDB quest being checked");
		if _questDB.curListQuest ~= nil then
			Text("_questDB.curListQuest - ".._questDB.curListQuest);
			if _questDB.curDesc ~= nil then
				Text("_questDB.curDesc - ".._questDB.curDesc);
			else
				Text("_questDB.curDesc - NIL");
			end
		end

		Text("");

		if _quest.isQuestComplete then
			Text("_quest.isQuestComplete - true");
		else
			Text("_quest.isQuestComplete - false");
		end	
	
	end
			

	--script_targetMenu:menu();

	if not _quest.usingQuester then
		script_miscMenu:menu();
	end

	script_lootMenu:menu();
	
	script_gatherMenu:menu();

	if CollapsingHeader("Vendor Options") then
		script_vendorMenu:menu();
	end

	if not runOgasai.usingRunOgasai then
		script_displayOptionsMenu:menu();
	else
		grind2DrawDataMenu:run()
	end

	if (CollapsingHeader("Trainers and Flight Path Options")) then
		wasClicked, script_grind.getSpells = Checkbox("Get Class Spells (level 22 and under)", script_grind.getSpells);
		wasClicked, script_grind.useFPS = Checkbox("Use Flight Paths (level 20 areas and under)", script_grind.useFPS);
		
	end

	if (script_grindMenu.debugMenu) then
		script_debugMenu:menu();
	end

	script_counterMenu:menu();

	_questMenuEX:menu();
end