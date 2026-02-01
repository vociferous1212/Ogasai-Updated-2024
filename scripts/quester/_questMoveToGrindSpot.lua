_questMoveToGrindSpot = {}

function _questMoveToGrindSpot:run()

	if _quest.currentType ~= 1 and _quest.currentType ~= 2 and not IsInCombat() and not _quest.isQuestComplete and not IsLooting() then
		if _questDoOtherQuestTypes() then
			return true;
		end
	end	

	if _quest.currentType == 2 and not IsInCombat() and script_grind.lootObj == nil then
		if _questDBGather:run() then
			_quest.message = "Gathering quest item - ".._questDBGather.gatheringTarget:GetUnitName()..", "..math.floor(_questDBGather.gatheringTarget:GetDistance()).." (yd)";
			return true;
		end
	end

	if not GetLocalPlayer():IsDead() and not _quest.needRest and GetTimeEX() > _questDoCombat.targetingTimer and (_quest.currentQuest ~= nil and _quest.curGrindX ~= 0 and _quest.grindSpotReached and _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and _quest.currentType ~= 11) or (IsInCombat()) or (not IsInCombat() and script_grind.lootObj == nil and _quest.grindSpotReached and _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and _quest.currentType ~= 11) then
		if (_quest.enemyTarget == nil) and (not _quest.isQuestComplete) then
			_quest.enemyTarget = _questDBTargets:getTarget();
		end
	end

	-- we have a quest so go to grind spot
	if _quest.curGrindX ~= 0 and _quest.currentQuest ~= nil and not IsInCombat() and not _quest.isQuestComplete and not IsLooting() and (script_grind.lootObj == nil or script_grind.skipLooting) and not IsCasting() and not IsChanneling() then
		if (_quest.distToGrind > 40 and _quest.currentType ~= 3 and _quest.currentType ~= 4 and not _quest.grindSpotReached) or (_quest.currentType == 3 or _quest.currentType == 4 or _quest.curentType == 5 or _quest.currentType == 11 and _quest.distToGrind > 5) then
			if _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and not _quest.isQuestComplete and _quest.enemyTarget == nil then
			end

			_quest.message = "Moving to grind spot";
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
		end
	end
end