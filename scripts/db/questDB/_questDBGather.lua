_questDBGather = {	waitTimer = 0,
			gatherTarget = 0,
			gatherTarget2 = 0,
			gatheringTarget = 0,
			gatherNum = 0,
			gatherNum2 = 0,
			gatherTargetName = nil,
			gatherTargetName2 = nil,

}

function _questDBGather:gatherObject()

	if self.gatheringTarget ~= 0 and self.gatheringTarget ~= nil then

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

		if (not self.gatheringTarget:IsTapped() or self.gatheringTarget:IsTappedByMe()) and self.gatheringTarget:GetDistance() <= 4 then
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
