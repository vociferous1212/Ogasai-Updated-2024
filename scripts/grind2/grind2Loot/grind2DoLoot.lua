grind2DoLoot = {

	lootTarget = nil,

	lootDistance = 100,

	timer = 0,

	lootTimer = 0,

	blacklistLootTimer = 0,

	lootTargetDistance = 2.5

}

function grind2DoLoot:run()

	if self.blacklistLootTimer == 0 or self.blacklistLootTimer == nil then

		self.blacklistLootTimer = GetTimeEX();
	end

	local player = GetLocalPlayer();

	-- return false if and do not run script if any target is targeting player
	if (IsAnyTargetTargetingPlayer() or IsCasting() or IsChanneling()) and not IsLooting() then

		return false;
	end
	
	-- return if timer is not done yet - wait
	if self.timer > GetTimeEX() then

		return true;
	end
	-- loot target if we skinned a target and the loot target turned nil
	if IsLooting() and GetTimeEX() > self.timer then

		LootTarget();


		if StaticPopup1:IsVisible() then

			StaticPopup1Button1:Click()
		end

		self.timer = GetTimeEX() + grind2AdjustTimersMenu.doLootTimer;
		grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
		return false;

	end

	-- get loot target
	self.lootTarget = grind2FindLoot:target(self.lootDistance);

	-- get skin target
	if (self.lootTarget == nil or self.lootTarget == 0) and HasSpell("Skinning") then

		self.lootTarget = grind2FindSkinTarget:target(self.lootDistance);
	end

	-- do loot if we have a loot taregt
	if self.lootTarget ~= nil and self.lootTarget ~= 0 and not player:IsDead() and not IsAnyTargetTargetingPlayer() then

		-- don't loot blacklisted targets
		if grind2BlacklistLoot:isLootTargetBlacklisted(self.lootTarget:GetGUID()) then
			self.lootTarget = nil;
		end		

		-- add loot target to blacklist
		if GetTimeEX() > self.blacklistLootTimer then
			grind2BlacklistLoot:addLootTargetToBlacklist(self.lootTarget:GetGUID());
			self.blacklistLootTimer = GetTimeEX() + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
		end

		if grind2IsLootSafeToLoot:isAnyTargetNearLoot(self.lootTarget) then
			return false;
		end

		-- move to loot target
		local xx, yy, zz = self.lootTarget:GetPosition();

		if self.lootTarget:GetDistance() > self.lootTargetDistance then

			grind2MoveToTarget:run(player, xx, yy, zz);

			if not IsMoving() then
				Move(xx, yy, zz);
			end

			return true;
		end

		-- close enough to loot target
		if self.lootTarget:GetDistance() <= 3 then

			-- reset loot timer if we reach target
			--self.blacklistLootTimer = GetTimeEX() * 2;

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

				self.timer = GetTimeEX() + grind2AdjustTimersMenu.doLootTimer;
				grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);

				return false;
			end

			-- interact with the target to loot
			if self.lootTarget:UnitInteract() then
					
				self.timer = GetTimeEX() + grind2AdjustTimersMenu.doLootTimer;
				return true;
			end

			return true;
		end

		return true;
	end	

	return false;
end





	