script_buffOtherPlayers = {}

function script_buffOtherPlayers:doBuffs()
	local i, t = GetFirstObject();
	local Sp = {1,2,14,26,38,50};
	local buff = "";
	local buff2 = "";

	if (HasSpell("Power Word: Fortitude")) then
		buff = "Power Word: Fortitude(Rank ";
		buff2 = "Power Word: Fortitude";
	end
	if (HasSpell("Arcane Intellect")) then
		buff = "Arcane Intellect(Rank ";
		buff2 = "Arcane Intellect";
	end
	if (HasSpell("Mark of the Wild")) and (not HasForm()) then
		buff = "Mark of the Wild(Rank ";
		buff2 = "Mark of the Wild";
	end
	-- need to run another check for mana users and compare between blessing of might and wisdom - paladin
	while i ~= 0 do
		if t == 4 then
			if (i:GetDistance() < 28) and (not i:HasBuff(buff2)) and (not i:CanAttack()) and (i:IsInLineOfSight()) then
				for r=6, 1, -1 do 
					if i:GetLevel() >= Sp[r] then
						i:AutoAttack();
						local mytarget = i;
						local b = "), mytarget";
						if (CastSpellByName(buff..r..b)) then
						return true;
						end
					end
				end
			end		
		end
	i, t = GetNextObject(i);
	end
return false;
end