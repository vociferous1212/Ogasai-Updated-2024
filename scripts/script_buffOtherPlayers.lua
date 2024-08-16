script_buffOtherPlayers = {

	enableBuffs = true,

}

function script_buffOtherPlayers:doBuffs()

	local i, t = GetFirstObject();
	-- target levels that allow different rank buffs
	local Sp = {1,2,14,26,38,50};

	-- set buff and rank to CastSpellByName()
	local buff = "";

	-- set buff to check for HasBuff()
	local buff2 = "";

	-- priest
	if (HasSpell("Power Word: Fortitude")) then
		buff = "Power Word: Fortitude(Rank ";
		buff2 = "Power Word: Fortitude";
	end
	-- mage
	if (HasSpell("Arcane Intellect")) then
		buff = "Arcane Intellect(Rank ";
		buff2 = "Arcane Intellect";
	end
	-- druid
	if (HasSpell("Mark of the Wild")) and (not HasForm()) then
		buff = "Mark of the Wild(Rank ";
		buff2 = "Mark of the Wild";
	end

	while i ~= 0 do
		if (i:GetDistance() <= 30) then
			if t == 4 then
				-- target doesn't have buff already and is within distance and is in line of sight
				if (HasSpell(buff2)) and (i:GetDistance() < 28) and (not i:HasBuff(buff2)) and (not i:CanAttack()) and (i:IsInLineOfSight()) and (not i:IsDead()) then

					-- run the table to find the proper spell rank to use
					for r=6, 1, -1 do 
	
						-- level is within spell range to use
						if i:GetLevel() >= Sp[r] then
	
							-- needed to actually target the player... can be called from a different function though
							i:AutoAttack();
	
							local myTarget = i;
	
							-- finish the missing syntax from above
							local b = "), myTarget";
	
							if (CastSpellByName(buff..r..b)) then
							--CastSpellByName("Power Word: Fortitude(Rank ", myTarget);
	
							return true;
							end
						end
					end
				end		
			end
		end
	i, t = GetNextObject(i);
	end
return false;
end


-- paladin buff other players
function script_buffOtherPlayers:doBuffsPaladin()
	local i, t = GetFirstObject();
	local Sp = {1,2,14,26,38,50};
	local buff = "Blessing of Might(Rank ";
	local buffCheck = "Blessing of Might";
	local buff2 = "Blessing of Wisdom(Rank ";
	local buff2Check = "Blessing of Wisdom";

	while i ~= 0 do
		if t == 4 then
			if (i:GetDistance() < 28) and (not i:HasBuff(buffCheck)) and (not i:HasBuff(buff2Check)) and (not i:CanAttack()) and (i:IsInLineOfSight()) then
				if (HasSpell(buff2Check)) and (i:GetManaPercentage() ~= nil and i:GetManaPercentage() > 1) then	
					for r=6, 1, -1 do 
						if i:GetLevel() >= Sp[r] then
							i:AutoAttack();
							local myTarget = i;
							local b = "), myTarget";
							if (CastSpellByName(buff2..r..b)) then
							return true;
							end
						end
					end
				elseif ( (HasSpell(buffCheck)) and (i:GetManaPercentage() == nil or i:GetManaPercentage() < 1) or (i:GetRagePercentage() ~= nil or i:GetRagePercentage() < 1) or (i:GetEnergyPercentage() ~= nil or i:GetEnergyPercentage() > 1)) or (not HasSpell(buff2)) then
					for r=6, 1, -1 do 
						if i:GetLevel() >= Sp[r] then
							i:AutoAttack();
							local myTarget = i;
							local b = "), myTarget";
							if (CastSpellByName(buff..r..b)) then
							return true;
							end
						end
					end
				end

			end		
		end
	i, t = GetNextObject(i);
	end
return false;
end