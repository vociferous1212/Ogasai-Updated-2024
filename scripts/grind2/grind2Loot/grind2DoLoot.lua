grind2DoLoot = {

	lootTarget = nil,

	lootDistance = 65,

	timer = 0,

	lootTimer = 0,

	blacklistLootTimer = 0
}

function grind2DoLoot:run()

	local player = GetLocalPlayer();

	if IsAnyTargetTargetingPlayer() then
		return false;
	end

	-- loot target if we skinned a target and the loot target turned nil
	if IsLooting() and GetTimeEX() > self.timer then

		LootTarget();


		if StaticPopup1:IsVisible() then

			StaticPopup1Button1:Click()
		end

		self.timer = GetTimeEX() + 250;

	end

	-- get loot target
	self.lootTarget = grind2FindLoot:target(self.lootDistance);

	-- get skin target
	if (self.lootTarget == nil or self.lootTarget == 0) and HasSpell("Skinning") then

		self.lootTarget = grind2FindSkinTarget:target(self.lootDistance);
	end

	-- do loot if we have a loot taregt
	if self.lootTarget ~= nil and self.lootTarget ~= 0 and not player:IsDead() and not IsAnyTargetTargetingPlayer() then

		-- move to loot target
		local xx, yy, zz = self.lootTarget:GetPosition();

		if self.lootTarget:GetDistance() > 3 then

			Move(xx, yy, zz);

			return true;
		end

		-- close enough to loot target
		if self.lootTarget:GetDistance() <= 3 then

			-- stop moving
			if IsMoving() then

				StopMoving();

				return true;
			end

			-- if we are looting then loot the target
			if IsLooting() and GetTimeEX() > self.timer then

				LootTarget();

				-- loot any BoP items
				if StaticPopup1:IsVisible() then

					StaticPopup1Button1:Click()
				end

				self.timer = GetTimeEX() + 250;

				return true;
			end

			-- interact with the target to loot
			if self.lootTarget:UnitInteract() then
					
				return true;
			end

			return true;
		end

		return true;
	end	

	return false;
end





	