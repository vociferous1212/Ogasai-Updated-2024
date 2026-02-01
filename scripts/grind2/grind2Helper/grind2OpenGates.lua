grind2OpenGates = {

	gateTimer = 0,

	isSetup = false,

	timer = GetTimeEX(),

}

function grind2OpenGates:setup()

	self.gateTimer = GetTimeEX();
	
	self.timer = GetTimeEX();

	if not self.isSetup then

		-- do something
	end

	self.isSetup = true;
end

function grind2OpenGates:openGates()

	if not self.isSetup then

		grind2OpenGates:setup();
	end

	local player = GetLocalPlayer();

	target, targetType = GetFirstObject();

	while target ~= 0 and target ~= nil do

		-- no need to filter by type, only need to filter anything within clickable range
		if target:GetDistance() <= 10 and not script_checkDebuffs:hasDisabledMovement() then

			if target:GetUnitName() == "Quarry Gate" then

				local xT, yT, zT = target:GetPosition();

				local xP, yP, zP = player:GetPosition();

				local distance = target:GetDistance();

				local xV, yV, zV = xP - xT, yP - yT, zP - zT;	

				local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);

				local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;	

				local moveX, moveY, moveZ = xT + xUV*4, yT + yUV*4, zT + zUV;		

				if (distance > 5) then 

					--script_navEX:moveToTarget(GetLocalPlayer(), moveX, moveY, moveZ);

					return;
				end

				if HasForm() then

					RemoveForm();

					return true;
				end
	
				if distance <= 5 and (not IsLooting() and not IsChanneling()) and (not IsMoving()) and (not IsCasting()) and (IsStanding()) then

					if target:GameObjectInteract() then

						grind2setTimer(2000);

						grind2OpenGates.gateTimer  = GetTimeEX() + 10000; 

						return true;
					end
				end

				return true;
			end
		end

		target, targetType = GetNextObject(target);
	end

	return false;
end