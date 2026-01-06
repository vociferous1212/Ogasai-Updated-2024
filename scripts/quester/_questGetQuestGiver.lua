_questGetQuestGiver = {}


function _questGetQuestGiver:run()
	
	--get a quest giver to obtain a quest from

	local curQuestGiver = nil;

	local curQuestName = nil;

	local distToGiver = 0;

	local distToGrind = 0;

	local px, py, pz = GetLocalPlayer():GetPosition();

	_quest.curQuestGiver = _questDB:getQuestGiverName();

	_quest.curQuestName = _questDB:getQuestName(); 

	_quest.curQuestX,  _quest.curQuestY, _quest.curQuestZ = _questDB:getQuestStartPos();

	_quest.distToGiver = GetDistance3D(px, py, pz, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);

	_quest.distToGrind = GetDistance3D(px, py, pz, _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);

	if _quest.distToGiver > 5 and PlayerHasTarget() and GetTarget():GetUnitName() == _quest.curQuestGiver then
		_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
		_quest.distToGiver = GetDistance3D(px, py, pz, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
	end

end
