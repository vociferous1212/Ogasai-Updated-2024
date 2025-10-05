_questSortCurrentQuest = {}

function _questSortCurrentQuest:run()

	-- if desc doesn't match desc then complete quest or if name ~= name and no desc found

	if (script_getSpells.getSpellsStatus < 1) and distToGiver ~= nil and script_grind.pause and not IsLooting() then

		-- if we want to auto complete the quests
		if _quest.autoComplete and

			-- descriptions don't match then
			((GetNumQuestLogEntries() ~= 0 and _questDB.curDesc ~= _quest.currentDesc)
			or (GetNumQuestLogEntries() ~= 0 and _questDB.curListQuest ~= _quest.currentQuest)) then

				if IsMoving() then
					StopMoving();
					return true;
				end

			-- turn the quest complete in the DB
			if (_questDBHandleDB:turnOldQuestCompleted()) then
				_quest.tickRate = .2;
				_quest.message = "Completing previous quests in list";
				_quest:setTimer(150)
			return;
			end
		end
	end
end
