_questAcceptQuest = {

	noQuestTimer = GetTimeEX(),

	returnQuestToGameObjectTarget = nil,
}

function _questAcceptQuest:run()

	-- reset timer to auto remove quests from database
	if IsMoving() or not PlayerHasTarget() or _quest.curQuestGiver == nil then
		self.noQuestTimer = GetTimeEX() + 15000;
	end

	-- remove quest from database if timer is reached
	if _quest.curQuestGiver ~= nil and PlayerLevel() > 1 then
		if PlayerHasTarget() then
			if GetTarget():GetUnitName() == _quest.curQuestGiver then
				local title = nil;
				for a = 0, GetNumQuestLogEntries() do
					title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
				end
				if title ~= _questDB.curListQuest then
					if GetTimeEX() >= self.noQuestTimer then
						DEFAULT_CHAT_FRAME:AddMessage("Timer ran out - Removing quest entry");
						_questDBHandleDB:turnQuestCompleted();
						self.noQuestTimer = GetTimeEX() + 15000;
					end
				end
			end
		end
	end

	local questIsInQuestLog = false;
	for a = 0, GetNumQuestLogEntries() do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
		if title == _questDB.curListQuest then
			questIsInQuestLog = true;
		end
	end

	if _quest.distToGiver <= 4 and not questIsInQuestLog then
		if IsMoving() then
			StopMoving();
			return true;
		end
	end

	-- if we are close enough to quest giver
	if (_quest.distToGiver <= 4) and (not questIsInQuestLog) then

		if IsMoving() then
			StopMoving();
			return true;
		end

		-- grind spot reached is false
		_quest.grindSpotReached = false;

		-- remove any form i.e. cat form, ghost wolf form
		if HasForm() then
			RemoveForm();
			return true;
		end

		local px, py, pz = PlayerPosition();

		-- set return target name
		local name = _quest.curQuestGiver;
		local id = _questAcceptQuest:getGiverTargetID();

		-- get a game object to interact with
		if id ~= nil then
			local i, t = GetFirstObject()
			while i ~= 0 do
				if t == 5 then
					if i:GetObjectDisplayID() == id then
						_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = i:GetPosition();
						self.returnQuestToGameObjectTarget = i;
					end
				end
			i, t = GetNextObject(i);
			end
		end
		
		-- target the questgiver
		if not PlayerHasTarget() and _questAcceptQuest:getGiverTargetID() == nil then
			TargetByName(name);
		end

		--[[
		if PlayerHasTarget() and name ~= nil then
			if GetTarget():GetUnitName() ~= name then
				ClearTarget();
			end
		end
		--]]

		if PlayerHasTarget() then
	
			-- if target is quest return target and it is in line of sight then
					-- check line of sight because nav is messy and some quests move just close enough to do Move() function instead of nav
			if GetTarget():GetUnitName() == name and GetTarget():IsInLineOfSight() then
	
				-- chase moving quest targets... get their position again
				_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
			end
		end

		-- we have a quest giver
		if _quest.curQuestGiver ~= nil then	

			-- short timer
			_quest:setTimer(600); 

		

			if (PlayerHasTarget() or _questAcceptQuest:getGiverTargetID() ~= nil) and _quest.curQuestGiver ~= nil then

				-- interact with the quest giver
				if (PlayerHasTarget() and GetTarget():UnitInteract()) or (_questAcceptQuest:getGiverTargetID() ~= nil and self.returnQuestToGameObjectTarget:GameObjectInteract()) then

					-- short timer
					_quest:setTimer(1000);

					-- if we do not have a target then stop moving
					if not PlayerHasTarget() then

						StopMoving();
					return;
					end

					if IsMoving() then
						StopMoving();
						return true;
					end

					--_quest.curQuestGiver = GetTarget();

					-- check how many quests the quest giver has and sort the gossip options to match quest name
					local quest1, quest1Level, quest2, quest2Level, quest3, quest3Level, _, _, _, _ = GetGossipAvailableQuests()
					local gossipOption = 1;

					if (PlayerHasTarget()) or _questAcceptQuest:getGiverTargetID() ~= nil then

						-- close the quest window and turn quest complete if quest is not available
						if (quest1 ~= nil and (quest1 and quest2 and quest3) ~= _questDB.curListQuest)
						and (GetObjectiveText() ~= nil and _questDB.curDesc ~= GetObjectiveText()) then
							CloseQuest();
						--	_questDBHandleDB:turnQuestCompleted();
							--_quest.waitTimer = GetTimeEX() + 3000;
						--_questAcceptQuest.noQuestTimer = 20000;
						end

						if _questDB.curDesc ~= GetObjectiveText() and GetObjectiveText() ~= nil and GetObjectiveText() ~= "" and GetObjectiveText() ~= 0 then
							CloseQuest();
							_quest.waitTimer = GetTimeEX() + 2500;
							-- shorten then timer
							if _questAcceptQuest.noQuestTimer > GetTimeEX() + 9000 then
								_questAcceptQuest.noQuestTimer = GetTimeEX() + 9000;
							end
						end

						-- set gossip option for the quest that matches current quest
						if quest2 ~= nil then
							if quest1 == _questDB.curListQuest then
								gossipOption = 1;
							elseif quest2 == _questDB.curListQuest then
								gossipOption = 2;
							elseif quest3 == _questDB.curListQuest then
								gossipOption = 3;
							end
						end
					end

					-- if there is no gossip option or no text (start areas usually) then return to original gossip structure in DB
					if GetGossipAvailableQuests() == nil then
						gossipOption = _quest.gossipOption
					end

					if PlayerHasTarget() or _questAcceptQuest:getGiverTargetID() ~= nil then

						-- accept the quest
						if (AcceptQuest()) then

							-- reset timer to remove quest from DB
							_questAcceptQuest.noQuestTimer = GetTimeEX() + 15000;
							
							local questDescription, questObjectives = GetQuestLogQuestText(1);

							-- if we have a quest we need to sort the entries
							if GetNumQuestLogEntries() > 0 then

								-- get current quest objectives and set quest
								for e = 0, GetNumQuestLogEntries() do

									questDescription, questObjectives = GetQuestLogQuestText(e);

									if _questDB.curDesc == questObjectives then
										_quest.currentQuest = _quest.curQuestName;
										_quest.currentDesc = questObjectives;
										_questDB.curDesc = questObjectives;
									end
								end
							else 
								-- if we have no other quest then set the current quest we recieve
								_quest.currentQuest = _quest.curQuestName;
								_quest.currentDesc = questObjectives;
								_questDB.curDesc = questObjectives;
							end
						else

							-- accept the quest
							SelectGossipAvailableQuest(gossipOption);
								-- 2 options requires as API is different for differen quest givers (usually start zones)
							SelectAvailableQuest(gossipOption);
						end
					end
				end
			end
		end
		
		-- get targets position if it is a quest giver target
		if PlayerHasTarget() then
			if GetTarget() == _questDB:getQuestGiverName() and GetTarget():IsInLineOfSight() then
				_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
			end
		end

	return;
	end

return false;
end

function _questAcceptQuest:getGiverTargetID()

	local id = nil;

	for i=0, _questDB.numQuests -1 do

		if _questDB.questList[i]['completed'] == "no" then

			if _questDB.questList[i]['questName'] ~= "nil" then

				if _questDB.questList[i]['questName'] == _questDB.curListQuest then
				
					if _questDB.questList[i]['desc'] == _questDB.curDesc then
						id = _questDB.questList[i]['giverName'];
					end
				end
			end
		end
	end

	local i, t = GetFirstObject();
	while i ~= 0 do
		if id == i:GetObjectDisplayID() then
			return i;
		end
	i, t = GetNextObject(i);
	end

return nil;
end