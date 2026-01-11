tempCombatMessage = {

}

function tempCombatMessage:getClassScriptMessage()

	local class = GetMyClass();

	local message = "";

	if class == "WARRIOR" then

		message = script_warrior.message;
	elseif class == "PRIEST" then

		message = script_priest.message;
	elseif class == "MAGE" then

		message = script_mage.message;
	elseif class == "WARLOCK" then

		message = script_warlock.message;
	elseif class == "DRUID" then

		message = script_druid.message;
	elseif class == "PALADIN" then

		message = script_paladin.message;
	elseif class == "SHAMAN" then

		message = script_shaman.message;
	elseif class == "ROGUE" then

		message = script_rogue.message;
	elseif class == "HUNTER" then

		message = script_hunter.message;
	end

	if grind2.pause then
	
		message = "idle...";
	end

	return message;
end