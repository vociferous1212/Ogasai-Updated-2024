instantCastSpells = {


}


-- get spell info API doesn't work this purpose.

-- the bot returns when casting, pausing for a moment
function isSpellInstantCast:run()

	local spellTable = {
	
		[5118] = true,	-- aspect of the cheetah

	
	}

	if spellTable[Player():GetCasting()] or spellTable[Player():GetChanneling()] then

		return true;
	end

return false;
end