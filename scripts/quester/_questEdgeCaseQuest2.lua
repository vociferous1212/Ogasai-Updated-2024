_questEdgeCaseQuest2 = {}

function _questEdgeCaseQuest2:run()

local title = nil; local isComplete = 0;

	for i=0, _questDB.numQuests -1 do
		if _questDB.questList[i]['questName'] == _questDB.curListQuest then _quest.currentQuest = _questDB.questList[i]['questName'] end end
	for i=0, GetNumQuestLogEntries()  do
		title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);
	end
		if isComplete == 1 then
			_quest.isQuestComplete = true;

			return false;
		end


	if isComplete ~= 1 and title == "asdf" then
	return true;
	end
return false;
end