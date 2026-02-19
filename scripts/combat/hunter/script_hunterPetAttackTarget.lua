script_hunterPetAttackTarget = {

}

-- check to see if pet is attacking a target attacking me, and if not then pet attack
function script_hunterPetAttackTarget:run()

	-- make sure we have a pet
	if GetPet() ~= 0 and GetPet() ~= nil then

		-- iterate first object
		local i, t = GetFirstObject()

		-- valid object
		while i ~= 0 do

			-- if enemy type is valid
			if (t == 3 or typeObj == 4) and i:GetDistance() <= 50 and not i:IsCritter() and not i:IsDead() and i:CanAttack() then

				-- if a target is targeting me then attack one of them
				if script_grind:isTargetingMe(i) or grind2IsTargetingMe:target(i) then

					-- we need to make sure the pet does have a target before we check for its target... target of target
					if not PetHasTarget() then

						-- get a target attacking me
						PetAttack();
					end

					-- pet has a target
					if PetHasTarget() then

						-- check its target to see if it's the same target that is tattacking me'
						if GetPet():GetUnitsTarget():GetGUID() ~= i:GetGUID() then

							-- apparently we need to target it first either way... pet attack doesn't work without a target
							-- make sure we don't keep interacting with it.
							if PlayerHasTarget() then

								-- if my target isn't the target attacking me then
								if GetLocalPlayer():GetUnitsTarget():GetGUID() ~= i:GetGUID() then

									-- target the target
									i:AutoAttack();

									-- send pet to attack target attacking me
									PetAttack();

									if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
										script_grind.enemyObj = grind2.enemyTarget;
									end
									
									-- interact again with grinder object
									if script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0 and i:GetGUID() ~= script_grind.enemyObj:GetGUID() then
										if not IsAutoCasting("Attack") then
											script_grind.enemyObj:AutoAttack();
										end
									elseif not PlayerHasTarget() then
										TargetNearestEnemy();
									end
								end
							end
						end
					end
				end
			end

		-- iterate next object
		i, t = GetNextObject(i);
		end
	end

return false;
end