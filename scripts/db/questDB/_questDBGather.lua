_questDBGather = {	waitTimer = 0,
			gatherTarget = 0,
			gatherTarget2 = 0,
			gatheringTarget = 0,
			gatherNum = 0,
			gatherNum2 = 0,
			gatherTargetName = nil,
			gatherTargetName2 = nil,
			blacklistTable = {},
			blacklistTableNum = 0,

}


-- add node to blacklist table by GUID
function _questDBGather:addNodeToBlacklist(target) 
	if (target ~= nil and target ~= 0) then
		self.blacklistTable[self.blacklistTableNum] = target;
		self.blacklistTableNum = self.blacklistTableNum + 1;
	end
end

-- check if node is blacklisted by table GUID
function _questDBGather:isNodeBlacklisted(target) 
	for i=0, self.blacklistTableNum do
		if (target == self.blacklistTable[i]) then
			return true;
		end
	end
return false;
end


function _questDBGather:gatherObject()

	if self.gatheringTarget ~= 0 and self.gatheringTarget ~= nil and not _questDBGather:isNodeBlacklisted(self.gatheringTarget:GetGUID())then

		local dist = self.gatheringTarget:GetDistance();

		local x, y, z = self.gatheringTarget:GetPosition();

		if dist > 3 then

			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);

		return true;
		end
	end
return false;
end

function _questDBGather:run()

	if _quest.isQuestComplete then
		return false;
	end

	if self.waitTimer > GetTimeEX() then
		return true;
	end

	-- get object
	self.gatheringTarget = _questDBGatherGetObject:getObject();

	-- move to object
	if _questDBGather:gatherObject() then

		return true;

	end
		
	if self.gatheringTarget ~= 0 and self.gatheringTarget ~= nil then

		for i=0, _questDB.numQuests -1 do
			if _questDB.curDesc == _questDB.questList[i]['desc'] then
				if _questDB.questList[i]['gatherID'] ~= 0 then
					if self.gatheringTarget:GetObjectDisplayID() == _questDB.questList[i]['gatherID'] then
						self.gatherTargetName = self.gatheringTarget:GetUnitName();
					end
				end
				if _questDB.questList[i]['gatherID2'] ~= 0 then
					if self.gatheringTarget:GetObjectDisplayID() == _questDB.questList[i]['gatherID2'] then
						self.gatherTargetName2 = self.gatheringTarget:GetUnitName();
					end
				end
			end
		end

		if _questDBGather:isNodeBlacklisted(self.gatheringTarget:GetGUID()) then
			self.gatheringTarget = _questDBGatherGetObject:getObject();
		end


		if (not self.gatheringTarget:IsTapped() or self.gatheringTarget:IsTappedByMe()) and self.gatheringTarget:GetDistance() <= 4 and not _questDBGather:isNodeBlacklisted(self.gatheringTarget:GetGUID()) then			

			if (HasForm()) then

				if (IsCatForm()) then

					script_druidEX:removeCatForm();

				end

				if (IsBearForm()) then

					script_druidEX:removeBearForm();

				end

				if (IsTravelForm) then

					script_druidEX:removeTravelForm();

				end

			end		

			if (IsMoving()) then

				StopMoving();

				_quest:setTimer(1000);

				return true;

			end

			if (not IsLooting() and not IsChanneling()) and (not IsMoving()) and (not IsCasting()) and (IsStanding()) then
 
				self.gatheringTarget:GameObjectInteract();

				if IsMoving() then

					StopMoving();

				return true;

				end


if self.gatheringTarget:GetObjectDisplayID() == 210 or self.gatheringTarget:GetUnitName() == "The Fall of Ameth'Aran" or self.gatheringTarget:GetUnitName() == "The Lay of Ameth'Aran" and not IsInCombat() and not IsChanneling() and not IsCasting() then
					_questDBGather:addNodeToBlacklist(self.gatheringTarget:GetGUID())
				end
				_quest:setTimer(1650);



			return true;

			end

			if (not LootTarget()) and (self.gatheringTarget:GameObjectInteract()) and (not IsMoving()) and (not IsLooting()) then
				_quest:setTimer(4550);

			return true;

			end

			if (IsLooting()) then

				self.waitTimer = GetTimeEX() + 2500;

				if (LootTarget()) or (IsLooting()) then

					_quest:setTimer(450);



					return true;

				end
			end
		end
	end
return false;
end
