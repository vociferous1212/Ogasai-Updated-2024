script_magePullSpells = {}

function script_magePullSpells:frostMagePull(targetObj)

	local targetObj = script_grind.enemyObj;
	if targetObj == nil or targetObj == 0 then
		targetObj = _quest.enemyTarget;
	end
	if targetObj == nil or targetObj == 0 then
		targetObj = grind2.enemyTarget;
	end

	-- recheck line of sight on target
	if (not IsMounted()) and ( (not targetObj:IsInLineOfSight()) or  (targetObj:GetDistance() > script_mage.spellRange and not IsCasting() and not IsChanneling()) or (targetObj:GetDistance() > script_mage.spellRange) ) and (PlayerHasTarget()) and (not IsSpellOnCD("Frostbolt")) then
		return 3;
	else
		if (IsMoving()) then
			StopMoving();
			return;
		end
		if (PlayerHasTarget()) then
			targetObj:FaceTarget();
		end
		if targetObj:IsInLineOfSight() then
			if (CastSpellByName("Frostbolt", targetObj)) then
				script_mage.waitTimer = GetTimeEX() + 2750;
				script_grind:setWaitTimer(2750);
				if (PlayerHasTarget()) then
					targetObj:FaceTarget();
				end
				return true;
			end
		end
	end
return false;
end

function script_magePullSpells:fireMagePull(targetObj)

	local targetObj = script_grind.enemyObj;

	if targetObj == nil or targetObj == 0 then
		targetObj = _quest.enemyTarget;
	end

	-- recheck line of sight on target
	if (not IsMounted()) and (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > script_mage.spellRange) and (PlayerHasTarget()) then
		return 3;
	else
		if (IsMoving()) then
			StopMoving();
		end
		if (PlayerHasTarget()) then
			targetObj:FaceTarget();
		end
		if (HasSpell("Pyroblast")) then
			if (CastSpellByName("Pyroblast", targetObj)) then
				script_mage.waitTimer = GetTimeEX() + 3000;
				script_grind:setWaitTimer(3000);
				if (PlayerHasTarget()) then
					targetObj:FaceTarget();
				end
				return true;
			end
		else
			if (CastSpellByName("Fireball", targetObj)) then
				script_mage.waitTimer = GetTimeEX() + 3000;
				script_grind:setWaitTimer(3000);
				if (PlayerHasTarget()) then
					targetObj:FaceTarget();
				end
				return true;
			end
		end
	end
return false;
end