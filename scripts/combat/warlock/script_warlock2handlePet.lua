script_warlock2handlePet = {waitTimer = 0,}

function script_warlock2handlePet:handlePetCalls()

	local localObj = GetLocalPlayer();
	local myMana = localObj:GetManaPercentage();
	local myHealth = localObj:GetHealthPercentage();
	local currentTime = GetTimeEX();
	local petHealth = 0;
	local petMana = 0;
	local myTarget = 0;

	if (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
		myTarget = script_grind.enemyObj;
	end

	if (GetPet() ~= 0 and GetPet() ~= nil) then
		petHealth = GetPet():GetHealthPercentage();
		petMana = GetPet():GetManaPercentage();
	end
	
	if (script_warlock2.useImp) and (GetPet() == 0 or GetPet() == nil) then
		if (HasSpell("Summon Imp")) and (myMana > 50) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			CastSpellByName("Summon Imp");
			script_warlock2:setTimer(5);
			self.waitTimer = GetTimeEX() + 10000;
			script_warlock2.summonPetTimer = currentTime + 10000;
			return;
		end
	end

	if (script_warlock2.useVoidwalker) and (HasItem("Soul Shard")) and (GetPet() ~= 0 and GetPet() ~= nil) then
		if (HasSpell("Summon Voidwalker")) and (myMana > 50) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			CastSpellByName("Summon Voidwalker");
			script_warlock2:setTimer(5);
			self.waitTimer = GetTimeEX() + 10000;
			script_warlock2.summonPetTimer = currentTime + 10000;
			return;
		end
	end

return false;	
end
