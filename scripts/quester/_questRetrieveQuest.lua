_questRetrieveQuest = {}

function _questRetrieveQuest:run()

	-- chase a moving target
	if _quest.distToGiver <= 5 then
		if GetTarget() == 0 or GetTarget() == nil then
			TargetByName(_quest.curQuestGiver);
		end
	end
	-- get the moving targets position
	if GetTarget() ~= nil and GetTarget() ~= 0 then
		if GetTarget():GetUnitName() == _quest.curQuestGiver then
			_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
			_quest.distToGiver = GetTarget():GetDistance();
		end
	end

	-- move to quest giver
	if (_quest.curQuestX ~= 0) and (_quest.distToGiver > 4) and (_quest.currentQuest == nil) and ((script_grind.lootObj == nil and not script_grindEX.bagsFull) or (script_grind.lootObj ~= nil and script_grind.skipLooting) or (script_grind.lootObj ~= nil and _questEX.bagsFull) or (script_grind.lootObj == nil and not script_grind.skipLooting) or script_grind.lootObj == nil) and not IsCasting() and not IsChanneling() then

 		if not IsMoving() then
			Move(_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
			return true;
		end

		script_navEX:moveToTarget(GetLocalPlayer(), _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
		_quest.message = "Retrieving a quest, "..math.floor(_quest.distToGiver).." (yd)";
		return true;
	end
end