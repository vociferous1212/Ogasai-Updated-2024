script_druidHealLogic = {


}


function script_druidHealLogic:castHealingTouch()

	local healingTouchRankTable = {
		[1] = { mana = 25, spellName = "Healing Touch(Rank 1)" },
		[2] = { mana = 55, spellName = "Healing Touch(Rank 2)" },
		[3] = { mana = 110, spellName = "Healing Touch(Rank 3)" },
		[4] = { mana = 185, spellName = "Healing Touch(Rank 4)" },
		[5] = { mana = 270, spellName = "Healing Touch(Rank 5)" },
		[6] = { mana = 335, spellName = "Healing Touch(Rank 6)" },
		[7] = { mana = 405, spellName = "Healing Touch(Rank 7)" },
		[8] = { mana = 495, spellName = "Healing Touch(Rank 8)" },
		[9] = { mana = 600, spellName = "Healing Touch(Rank 9)" },
		[10] = { mana = 720, spellName = "Healing Touch(Rank 10)" },
		[11] = { mana = 800, spellName = "Healing Touch(Rank 11)" }
	}

   
	local healingTouchRankTableNum = 11

	local mana = UnitMana("player")
	local playerLevel = UnitLevel("player")

	local maxRank = 1

			--if playerLevel >= 60 then maxRank = 11
	if playerLevel >= 56 then maxRank = 10
	elseif playerLevel >= 50 then maxRank = 9
	elseif playerLevel >= 44 then maxRank = 8
	elseif playerLevel >= 38 then maxRank = 7
	elseif playerLevel >= 32 then maxRank = 6
	elseif playerLevel >= 26 then maxRank = 5
	elseif playerLevel >= 20 then maxRank = 4
	elseif playerLevel >= 14 then maxRank = 3
	elseif playerLevel >= 8 then maxRank = 2
	end

	for i = maxRank, 1, -1 do
		local spell = healingTouchRankTable[i]
		if spell and mana >= spell.mana then
			CastSpellByName(spell.spellName, "player")
			return true
		end
	end

	return false
end

