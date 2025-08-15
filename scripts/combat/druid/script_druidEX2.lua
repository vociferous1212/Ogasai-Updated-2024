script_druidEX2 = {}

function script_druidEX2:castRip(spellName) -- rip function needed to work properly
	if (HasSpell(spellName)) then
		if (not IsSpellOnCD(spellName)) then
			if (not IsAutoCasting(spellName)) then
				CastSpellByName(spellName);
			end
		end
	end
	return false;
end

function script_druidEX2:catForm()
	
	if (not IsMounted()) and (not HasForm()) and (GetLocalPlayer():GetManaPercentage() >= 50) then
		if (HasSpell("Cat Form")) and (not IsSpellOnCD("Cat Form")) then
			if (CastSpellByName("Cat Form")) then
				self.waitTimer = GetTimeEX() + 1500;
				return 0;
			end
		end
	end
return true;
end	


function script_druidEX2:menuOne()

	Text("Claw Energy Cost");
	script_druid.clawEnergy = SliderInt("Claw Energy", 37, 45, script_druid.clawEnergy);
	if (HasSpell("Rake")) then
		Text("Rake Energy Cost");
		script_druid.rakeEnergy = SliderInt("Rake Energy", 32, 40, script_druid.rakeEnergy);
	end
end

function script_druidEX2:menuTwo()
end

function script_druidEX2:menuThree()
end

function IsIdolOfFerocityEquipped()
    local itemLink = GetInventoryItemLink("player", 18) -- Relic slot ID in 1.12.1
    if itemLink then
        local _, _, parsedItemLink = string.find(itemLink, "(item:%d+)")
        if parsedItemLink then
            local itemName = GetItemInfo(parsedItemLink)
            if itemName and itemName == "Idol of Ferocity" then
                return true
            end
        end
    end
    return false
end