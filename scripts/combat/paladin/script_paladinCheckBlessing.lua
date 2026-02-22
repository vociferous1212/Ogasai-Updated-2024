script_paladinCheckBlessing = {}


function script_paladinCheckBlessing:checkBlessing()

-- cast blessing of might

	if script_paladin.might and HasSpell("Blessing of Might") and not GetLocalPlayer():HasBuff("Blessing of Might") then

		-- the bot doesn't clear friendly targets to cast a spell

		-- if we have a target
		if PlayerHasTarget() then

			-- and we cannot attack that target - its an enemy
			if not GetTarget():CanAttack() then

				-- if the target is not me
				if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then

					-- clear target and target myself
					ClearTarget();
					TargetByName(GetLocalPlayer():GetUnitName());
				end
			end
		end
		if not CastSpellByName("Blessing of Might", GetLocalPlayer()) then
			return true;
		end
	end

-- cast blessing of Wisdom

	if script_paladin.wisdom and HasSpell("Blessing of Wisdom") and not GetLocalPlayer():HasBuff("Blessing of Wisdom") then
		if PlayerHasTarget() then
			if not GetTarget():CanAttack() then
				if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then
					ClearTarget();
					TargetByName(GetLocalPlayer():GetUnitName());
				end
			end
		end
		if not CastSpellByName("Blessing of Wisdom", GetLocalPlayer()) then
			return true;
		end
	end

	if script_paladin.kings and HasSpell("Blessing of Kings") and not GetLocalPlayer():HasBuff("Blessing of Kings") then
		if PlayerHasTarget() then
			if not GetTarget():CanAttack() then
				if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then
					ClearTarget();
					TargetByName(GetLocalPlayer():GetUnitName());
				end
			end
		end
		if not CastSpellByName("Blessing of Kings", GetLocalPlayer()) then
			return true;
		end
	end
return false;
end