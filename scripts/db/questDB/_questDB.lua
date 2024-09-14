_questDB = { isSetup = false, questList = {}, numQuests = 0, curListQuest = 0, curDesc = nil,

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

		-- tirisfal glades
		includeTirisfalDeathknell = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Tirisfal_Deathknell.lua"),
	
		incldueTirisfallBrill = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_Tirisfal_Brill.lua"),

		includeSilverpineForest = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_SilverpineForest.lua"),

		includeLochModan = include("scripts\\db\\questDB\\EasternKingdoms\\_questDB_LochModan.lua"),




	-- kalimdor

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


		
}

function _questDB:setup()

--type quest - 1 = kill | 2 = gather | 0 = already completed | 3 = use item | 4 = use item | 5 = use item | 99 = edge case

--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, desc, rewardNum, useItem, gossipOption)


	-- 10-20

		-- duskwood
		_questDB_Duskwood_20_25:setup();

		-- barrens
		_questDB_Barrens_15_20:setup();
		_questDB_Barrens_10_15:setup();

		_questDB_SilverpineForest:setup();
		
		_questDB_Westfall:setup();

		_questDB_LochModan:setup();

		_questDB_Darkshore:setup();



	-- 1-10

		-- tirisfal glades
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

function _questDB:getQuestStartPos()

	local x, y, z = 0, 0, 0;
	local myMapID = 0;

	_questDB:getCurrentQuestMapID();

	for i=0, self.numQuests -1 do

		if self.questList[i]['completed'] ~= "nnil" then

			if self.questList[i]['questName'] ~= "nnil" then

				if self.questList[i]['faction'] == GetMyFaction() then

					if _quest.currentQuest ~= nil and (GetMapID() == 1537 or GetMapID() == 1519 or GetMapID() == 1657 or GetMapID() == 1637 or GetMapID() == 1638 or GetMapID() == 1497 or GetMapID() ~= _quest.currentMapID) then
						myMapID = _quest.currentMapID;
					else
						myMapID = GetMapID();
					end

					if (self.questList[i]['mapID'] == myMapID) then

					if GetLocalPlayer():GetLevel() >= self.questList[i]['minLevel'] then

						if GetLocalPlayer():GetLevel() <= self.questList[i]['maxLevel'] then

							x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

							-- set our quest to be checked through rest of script
							_questDB.curDesc = self.questList[i]['desc'];
							_questDB.curListQuest = self.questList[i]['questName'];
							_quest.currentType = _questDB.questList[i]['type'];
							_quest.usingItem = _questDB.questList[i]['useItem'];
							_quest.gossipOption = _questDB.questList[i]['gossipOption'];
							_quest.currentMapID = _questDB.questList[i]['mapID'];


						end end end end end end end 
return x, y, z;
end

function _questDB:getQuestGiverName()

	local name = "";
	local dist = 0;
	local bestDist = 10000;

	for i=0, self.numQuests -1 do

		if self.questList[i]['completed'] == "no" then

			if self.questList[i]['questName'] ~= "nnil" then

				if self.questList[i]['mapID'] == GetMapID() or script_getSpells:cityZones() then

					local dist = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];
					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

					if self.questList[i]['questName'] == self.curListQuest then

						name = self.questList[i]['giverName'];

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
	
	local questDescription, questObjectives = GetQuestLogQuestText(1);

	for i=0, self.numQuests -1 do
		if self.questList[i]['questName'] == _quest.currentQuest then
			if self.questList[i]['desc'] == questObjectives then
				_quest.currentMapID = self.questList[i]['mapID'];
			end
		end
	end	
end