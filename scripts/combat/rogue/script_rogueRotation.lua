script_rogueRotation = {}

function script_rogueRotation:run(targetGUID)

		-- Assign the target 
		local targetObj = GetGUIDObject(targetGUID);

		-- set variables
		local localObj = GetLocalPlayer();
		local localEnergy = localObj:GetEnergy();
		local localHealth = localObj:GetHealthPercentage();
		local localLevel = localObj:GetLevel();
		script_grind.eatHealth = script_rogue.eatHealth;
		script_grind.drinkMana = 0;
		script_grind.combatScriptRange = script_rogue.meleeDistance;

		if (targetObj ~= 0) then

			-- Cant Attack dead targets
			if (targetObj:IsDead() or not targetObj:CanAttack()) then
				return 0;
			end
			
			-- if sitting then stand
			if (not IsStanding()) then
				StopMoving();
			end
		
			-- Auto Attack
			if (targetObj:GetDistance() < 40) and (not IsMoving()) and (not IsAutoCasting("Attack")) and (not script_rogue.useStealth) then
				targetObj:AutoAttack();
			-- stops spamming auto attacking while moving to target
			elseif (targetObj:GetDistance() <= 8) and (not IsAutoCasting("Attack")) and (not script_rogue.useStealth) then
				targetObj:AutoAttack();
			end
			
			-- auto face target
			if (script_rogue.enableFaceTarget and not targetObj:FaceTarget() and targetObj:IsInLineOfSight()) then
				targetObj:FaceTarget();
			end

			-- set target health variable
			targetHealth = targetObj:GetHealthPercentage();

			-- Don't attack if we should rest first
			if (localHealth < script_rogue.eatHealth and not script_grind:isTargetingMe(targetObj)
				and targetHealth > 99 and not targetObj:IsStunned()) and not IsInCombat() then
				script_rogue.message = "Need rest...";
				return 4;
			end

			-- Check: if we target player pets/totems
			if (GetTarget() ~= nil and targetObj ~= nil) then
				if (UnitPlayerControlled("target") and GetTarget() ~= localObj) then 
					script_grind:addTargetToBlacklist(targetObj:GetGUID());
					return 5; 
				end
			end 

-- pickpocket
				if (targetObj:GetDistance() <= 5 and script_rogue.useStealth and HasSpell("Pick Pocket") and IsStealth()) and (targetObj:GetCreatureType()== "Humanoid" or targetObj:GetCreatureType() == "Undead") and (script_rogue.usePickPocket) and (not script_rogue.pickpocketUsed) and (not IsLooting()) then
					if (GetTarget() == 0) then
						TargetNearestEnemy();
					end
					if (IsMoving()) then
						StopMoving();
					return;
					end
						script_rogue.tickRate = 0;
						script_rogue.pickpocketUsed = true;
						CastSpellByName("Pick Pocket", targetObj);
						LootTarget();
						script_rogue.waitTimer = GetTimeEX() + 750;
					if (IsLooting()) then
						LootTarget();
						return;
					end
					LootTarget();
					return;
				end


			-- Opener ROTATION
			
-- Opener
			if (not IsInCombat()) then
				script_rogue.targetObjGUID = targetObj:GetGUID();
				script_rogue.message = "Pulling " .. targetObj:GetUnitName() .. "...";

				-- Stealth in range if enabled
				if (script_rogue.useStealth and targetObj:GetDistance() <= script_rogue.stealthRange) and (not script_checkDebuffs:hasPoison()) then
					if (not IsStealth()) then
						CastStealth();
					end
					-- Use sprint (when stealthed for pull)
					if (HasSpell("Sprint")) and (not IsSpellOnCD("Sprint")) and (IsStealth()) then
						CastSpellByName("Sprint");
					end
				end	

				LootTarget();

				-- Open with stealth opener
				if (targetObj:GetDistance() <= 4 and (script_rogue.useStealth or IsStealth()) and HasSpell(script_rogue.stealthOpener) and IsStealth()) and ((script_rogue.openerUsed < 3 and script_rogue.usePickPocket) or (not script_rogue.usePickPocket and script_rogue.openerUsed < 2)) and (not IsLooting()) then
					LootTarget();
					if (script_rogue:spellAttack(script_rogue.stealthOpener, targetObj)) then
						LootTarget();
						script_rogue.waitTimer = GetTimeEX() + 1350;
						script_grind:setWaitTimer(1350);
						script_rogue.openerUsed = script_rogue.openerUsed + 1;
						return 0;
					end
					LootTarget();
				end

				-- Check if we are in melee range
				if (targetObj:GetDistance() > script_rogue.meleeDistance) or (not targetObj:IsInLineOfSight()) and (PlayerHasTarget()) and (not IsStealth()) then
					LootTarget();
				end

				-- Use CP generator attack 
				if (localEnergy >= script_rogue.cpGeneratorCost) and (HasSpell(script_rogue.cpGenerator)) and (targetObj:GetDistance() <= 4) and ((script_rogue.openerUsed >= 3 and script_rogue.usePickPocket) or (not script_rogue.usePickPocket and script_rogue.openerUsed >= 2)) and (not IsLooting()) then
					LootTarget();
					script_rogue:spellAttack(script_rogue.cpGenerator, targetObj);
					script_rogue.openerUsed = 0;
					return 0;
				end
				
				

				-- now in Combat
			else	

				script_rogue.message = "Killing " .. targetObj:GetUnitName() .. "...";

				local localCP = GetComboPoints("player", "target");

				if (IsLooting()) then
					LootTarget();
					return;
				end
				LootTarget();
				script_rogue.pickpocketUsed = false;
				script_rogue.openerUsed = 0;

				-- Dismount
				if (IsMounted()) then
					DisMount();
				end


				CheckRacialSpells();
	
				-- Combat Rotation 2 COMBAT ROTATION 2
				if (script_rogue.rotationTwo) then
					script_rogue.message = "Using Combat Rotation 2!";

						-- Check: Kick if the target is casting
					if (HasSpell("Kick") and targetObj:IsCasting() and not IsSpellOnCD("Kick")) then
						script_rogue.message = "Waiting for Kick Energy Combat Rotation 2";
						if (localEnergy >= 25) then 
							return 0; 
						end
						if (Cast("Kick", targetObj)) then
						script_rogue.message = "Using Riposte Combat Rotation 2";

							return 0;
						end
					end

						-- check: Kidney shot if target is casting and kick is on cooldown
					if (script_rogue.useKidneyShot) then
						if (HasSpell('Kidney Shot')) and (localCP >= 1 ) and (targetObj:IsCasting()) and (not IsSpellOnCD('Kidney Shot')) then
							if (localEnergy >= 25) then
								script_rogue.message = "Waiting for Kidney Shot Energy Combat Rotation 2";
								return 0;
							end
							if (Cast('Kidney Shot', targetObj)) then
							script_rogue.message = "Using Kidney Shot Combat Rotation 2";
								return 0;
							end
						end
					end

				-- Gouge if target casting
					if (HasSpell("Gouge")) and (not IsSpellOnCD("Gouge")) and (localEnergy >= 45) and (targetObj:IsCasting()) then
						if (CastSpellByName("Gouge", targetObj)) then
							script_rogue.waitTimer = GetTimeEX() + 250;
							return 0;
						end
					end

					if (HasSpell("Ghostly Strike")) and (not IsSpellOnCD("Ghostly Strike")) and (localEnergy >= 40) and ( (targetHealth >= 25 and localHealth >= 25) or (localHealth <= 25) ) then
						if (CastSpellByName("Ghostly Strike", targetObj)) then
							script_rogue.waitTimer = GetTimeEX() + 1200;
							return 0;
						end
					end

					-- check riposte
					if (HasSpell("Riposte")) and (script_rogue:canRiposte() and not IsSpellOnCD("Riposte")) and (localEnergy >= 10) then
						if (CastSpellByName("Riposte", targetObj)) then
							script_rogue.message = "Using Riposte Combat Rotation 2";
							return 0;
						end
					end

					-- Use Blade Flurry on CD targets > 1
					if (script_rogue.enableBladeFlurry) then
						if (HasSpell("Blade Flurry")) and (not IsSpellOnCD("Blade Flurry")) and (targetHealth > 50) then
							if (script_helper:enemiesAttackingUs(5) >= 1) then
								CastSpellByName("Blade Flurry");
								script_rogue.message = "Using Blade Flurry Combat Rotation 2";
								return 0;
							end
						end
					end

					-- Use adrenaline Rush on CD targets > 1
					if (script_rogue.enableAdrenRush)then
						if (HasSpell("Adrenaline Rush")) and (not IsSpellOnCD("Adrenaline Rush")) and (targetHealth > 60) then
							if (script_helper:enemiesAttackingUs(5) >= 1) then
								CastSpellByName("Adrenaline Rush");
								script_rogue.message = "Using Adrenaline Rush Combat Rotation 2";
								return 0;
							end
						end
					end

					-- Slice and Dice at 2 combo points
					if (localCP > 2) and (HasSpell("Slice and Dice")) then
						if (not localObj:HasBuff('Slice and Dice')) and (targetHealth > 25) and (localEnergy >= 25) then
							CastSpellByName('Slice and Dice', targetObj);
							script_rogue.message = "Using Slice and Dice Combat Rotation 2";
							return 0;
						end
					end

					-- Eviscerate
					if (localCP > 1) and (targetHealth < 15) and (localEnergy >= 35) then
						CastSpellByName('Eviscerate', targetObj);
						script_rogue.messsage = "Using Eviscerate Combat Rotation 2";
						return 0; -- return until we use Eviscerate
					end

					-- eviscerate at 5 CP only
					if (localCP == 5) then
						if localObj:HasBuff('Slice and Dice') and (targetHealth > 25) and (localEnergy >= 35) then
							CastSpellByName('Eviscerate', targetObj);
							script_rogue.messsage = "Using Eviscerate 5 Combo Points Combat Rotation 2";
							return 0; -- return until we use Eviscerate
						end
					end

					-- Eviscerate
					if (localCP < 5) then
						if (localEnergy >= script_rogue.cpGeneratorCost) and (HasSpell(script_rogue.cpGenerator)) then
							if (script_rogue:spellAttack(script_rogue.cpGenerator, targetObj)) then
								script_rogue.waitTimer = GetTimeEX() + 250;
								script_rogue.message = "Using Combo Points Generator Attack Combat Rotation 2";
								return 0;
							end
						end
					end
				end

				-- Combat rotation 1
				if (not script_rogue.rotationTwo) then
					script_rogue.message = "Killing " .. targetObj:GetUnitName() .. "...";
					-- Dismount
					if (IsMounted()) then
						DisMount();
					end

					-- Check if we are in melee range
					if (targetObj:GetDistance() > script_rogue.meleeDistance or not targetObj:IsInLineOfSight()) and (PlayerHasTarget()) then
						return 3;
					end

					if (script_rogue.enableFaceTarget and not targetObj:FaceTarget() and targetObj:IsInLineOfSight()) then
						targetObj:FaceTarget();
					end

					-- Check: Use Healing Potion 
					if (localHealth < script_rogue.potionHealth) then 
						if (script_helper:useHealthPotion()) then 
							return 0; 
						end 
					end

					-- Check: Kick if the target is casting
					if (HasSpell("Kick") and targetObj:IsCasting() and not IsSpellOnCD("Kick")) and (localEnergy >= 25) then
						if (Cast("Kick", targetObj)) then
							return 0;
						end
					end

					-- check: Kidney shot if target is casting and kick is on cooldown
					if (script_rogue.useKidneyShot) then
						if (HasSpell('Kidney Shot')) and (localCP > 0) and (targetObj:IsCasting()) and (not IsSpellOnCD('Kidney Shot')) and (localEnergy >= 25) then
							if (Cast('Kidney Shot', targetObj)) then
								return 0;
							end
						end
					end

					-- Gouge if target casting
					if (HasSpell("Gouge")) and (not IsSpellOnCD("Gouge")) and (localEnergy >= 45) and (targetObj:IsCasting()) then
						if (CastSpellByName("Gouge", targetObj)) then
							script_rogue.waitTimer = GetTimeEX() + 250;
							return 0;
						end
					end

					-- Use Blade Flurry on CD targets > 1
					if (script_rogue.enableBladeFlurry) then
						if (HasSpell("Blade Flurry")) and (not IsSpellOnCD("Blade Flurry")) and (targetHealth >= 50) and (localEnergy >= 25) then
							if (script_helper:enemiesAttackingUs(5) >= 1) then
								CastSpellByName("Blade Flurry");
								return 0;
							end
						end
					end

					-- Use adrenaline Rush on CD targets > 1
					if (script_rogue.enableAdrenRush)then
						if (HasSpell("Adrenaline Rush")) and (not IsSpellOnCD("Adrenaline Rush")) and (targetHealth >= 60) then
							if (script_helper:enemiesAttackingUs(5) >= 1) then
								CastSpellByName("Adrenaline Rush");
								return 0;
								
							end
						end
					end

					if (HasSpell("Ghostly Strike")) and (not IsSpellOnCD("Ghostly Strike")) and (localEnergy >= 40) and ( (targetHealth >= 25 and localHealth >=25) or (localHealth <= 25) ) then
						CastSpellByName("Ghostly Strike", targetObj);
						return 0;
					end

					-- Check: Use Riposte whenever we can
					if (HasSpell("Riposte")) and (script_rogue:canRiposte() and not IsSpellOnCD("Riposte")) and (localEnergy >= 10) then 
						CastSpellByName("Riposte", targetObj);
						return 0; -- return until we cast Riposte 
					end
			
					-- Check: Use Evasion if low HP
					if (localHealth <= script_rogue.evasionHealth) then
						if (HasSpell('Evasion') and not IsSpellOnCD('Evasion')) then
							CastSpellByName('Evasion');
							return 0;
						end
					end 
 
					-- Eviscerate with 5 CPs
					if (localCP == 5) and (localEnergy >= 35) then
						CastSpellByName('Eviscerate', targetObj);
						return 0; -- return until we use Eviscerate
					end
			
					-- Keep Slice and Dice up
					if (HasSpell("Slice and Dice")) then
						if (script_rogue.useSliceAndDice and not localObj:HasBuff('Slice and Dice') and targetHealth > 50 and localCP > 0) and (localEnergy >= 25) then 
							CastSpellByName("Slice and Dice");
							return 0;
						end
					end

					-- Dynamic health check when using Eviscerate between 1 and 4 CP
					if (targetHealth < (10*localCP)) and (localEnergy >= 35) then
						CastSpellByName('Eviscerate', targetObj);
						return 0; -- return until we use Eviscerate
					end

					-- Use CP generator attack 
					if ((localEnergy >= script_rogue.cpGeneratorCost) and HasSpell(script_rogue.cpGenerator)) then
						if (CastSpellByName(script_rogue.cpGenerator, targetObj)) then
							return 0;
						end
					end
				end
			end
		end
end