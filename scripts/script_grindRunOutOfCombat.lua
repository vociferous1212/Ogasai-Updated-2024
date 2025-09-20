script_grindRunOutOfCombat = {}

-- script character limits... splitting functions into separate scripts...

-- run out of combat while using the grinder if we are about to die
-- use saved path nodes and walk through them

function script_grindRunOutOfCombat:runOutOfCombat()

	if (IsInCombat() or script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet()) and GetLocalPlayer():HasBuff("Feign Death") then
		script_grind.combatError = 4;
	end

	if IsInCombat()
	and (
		-- we have low health and a warrior or rogue
		(GetLocalPlayer():GetHealthPercentage() <= 15 and (GetMyClass() == "ROGUE" or GetMyClass() == "WARRIOR"))

		-- we have low health and mana and not a warrior or rogue
		or (GetLocalPlayer():GetHealthPercentage() <= 15
			and (GetMyClass() ~= "ROGUE" and GetMyClass() ~= "WARRIOR")
			and GetLocalPlayer():GetManaPercentage() <= 20)
	)

	-- or there's 3 more or more targets attacking us and we have low health
	or (script_grind:enemiesAttackingUs() >= 3 and GetLocalPlayer():GetHealthPercentage() <= 55)

	-- run away from targets too high level
	or 	(
		(script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0)
		and (script_grind.skipHardPull and script_grind.enemyObj:GetLevel() > script_grind.maxLevel and script_grind:enemiesAttackingUs() > 1)
		)

	then
		
		-- try to feign death hunter
		if IsInCombat() and HasSpell("Feign Death") and not IsSpellOnCD("Feign Death") and not GetLocalPlayer():HasBuff("Feign Death") then
			if CastSpellByName("Feign Death") then 
				script_grind:setWaitTimer(15000);
				script_hunter.waitTimer = GetTimeEX() + 15000;
				if HasPet() and script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet() then
					return;
				end
				return false;
			end
		end

		if  script_nav.numSavedLocation ~= nil and script_nav.numSavedLocation ~= 0 then

			-- move if saved locations are greater than 3
			if (script_nav.numSavedLocation > 3) then
				local _lx, _ly, _lz = GetLocalPlayer():GetPosition();

				if _lx ~= nil and script_nav.savedLocations ~= nil and script_nav.currentGoToLocation ~= nil 
				and script_nav.savedLocations ~= 0 and script_nav.currentGoToLocation ~= 0 then
					local currentDist = math.sqrt((_lx - script_nav.savedLocations[script_nav.currentGoToLocation]['x'])^2 + (_ly - script_nav.savedLocations[script_nav.currentGoToLocation]['y'])^2);

					-- move from each saved location, count +1 each location each pass
					if currentDist < 5 then
						script_nav.currentGoToLocation = script_nav.currentGoToLocation - 1;
						script_grind.message = "Running out of combat: Changing go to location...";								return true;
					end
				end

				-- move to saved location in index
				script_navEX:moveToTarget(GetLocalPlayer(), script_nav.savedLocations[script_nav.currentGoToLocation]['x'], script_nav.savedLocations[script_nav.currentGoToLocation]['y'], script_nav.savedLocations[script_nav.currentGoToLocation]['z'])
					script_grind.message = "Running out of combat: Moving to auto path node " .. (script_nav.currentGoToLocation + 1) .. "...";
					if HasSpell("Earthbind Totem") and not IsSpellOnCD("Earthbind Totem") then
						CastSpellByName("Earthbind Totem");
					end
			end
		end
	return true;
	end

return false;
end
