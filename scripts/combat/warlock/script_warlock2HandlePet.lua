script_warlock2HandlePet = {}

function script_warlock2HandlePet:handlePetCalls()

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



	if (self.useImp) and (GetPet() ~= 0 and GetPet() ~= nil) then

		self.summonPetTimer = currentTime + 10000;

	end
	if (self.useVoidwalker) and (GetPet() ~= 0 and GetPet() ~= nil) then

		self.summonPetTimer = currentTime + 10000;
	end
	
end
