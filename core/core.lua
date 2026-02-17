-- load the navmesh once we enter the game
if (not IsUsingNavmesh()) then
	UseNavmesh(true);
	LoadNavmesh();
end

-- stop the bot if we log out or load screen...
if GetLocalPlayer() == nil or GetLocalPlayer() == 0 or script_grind == nil then
	StopBot();
	ShowBar();
end

function Cast(spellName, target)
	if (HasSpell(spellName)) then
		if (target:IsSpellInRange(spellName)) then
			if (not IsSpellOnCD(spellName)) then
				if (not IsAutoCasting(spellName)) then
					target:FaceTarget();
					target:TargetEnemy();
					return target:CastSpell(spellName);
				end
			end
		end
	end
	return false;
end

-- USED ONLY TO CHECK HASBUFF
function Buff(spellName, player)
	if (IsStanding()) then
		if (HasSpell(spellName)) then
				if (not player:HasBuff(spellName)) then
					return player:CastSpell(spellName);
				end
			end
		end
	return false;
end

function CastHeal(spellName, target)
	if (HasSpell(spellName)) then
		if (target:IsSpellInRange(spellName)) then
			if (not IsSpellOnCD(spellName)) then
				if (not IsAutoCasting(spellName)) then
					return target:CastSpell(spellName);
				end
			end
		end
	end
	return false;
end

-- truncate number to 2 decimal places
function truncateNumber(num, decimals)

	if type(num) ~= "number" or type(decimals) ~= "number" or decimals < 0 then
		--return DEFAULT_CHAT_FRAME:AddMessage("No number to truncate");
		return;
	end
	local factor = 10 ^ decimals
	return math.floor(num * factor) / factor
end