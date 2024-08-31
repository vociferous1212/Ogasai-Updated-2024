_questEX = {getSpells = false,}

function _questEX:doChecks()

-- loot objects
	if (not IsInCombat()) then
		script_grind.lootObj = script_nav:getLootTarget(50);
		if (script_grind.lootObj ~= nil) and (not IsLooting()) then
			self.message = "Looting";
			if (script_grind.lootObj:GetDistance() <= 4) then
				_quest.waitTimer = GetTimeEX() + 1500;
				if (IsMoving()) then
					StopMoving();
					return true;
				end
			end
			if (not script_grind:doLoot(GetLocalPlayer())) then
				if IsLooting() then
					if (not LootTarget()) then
						LootTarget();
					end
				end
				_quest.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		return true;
		end
	end

	if _quest:runRest() then
		return true;
	end

-- reset to allow bot to continue if we don't have the checkbox clicked...
		if (not self.getSpells or GetLocalPlayer():IsDead() or IsGhost()) then
			script_getSpells.getSpellsStatus = 0;
		end
		
		-- go to trainer and get spells
		if (self.getSpells) and (not _quest.pause) and (not IsInCombat()) then
			if (script_getSpells:checkForSpellsNeeded()) then
				_quest.message = "Moving to class trainer for spells";
				if (IsMoving()) and (not _quest.pause) then
					if (not script_unstuck:pathClearAuto(2)) then
						script_unstuck:unstuck();
							return true;
					end
				end
				return;
			else
				script_getSpells.getSpellsStatus = 0;
			end
		end
return false;
end
