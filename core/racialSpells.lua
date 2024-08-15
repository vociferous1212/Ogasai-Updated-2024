racialSpells = {

}

function CheckRacialSpells()

	Berserking();
	EscapeArtist();
	WarStomp();
	StoneForm();
	ElunesGrace();
	BloodFury();

return false;
end

function Berserking()

	if (HasSpell("Berserking")) and (not IsSpellOnCD("Berserking")) and (not GetLocalPlayer():HasBuff("Berserking")) then
		if (not IsCasting()) and (not IsChanneling()) and (not GetLocalPlayer():IsStunned()) then
			CastSpellByName("Berserking", GetLocalPlayer());
			return true;
		end
	end

return false;
end

function EscapeArtist()

	if (HasSpell("Escape Artsist")) and (not IsSpellOnCD("Escape Artist")) and (script_checkDebuffs:hasDisabledMovement()) then
		if (not IsCasting()) and (not IsChanneling()) and (not GetLocalPlayer():IsStunned()) then
			CastSpellByName("Escape Artist", GetLocalPlayer());
			return true;
		end
	end

return false;
end

function WarStomp()

	if (HasSpell("War Stomp")) and (not IsSpellOnCD("War Stomp")) then
		if (GetLocalPlayer():GetUnitsTarget() ~= 0) then
			if (not IsCasting()) and (not IsChanneling()) and (not GetLocalPlayer():IsStunned()) then
				CastSpellByName("War Stomp", GetLocalPlayer());
				return true;
			end
		end
	end

return false;
end

function Shadowmeld()

	if (HasSpell("Shadowmeld")) and (not IsSpellOnCD("Shadowmeld")) and (not GetLocalPlayer():HasBuff("Shadowmeld")) and (not IsInCombat()) then
		if (not IsCasting()) and (not IsChanneling()) and (not GetLocalPlayer():IsStunned()) then
			CastSpellByName("Shadowmeld", GetLocalPlayer());
			return true;
		end
	end

return false;
end

function StoneForm()

	if (HasSpell("Stoneform")) and (not IsSpellOnCD("Stoneform")) and (not GetLocalPlayer():HasBuff("Stoneform")) then
		if (not GetLocalPlayer():IsStunned()) then
			CastSpellByName("Stone Form", GetLocalPlayer());
			return true;
		end
		return;
	end

return false;
end

function ElunesGrace()

	if (HasSpell("Elune's Grace")) and (not IsSpellOnCD("Elune's Grace")) and (not GetLocalPlayer():HasBuff("Elune's Grace")) then
		if (not IsCasting()) and (not IsChanneling()) and (not GetLocalPlayer():IsStunned()) then
			CastSpellByName("Elune's Grace", GetLocalPlayer());
			return true;
		end
	end

return false;
end

function BloodFury()

	if (HasSpell("Blood Fury")) and (not IsSpellOnCD("Blood Fury")) and (not GetLocalPlayer():HasBuff("Blood Fury")) then
		if (not IsCasting()) and (not IsChanneling()) and (not GetLocalPlayer():IsStunned()) then
			CastSpellByName("Blood Fury", GetLocalPlayer());
			return true;
		end
	end

return false;
end

function Cannibalize()
	i, t = GetFirstObject();
	if (GetLocalPlayer():GetHealthPercentage() <= 70) then
		while i ~= 0 do
			if t == 3 then
				if (i:GetDistance() <= 10) and (i:IsDead()) and (i:GetCreatureType() == "Humanoid" or i:GetCreatureType() == "Undead") and (i:IsInLineOfSight()) then
					if (i:GetDistance() <= 10 and i:GetDistance() > 4) then
						x, y, z = i:GetPosition();
						Move(x, y, z);
						return true;
					end
					if (not IsSpellOnCD("Cannibalize")) and (not GetLocalPlayer():HasBuff("Cannibalize")) then
						if (i:GetDistance() <= 4) then
							CastSpellByName("Cannibalize");
							return true;
						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end