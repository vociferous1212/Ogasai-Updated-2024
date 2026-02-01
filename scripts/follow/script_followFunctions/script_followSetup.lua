script_followSetup = {}

function script_followSetup:setup()

	script_follow.lootCheck['timer'] = 0;

	script_follow.lootCheck['target'] = 0;

	script_helper:setup();

	script_gather:setup();

	script_priestFollowerHeals.timer = GetTimeEX();

	vendorDB:setup();

	vendorDB:loadDBVendors();

	script_vendor:setup();

	local _ , class = UnitClass('player');
	
	if class == "MAGE" 
		or class == "WARLOCK"
		or class == "ROGUE"
		or class == "WARRIOR"
		or class == "HUNTER" then
		
		script_follow.assistInCombat = true;
	end
	if class == "PRIEST" or class == "PALADIN" or class == "SHAMAN" or class == "DRUID" then
		script_follow.assistInCombat = true;
		script_follow.dpsHP = 75;
	end
	
	ClearTarget();





	script_follow.isSetup = true; 

	end