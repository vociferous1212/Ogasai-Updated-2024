_questDB = {

	currentIndex = -1,
	
	isSetup = false,

	questList = {},
	
	numQuests = 0,
	
	curListQuest = 0,	-- current quest being checked by DB by name
	
	curDesc = nil,	-- current quest being checked by DB by description
	
	minMaxLevel = true,	-- sort quests by level requirements - currently disabled

	-- eastern kingdoms

		-- elwynn
		includeElwynnNorthshire = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Elwynn_Northshire.lua"),
	
		includeElwynnGoldshire = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Elwynn_Goldshire.lua"),

		includeWestfall = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Westfall.lua"),


		-- dun morogh
		includeDunMoroghColdridge = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_DunMorogh_Coldridge.lua"),
	
		includeDunMoroghKharanos = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_DunMorogh_Kharanos.lua"),


		-- duskwood
		includeDuskwood_20_25 = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Duskwood_20_25.lua"),

		includeSearingGorge = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_SearingGorge.lua"),


		-- tirisfal glades
		includeTirisfalDeathknell = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Tirisfal_Deathknell.lua"),
	
		incldueTirisfallBrill = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Tirisfal_Brill.lua"),

		includeSilverpineForest = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_SilverpineForest.lua"),

		includeLochModan = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_LochModan.lua"),
		
		includeSTV = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_StranglethornVale.lua"),

		includeRRMountains = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_RedridgeMountains.lua"),

		includeHillsbrad = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_HillsbradFoothills.lua"),



	-- kalimdor

		-- darkshore
		includeDarkshore = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Darkshore.lua"),


		-- teldrassil
		includeTeldrassShadowglen = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Teldrassil_Shadowglen.lua"),

		includeTeldrassDolanaar = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Teldrassil_Dolanaar.lua"),


		-- durotar
		includeDurotarValleyOfTrials = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Durotar_ValleyOfTrials.lua"),

		includeDurotarRazorHill = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Durotar_RazorHill.lua"),


		-- mulgore
		includeMulgoreCampNarache = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Mulgore_CampNarache.lua"),

		includeMulgoreBloodhoofVillage = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Mulgore_BloodhoofVillage.lua"),

		
		-- barrens
		includeBarrens_10_15 = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Barrens_10_15.lua"),

		includeBarrens_15_20 = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Barrens_15_20.lua"),


		-- stonetalon
		includeStonetalon = include("scripts\\db\\questDB\\Kalimdor\\_questDB_StonetalonMountains.lua"),


		-- desolace
		includeTanaris = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Desolace.lua"),


		-- thousand needles
		includeThousandNeedles = include("scripts\\db\\questDB\\Kalimdor\\_questDB_ThousandNeedles.lua"),


		-- un'goro
		includeUnGoro = include("scripts\\db\\questDB\\Kalimdor\\_questDB_UnGoro.lua"),


		-- tanaris
		includeTanaris = include("scripts\\db\\questDB\\Kalimdor\\_questDB_Tanaris.lua"),


}

function _questDB:setup()

--type quest - 1 = kill | 2 = gather | 0 = already completed | 3 = use item | 4 = use item | 5 = use item | 99 = edge case

--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, desc, rewardNum, useItem, gossipOption)

	if not self.isSetup then

	-- 50-60

		-- un'goro
		_questDB_UnGoro:setup();


	-- 40-50

		-- searing gorge
		_questDB_SearingGorge:setup();


		-- tanaris
		_questDB_Tanaris:setup();


	-- 30-40

		-- desolace
		_questDB_Desolace:setup();


		-- stranglethorn vale
		_questDB_StranglethornVale:setup();


		-- thousand needles
		_questDB_ThousandNeedles:setup();



	-- 25-35

		_questDB_HillsbradFoothills:setup();



	-- 20-30

		-- stonetalon
		_questDB_StonetalonMountains:setup();


		-- duskwood
		_questDB_Duskwood_20_25:setup();



	-- 10-20

		-- redridge
		_questDB_RedridgeMountains:setup();


		-- barrens
		_questDB_Barrens_15_20:setup();
		_questDB_Barrens_10_15:setup();


		-- silverpine
		_questDB_SilverpineForest:setup();
		

		-- westfall
		_questDB_Westfall:setup();


		-- loch modan
		_questDB_LochModan:setup();


		-- darkshore
		_questDB_Darkshore:setup();



	-- 1-10

		-- tirisfal
		_questDB_Tirisfal_Brill:setup()
		_questDB_Tirisfal_Deathknell:setup()

		-- teldrassil
		_questDB_Teldrassil_Dolanaar:setup()
		_questDB_Teldrassil_Shadowglen:setup();
		
		-- elwynn
		_questDB_Elwynn_Goldshire:setup()
		_questDB_Elwynn_Northshire:setup();

		-- dun morogh
		_questDB_DunMorogh_Kharanos:setup();
		_questDB_DunMorogh_Coldridge:setup();

		-- durotar
		_questDB_Durotar_RazorHill:setup();
		_questDB_Durotar_ValleyOfTrials:setup();

		-- mulgore
		_questDB_Mulgore_BloodhoofVillage:setup();
		_questDB_Mulgore_CampNarache:setup();

	end
	self.isSetup = true;

end

function _questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)
	self.questList[self.numQuests] = {};
	self.questList[self.numQuests]['completed'] = completed;
	self.questList[self.numQuests]['faction']= faction;
	self.questList[self.numQuests]['questName'] = questName;
	self.questList[self.numQuests]['giverName'] = giverName;
	self.questList[self.numQuests]['pos'] = {};
	self.questList[self.numQuests]['pos']['x'] = posX;
	self.questList[self.numQuests]['pos']['y'] = posY;
	self.questList[self.numQuests]['pos']['z'] = posZ;
	self.questList[self.numQuests]['mapID'] = mapID;
	self.questList[self.numQuests]['minLevel'] = minLevel;
	self.questList[self.numQuests]['maxLevel'] = maxLevel;
	self.questList[self.numQuests]['grindPos'] = {};
	self.questList[self.numQuests]['grindPos']['grindX'] = grindX;
	self.questList[self.numQuests]['grindPos']['grindY'] = grindY;
	self.questList[self.numQuests]['grindPos']['grindZ'] = grindZ;
	self.questList[self.numQuests]['type'] = type;
	self.questList[self.numQuests]['numKill'] = numKill;
	self.questList[self.numQuests]['numKill2'] = numKill2;
	self.questList[self.numQuests]['numKill3'] = numKill3;
	self.questList[self.numQuests]['numGather'] = numGather;
	self.questList[self.numQuests]['numGather2'] = numGather2;
	self.questList[self.numQuests]['returnPos'] = {};
	self.questList[self.numQuests]['returnPos']['returnX'] = returnX;
	self.questList[self.numQuests]['returnPos']['returnY'] = returnY;
	self.questList[self.numQuests]['returnPos']['returnZ'] = returnZ;
	self.questList[self.numQuests]['returnTarget'] = returnTarget;
	self.questList[self.numQuests]['targetName'] = targetName;
	self.questList[self.numQuests]['targetName2'] = targetName2;
	self.questList[self.numQuests]['targetName3'] = targetName3;
	self.questList[self.numQuests]['gatherID'] = gatherID;
	self.questList[self.numQuests]['gatherID2'] = gatherID2;
	self.questList[self.numQuests]['rewardNum'] = rewardNum;
	self.questList[self.numQuests]['desc'] = desc;
	self.questList[self.numQuests]['useItem'] = useItem;
	self.questList[self.numQuests]['gossipOption'] = gossipOption;
	self.numQuests = self.numQuests + 1;

end

-- this starts the quester
-- everything is checked from the quest start
-- need to run a for loop to check for current quest name in quest log and compare to curlistquest var
function _questDB:getQuestStartPos()

	local x, y, z = 0, 0, 0;

	local myMapID = 0;

	-- get quests based on mapID
	_questDB:getCurrentQuestMapID();

	if _questMenuEX.questToRunByIndex ~= -1 then

		-- quest completed
		if _questDB.questList[_questMenuEX.questToRunByIndex]['completed'] == "nnil" then
			_questMenuEX.questToRunByIndex = _questMenuEX.questToRunByIndex - 1;
		end
		
		i = _questMenuEX.questToRunByIndex;

		_questDB.curListQuest = self.questList[i]['questName'];
		_questDB.curDesc = self.questList[i]['desc'];
		_quest.currentType = _questDB.questList[i]['type'];
		_quest.usingItem = _questDB.questList[i]['useItem'];
		_quest.gossipOption = _questDB.questList[i]['gossipOption'];
		_quest.currentMapID = _questDB.questList[i]['mapID'];

		if self.currentIndex ~= i then
			DEFAULT_CHAT_FRAME:AddMessage(
				"3Quest Started - |cffffa500" ..
						(_questDB.curListQuest or "Unknown") ..
						"|r  (index |cffffff00" .. i .. "|r)"
					)
					end
		
		self.currentIndex = i;
		x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

		return x, y, z;
	end

	if _questMenuEX.questToRunByIndex == -1 then
	for i=0, self.numQuests -1 do

		-- get quest log description
		local questDescription, questObjectives = GetQuestLogQuestText(i);

		-- search quest log
		if GetNumQuestLogEntries() ~= nil and GetNumQuestLogEntries() ~= 0 then
			for u=0, GetNumQuestLogEntries() do

				-- check objectives for each quest log entry
				local questDescription, questObjectives2 = GetQuestLogQuestText(u);

				_questDB.curDesc = questObjectives;

				-- if questDB description == quest log description then set quest parameters
				if self.questList[i]['desc'] == _questDB.curDesc then

					_questDB.curListQuest = self.questList[i]['questName'];
					_quest.currentQuest = self.questList[i]['questName']
					_quest.currentType = _questDB.questList[i]['type'];
					_quest.usingItem = _questDB.questList[i]['useItem'];
					_quest.gossipOption = _questDB.questList[i]['gossipOption'];
					_quest.currentMapID = _questDB.questList[i]['mapID'];

					if self.currentIndex ~= i then
					DEFAULT_CHAT_FRAME:AddMessage(
						"Quest Started - |cffffa500" ..
						(_quest.currentQuest or "Unknown") ..
						"|r  (index |cffffff00" .. i .. "|r)"
					)
					end
					self.currentIndex = i;

					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

					return x, y, z;
				end
			end
		end

		if GetNumQuestLogEntries() == nil or GetNumQuestLogEntries() == 0 then
		-- we don't have a quest in quest log so continue searching DB
		if self.questList[i]['completed'] ~= "nnil" then

			if self.questList[i]['questName'] ~= "nnil" then

				if self.questList[i]['faction'] == GetMyFaction()
					-- believe this was done because of races in different zones? need to check to see how this works without mapID check
				or (self.questList[i]['faction'] == 2 and GetMapID() == self.questList[i]['mapID']) then

					-- don't change map ID if we change zones
					if _quest.currentQuest ~= nil and (GetMapID() == 1537 or GetMapID() == 1519 or GetMapID() == 1657 or GetMapID() == 1637 or GetMapID() == 1638 or GetMapID() == 1497 or GetMapID() ~= _quest.currentMapID) then
						myMapID = _quest.currentMapID;
					else
						myMapID = GetMapID();
					end

					-- questDB mapID == current mapID
					if (self.questList[i]['mapID'] == myMapID) then

						if GetLocalPlayer():GetLevel() >= self.questList[i]['minLevel'] or _questDB.minMaxLevel then

							if GetLocalPlayer():GetLevel() <= self.questList[i]['maxLevel'] or _questDB.minMaxLevel then


								x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];


								-- set our quest to be checked through rest of script
								_questDB.curDesc = self.questList[i]['desc'];
								_questDB.curListQuest = self.questList[i]['questName'];
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
								self.currentIndex = i;


								_questDBGatherGetInventory:getItemsInInventory()

							end
						end
					end
				end
			end
		end
	end 
	end
	end
return x, y, z;
end

function _questDB:getQuestGiverName()

	local name = "";

	local dist = 0;

	local bestDist = 10000;

	if _questMenuEX.questToRunByIndex ~= -1 then

		i = _questMenuEX.questToRunByIndex;
		name = self.questList[i]['giverName'];
	return name;
	end

	-- search database
	for i=0, self.numQuests -1 do

		if self.questList[i]['completed'] == "no" then

			if self.questList[i]['questName'] ~= "nnil" then

				if self.questList[i]['mapID'] == GetMapID() or script_getSpells:cityZones() then

					local dist = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

					if self.questList[i]['questName'] == self.curListQuest then
						
						if self.questList[i]['desc'] == self.curDesc then

							name = self.questList[i]['giverName'];
						end

					end
				end
			end
		end
	end

return name;
end

function _questDB:getQuestName()

	local name = "";

		name = self.curListQuest;

return name;
end

function _questDB:getQuestGrindPos()

	local x, y, z = 0, 0, 0;

	
	if _questMenuEX.questToRunByIndex ~= -1 then

		i = _questMenuEX.questToRunByIndex;

		x, y, z = self.questList[i]['grindPos']['grindX'], self.questList[i]['grindPos']['grindY'], self.questList[i]['grindPos']['grindZ'];
		return x, y, z;
	end

	for i=0, self.numQuests -1 do

		if self.questList[i]['completed'] == "no" then

			if (self.questList[i]['questName'] ~= "nnil") then

				if self.questList[i]['questName'] == _quest.currentQuest then

					if self.questList[i]['desc'] == _quest.currentDesc then

						x, y, z = self.questList[i]['grindPos']['grindX'], self.questList[i]['grindPos']['grindY'], self.questList[i]['grindPos']['grindZ'];

					end
				end
			end
		end
	end

return x, y, z;
end

function _questDB:getReturnTargetPos()

	local x, y, z = 0, 0, 0;
	
	if self.curListQuest ~= nil then

		for i=0, self.numQuests -1 do

			if self.questList[i]['completed'] == "no" then

				if self.questList[i]['questName'] ~= "nnil" then

					if self.questList[i]['questName'] == self.curListQuest then

						if self.questList[i]['desc'] == _quest.currentDesc then

							x, y, z = self.questList[i]['returnPos']['returnX'], self.questList[i]['returnPos']['returnY'], self.questList[i]['returnPos']['returnZ'];


						end
					end
				end
			end
		end
	end

return x, y, z;
end

function _questDB:getReturnTargetName()	

	local x, y, z = 0, 0, 0;
	local name = nil;

	for i=0, self.numQuests -1 do

		if self.questList[i]['completed'] == "no" then

			if self.questList[i]['questName'] ~= "nil" then

				if self.questList[i]['questName'] == self.curListQuest then
				
					if self.questList[i]['desc'] == self.curDesc then

						name = self.questList[i]['returnTarget'];
					end
				end
			end
		end
	end

return name;
end

function _questDB:getCurrentQuestMapID()

	local mapID = nil;

	
	if _questMenuEX.questToRunByIndex ~= -1 then

		i = _questMenuEX.questToRunByIndex;

		mapID = self.questList[i]['mapID'];
	end

	for i=0, self.numQuests -1 do

		local questDescription, questObjectives = GetQuestLogQuestText(i);

		if self.questList[i]['questName'] == _quest.currentQuest then

			if self.questList[i]['desc'] == questObjectives then

				_quest.currentMapID = self.questList[i]['mapID'];

				mapID = self.questList[i]['mapID'];

			end
		end
	end	

return mapID;
end