_questSetup = {isSetup = false}

function _questSetup:run()

	if (not _questDB.isSetup) then
		_questDB:setup();
	end

	if GetLocalPlayer():GetLevel() < 10 then
		script_grind.getSpells = true;
	end

	if GetNumQuestLogEntries() == 0 or GetNumQuestLogEntries() == nil then
		_quest.autoComplete = false;
		_quest.weHaveQuest = false;
		_quest.isQuestComplete = false;
	end
	
	script_grind:setup();

	script_talent:setup();

	script_gather:setup();

	script_vendor:setup();
	
	vendorDB:setup();

	vendorDB:loadDBVendors();

	_questDBGather.waitTimer = GetTimeEX();

	script_helper:setup();

	_quest.usingQuester = true;

	_questEX.jumpTimer = GetTimeEX();

	_questEX.breathTimer = GetTimeEX();

	_questEX2.checkBagTimer = GetTimeEX();

	_questEX.standingInFireTimer = GetTimeEX();

	_questDBReturnQuest.waitTimer = GetTimeEX();

	_questDoCombat.waitTimer = GetTimeEX();

	_questDoCombat.blacklistTimer = GetTimeEX();

	_questDoCombat.targetingTimer = GetTimeEX();

	_quest.waitTimer = GetTimeEX();

	if GetNumPartyMembers() > 1 then
		script_gather.safeGather = false;
	end

_quest.isSetup = true;

end
