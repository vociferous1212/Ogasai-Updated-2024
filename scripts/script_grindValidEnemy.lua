script_grindValidEnemy = {}

function script_grindValidEnemy:enemyIsValid(i)

	-- we have a valid enemy in object manager
	if (i ~= 0) and i ~= nil then

	-- if target distance is close enough and in line of sight and is targeting group then return target
		if (i:GetDistance() < 50) and (i:IsInLineOfSight()) and (script_grindParty.forceTarget) then
			if (script_grind:isTargetingGroup(i)) then
				return true;
			end
		end

	-- add target to blacklist not a safe pull from aggro script
		if (script_grind.hotspotReached or _quest.usingQuester) and (script_grind.skipHardPull) and (i:GetDistance() <= 65)and  (not script_aggro:safePull(i)) and (not script_grind:isTargetBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) and (i:GetLevel() >= GetLocalPlayer():GetLevel() -3) then	
			script_grind:addTargetToBlacklist(i:GetGUID());
		end
		
	-- add elite to blacklist
		if (script_grind.skipElites) and (i:GetDistance() <= 65) and (i:GetClassification() == 1 or i:GetClassification() == 2) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) then
			DEFAULT_CHAT_FRAME:AddMessage("Blacklisting Elite " .. i:GetUnitName() .. "");	
			script_grind:addTargetToHardBlacklist(i:GetGUID());
		end

	-- add above maxLevel to blacklist
		if (script_grind.skipHardPull) and (i:GetDistance() <= 65) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) and (i:GetLevel() > script_grind.maxLevel) then
			script_grind:addTargetToHardBlacklist(i:GetGUID());
			DEFAULT_CHAT_FRAME:AddMessage('Blacklisting ' .. i:GetUnitName() .. ', too high level...');

		end

	-- add selected target name to blacklist
		if (i:GetUnitName() == script_grind.blacklistTargetName or i:GetUnitName() == script_grind.blacklistTargetName2) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) then
			script_grind:addTargetToHardBlacklist(i:GetGUID());
		end


	-- try to skip units below us or above us (in water or structure)
		-- has bugs
		--if (script_grind.skipHardPull) and (not script_grind:isTargetBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) then
		--	local tarPosX, tarPosY, tarPosZ = i:GetPosition();
		--	local myPosX, myPosY, myPosZ = GetLocalPlayer():GetPosition();
		--	local posZ = tarPosZ - myPosZ;
		--	if (posZ > 9) then
		--		script_grind:addTargetToBlacklist(i:GetGUID());
		--	end
		--	if (posZ < -9) then
		--		script_grind:addTargetToBlacklist(i:GetGUID());
		--	end
		--end

	-- Valid Targets: Tapped by us, or is attacking us or our pet
		if (script_grind:isTargetingMe(i)
			or (script_grind:isTargetingPet(i) and (i:IsTappedByMe() or not i:IsTapped())) 
			or (script_grindParty.forceTarget and script_grind:isTargetingGroup(i) and (i:IsTappedByMe() or not i:IsTapped())) 
			or (i:IsTappedByMe() and not i:IsDead()))
			-- avoided target is attacking us
			or ((script_grind:isTargetBlacklisted(i:GetGUID())) and (script_grind:isTargetingMe(i)))
			-- blacklisted target is attacking us
			or ((script_grind:isTargetHardBlacklisted(i:GetGUID())) and (script_grind:isTargetingMe(i)) and (i:IsInLineOfSight()))
			-- blacklisted target is polymorphed or feared
			-- bot tries to skip poly and feared targets...	
			or ((script_grind:isTargetBlacklisted(i:GetGUID())) and (i:HasDebuff("Polymorph") or i:HasDebuff("Fear")) and (script_grind:enemiesAttackingUs() < 2) and (GetNumPartyMembers() <= 1))
			-- attacking pet
			or ((script_grind:isTargetingPet(i)) and (i:IsInLineOfSight())) then
				return true; 
		end

	-- don't use avoid targets and don't recheck aggro range targets only skip hard pulls
		-- normal targeting logitechs style
		if (script_grind.skipHardPull) and (not script_grind.extraSafe) and (not script_grindEX.avoidBlacklisted)
			and (not script_grind:isTargetBlacklisted(i:GetGUID()))
			and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) then
			if (not i:IsDead() and i:CanAttack() and not i:IsCritter()
			and ((i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel))
			and i:GetDistance() < script_grind.pullDistance and (not i:IsTapped() or i:IsTappedByMe())
			and not (script_grind.skipUnknown and i:GetCreatureType() == 'Not specified')
			and not (script_grind.skipHumanoid and i:GetCreatureType() == 'Humanoid')
			and not (script_grind.skipDemon and i:GetCreatureType() == 'Demon')
			and not (script_grind.skipBeast and i:GetCreatureType() == 'Beast')
			and not (script_grind.skipElemental and i:GetCreatureType() == 'Elemental')
			and not (script_grind.skipUndead and i:GetCreatureType() == 'Undead') 
			and not (skipAberration and i:GetCreatureType() == 'Abberration') 
			and not (skipDragonkin and i:GetCreatureType() == 'Dragonkin') 
			and not (skipGiant and i:GetCreatureType() == 'Giant') 
			and not (skipMechanical and i:GetCreatureType() == 'Mechanical') 
			and not (script_grind.skipElites and (i:GetClassification() == 1 or i:GetClassification() == 2))
			) then
			return true;
			end
		end
		
	-- don't skip blacklisted or avoid targets - attack these targets
		if (not script_grind.skipHardPull) then
			if (not i:IsDead() and i:CanAttack() and not i:IsCritter()
			and ((i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel))
			and i:GetDistance() < script_grind.pullDistance and (not i:IsTapped() or i:IsTappedByMe())
			and not (script_grind:isTargetHardBlacklisted(i:GetGUID()))
			and not (script_grind.skipUnknown and i:GetCreatureType() == 'Not specified')
			and not (script_grind.skipHumanoid and i:GetCreatureType() == 'Humanoid')
			and not (script_grind.skipDemon and i:GetCreatureType() == 'Demon')
			and not (script_grind.skipBeast and i:GetCreatureType() == 'Beast')
			and not (script_grind.skipElemental and i:GetCreatureType() == 'Elemental')
			and not (script_grind.skipUndead and i:GetCreatureType() == 'Undead') 
			and not (skipAberration and i:GetCreatureType() == 'Abberration') 
			and not (skipDragonkin and i:GetCreatureType() == 'Dragonkin') 
			and not (skipGiant and i:GetCreatureType() == 'Giant') 
			and not (skipMechanical and i:GetCreatureType() == 'Mechanical') 
			and not (script_grind.skipElites and (i:GetClassification() == 1 or i:GetClassification() == 2))
			) then
			return true;
			end
		end


	-- These are targets that are not avoided or blacklisted
	-- valid enemies if we skip hard pulls and recheck targets
		if (script_grind.skipHardPull) and (script_grind.extraSafe)
			and (not script_grind:isTargetBlacklisted(i:GetGUID()))
			and (not script_grind:isTargetHardBlacklisted(i:GetGUID()))
			and (not i:IsDead() and i:CanAttack() and not i:IsCritter()
			and ((i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel))
			and i:GetDistance() < script_grind.pullDistance and (not i:IsTapped() or i:IsTappedByMe())
			and not (script_grind.skipUnknown and i:GetCreatureType() == 'Not specified')
			and not (script_grind.skipHumanoid and i:GetCreatureType() == 'Humanoid')
			and not (script_grind.skipDemon and i:GetCreatureType() == 'Demon')
			and not (script_grind.skipBeast and i:GetCreatureType() == 'Beast')
			and not (script_grind.skipElemental and i:GetCreatureType() == 'Elemental')
			and not (script_grind.skipUndead and i:GetCreatureType() == 'Undead') 
			and not (skipAberration and i:GetCreatureType() == 'Abberration') 
			and not (skipDragonkin and i:GetCreatureType() == 'Dragonkin') 
			and not (skipGiant and i:GetCreatureType() == 'Giant') 
			and not (skipMechanical and i:GetCreatureType() == 'Mechanical') 
			and not (script_grind.skipElites and (i:GetClassification() == 1 or i:GetClassification() == 2))) then
			return true;
		end

	-- RECHECK TARGETS
	-- target blacklisted moved away from other targets
	-- bot can target blacklisted targets under these conditions
		if (script_grind.skipHardPull) and (script_grind.extraSafe)
			and (i:GetDistance() <= 65)
			and (script_grind:isTargetBlacklisted(i:GetGUID()))
			and (script_aggro:safePullRecheck(i)) then

			if (not script_grind:isTargetHardBlacklisted(i:GetGUID()))
				and (not i:IsDead() and i:CanAttack() and not i:IsCritter()
				and ((i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel))
				and i:GetDistance() < script_grind.pullDistance and (not i:IsTapped() or i:IsTappedByMe())
				and not (script_grind.skipUnknown and i:GetCreatureType() == 'Not specified')
				and not (script_grind.skipHumanoid and i:GetCreatureType() == 'Humanoid')
				and not (script_grind.skipDemon and i:GetCreatureType() == 'Demon')
				and not (script_grind.skipBeast and i:GetCreatureType() == 'Beast')
				and not (script_grind.skipElemental and i:GetCreatureType() == 'Elemental')
				and not (script_grind.skipUndead and i:GetCreatureType() == 'Undead') 
				and not (skipAberration and i:GetCreatureType() == 'Abberration') 
				and not (skipDragonkin and i:GetCreatureType() == 'Dragonkin') 
				and not (skipGiant and i:GetCreatureType() == 'Giant') 
				and not (skipMechanical and i:GetCreatureType() == 'Mechanical') 
				and not (script_grind.skipElites and (i:GetClassification() == 1 or i:GetClassification() == 2))
				) then
					-- force bot to keep this target and not recheck safepull over and over again
					script_grind.enemyObj = currentObj;
			return true;
			end
		end

-- RECHECK TARGETS
-- allow bot to try to pull avoid targets from a safe range
		if (script_grind.skipHardPull)
			and (script_grind.extraSafe)
			and (script_grind:isTargetBlacklisted(i:GetGUID()))
			and (script_grind.safePullAvoidTargets) and (script_aggro:safePullRecheck(i)) and (i:GetDistance() <= 35) then
			if (not script_grind:isTargetHardBlacklisted(i:GetGUID()))
				and (not i:IsDead() and i:CanAttack() and not i:IsCritter()
				and ((i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel))
				and i:GetDistance() < script_grind.pullDistance and (not i:IsTapped() or i:IsTappedByMe())
				and not (script_grind.skipUnknown and i:GetCreatureType() == 'Not specified')
				and not (script_grind.skipHumanoid and i:GetCreatureType() == 'Humanoid')
				and not (script_grind.skipDemon and i:GetCreatureType() == 'Demon')
				and not (script_grind.skipBeast and i:GetCreatureType() == 'Beast')
				and not (script_grind.skipElemental and i:GetCreatureType() == 'Elemental')
				and not (script_grind.skipUndead and i:GetCreatureType() == 'Undead') 
				and not (skipAberration and i:GetCreatureType() == 'Abberration') 
				and not (skipDragonkin and i:GetCreatureType() == 'Dragonkin') 
				and not (skipGiant and i:GetCreatureType() == 'Giant') 
				and not (skipMechanical and i:GetCreatureType() == 'Mechanical') 
				and not (script_grind.skipElites and (i:GetClassification() == 1 or i:GetClassification() == 2))
				) then
					-- force bot to keep this target and not recheck safepull over and over again
					script_grind.enemyObj = currentObj;
			return true;
			end
		end
	end
	return false;
end
