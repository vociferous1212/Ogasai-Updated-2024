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

	if Button("Add To File...") then
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(1)
		local questDescription, descr = GetQuestLogQuestText();
		ToFile(""..title.."");
		local x, y, z = GetLocalPlayer():GetPosition();
		ToFile(x..", "..y..", "..z);
		ToFile(GetMapID());
		ToFile(GetTarget():GetUnitName())
		ToFile(""..descr.."");
		ToFile(" ________________________________________________ ");
		Text("");
	end

local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(1);
local questDescription, desc = GetQuestLogQuestText(1);

local giverName = "";
local qx, qy, qz = 0, 0, 0;
local reward = 0;
if (Button("Get Info 1")) then
	
	giverName = GetTarget():GetUnitName();
	qx, qy, qz = GetTarget():GetPosition();
	reward = GetNumQuestLogRewards();
end
local gx, gy, gz = 0, 0, 0;
local atarget = 0;
SameLine();
Text("Target quest giver and have quest in quest log");

if (Button("Get Info 2")) then
gx, gy, gz = GetLocalPlayer():GetPosition();
if GetTarget() ~= nil and GetTarget() ~= 0 then
	atarget = GetTarget():GetUnitName();
end
end
SameLine();
Text("Go to grind spot and target something to kill if applicable");

if Button("Add To Log File") then
ToFile('_questDB:addQuest("no, 1, "'..title..'", "'..giverName..'", '..qx..', '..qy..', '..qz..', '..GetMapID()..', MINLEVEL, MAXLEVEL, '..gx..', '..gy..', '..gz..', TYPE, NUMKILL, NUMKILL, NUMKILL, GATHERNUM, GATHERNUM, RETURNX, RETURNY, RETURNZ, RETURNTARGET, "'..atarget..'", KILLTARGET, KILLTARGET, GATHERID, GATHERID, '..reward..', "'..desc..'", 0, GOSSIPOPTION);');
end
SameLine();
Text("Add data from these 2 buttons to log file");

Text("");

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
		Text("Prioritize other targets when kill num reached");
		Text("Target Name - ".._questDBTargets.target.."");
		_quest.targetKilledNum = SliderInt("Already Killed Num", 0, 20, _quest.targetKilledNum);
		Text("Target Name2 - ".._questDBTargets.target2.."");
		_quest.targetKilledNum2 = SliderInt("Already Killed Num2", 0, 20, _quest.targetKilledNum2);
		Text("Target Name3 - ".._questDBTargets.target3.."");
		_quest.targetKilledNum3 = SliderInt("Already Killed Num3", 0, 20, _quest.targetKilledNum3);
	end

	if (CollapsingHeader(">>> |+| Quest Gather Options")) then
		Text("Options:");
		Text("ID of item to gather for current quest - ".._questDBGather.gatherTarget);
		_quest.gatheredNum = SliderInt("Already Gathered Num", 0, 10, _quest.gatheredNum);
		Text("ID of item2 to gather for current quest - ".._questDBGather.gatherTarget);
		_quest.gatheredNum2 = SliderInt("Already Gathered Num2", 0, 10, _quest.gatheredNum2);
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