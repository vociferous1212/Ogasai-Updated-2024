grind2DoLoot = {

	lootTarget = nil,

	lootDistance = 65,

	timer = 0,

	lootTimer = 0,

	blacklistLootTimer = 0,

	lootTimerSet = false
}

function grind2DoLoot:run()

	if self.blacklistLootTimer == 0 or self.blacklistLootTimer == nil then
		self.blacklistLootTimer = GetTimeEX();
	end

	if not self.lootTimerSet then
		self.blacklistLootTimer = GetTimeEX() + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
		self.lootTimerSet = true;
	end

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

	-- don't loot blacklisted targets
	if grind2BlacklistLoot:isLootTargetBlacklisted(target) then
		self.lootTarget = nil;
	end		

	-- do loot if we have a loot taregt
	if self.lootTarget ~= nil and self.lootTarget ~= 0 and not player:IsDead() and not IsAnyTargetTargetingPlayer() then

		-- add loot target to blacklist
		if GetTimeEX() > self.blacklistLootTimer then
			grind2BlacklistLoot:addLootTargetToBlacklist(self.lootTarget:GetGUID());
			self.blacklistLootTimer = GetTimeEX() + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
		end

		--if grind2IsLootSafeToLoot:anyTargetNearLoot(self.lootTarget) then
		--	return;
		--end

		-- move to loot target
		local xx, yy, zz = self.lootTarget:GetPosition();

		if self.lootTarget:GetDistance() > 3 then

			Move(xx, yy, zz);

			return true;
		end

		-- close enough to loot target
		if self.lootTarget:GetDistance() <= 3 then

			self.lootTimerSet = false;
			self.blacklistLootTimer = GetTimeEX() * 2;

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





	