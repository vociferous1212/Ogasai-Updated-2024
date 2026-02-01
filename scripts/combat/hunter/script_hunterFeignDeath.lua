script_hunterFeignDeath = {

	feignDeathHealth = 25,
}

function script_hunterFeignDeath:run()

	local player = GetLocalPlayer();

	local health = player:GetHealthPercentage();

	local pet = GetPet();

	if pet ~= 0 and pet ~= nil then

		petHealth = pet:GetHealthPercentage();

		petFocus = pet:GetFocusPercentage();

	end

	local enemyTarget = nil;

	if IsInCombat() and health <= self.feignDeathHealth then
	not has feign death not is on CD

	return true;
	end

	if IsInCombat() then
		return true;
	end

return false;
end