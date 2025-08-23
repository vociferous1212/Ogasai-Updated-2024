script_grindValidEnemy = {}

function script_grindValidEnemy:enemyIsValid(i)
    -- We have a valid enemy in object manager

    if (i ~= 0) and i ~= nil then

        -- If target distance is close enough and in line of sight and is targeting group then return target
        if (i:GetDistance() < 50) and (i:IsInLineOfSight()) and (script_grindParty.forceTarget) then
            if (script_grind:isTargetingGroup(i)) then
            end
        end

        -- Add target to blacklist if not a safe pull from aggro script
        if (script_grind.hotspotReached or _quest.usingQuester) and (script_grind.skipHardPull) and (i:GetDistance() <= 65) and (not script_aggro:safePull(i)) and (not script_grind:isTargetBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) and (i:GetLevel() >= GetLocalPlayer():GetLevel() - 3) then
            script_grind:addTargetToBlacklist(i:GetGUID());
        end

        -- Add elite to blacklist
        if (script_grind.skipElites) and (i:GetDistance() <= 65) and (i:GetClassification() == 1 or i:GetClassification() == 2) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) then
            DEFAULT_CHAT_FRAME:AddMessage("Blacklisting Elite " .. i:GetUnitName() .. "");
            script_grind:addTargetToHardBlacklist(i:GetGUID());
        end

        -- Add above maxLevel to blacklist
        if (script_grind.skipHardPull) and (i:GetDistance() <= 65) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) and (not script_grind:isTargetingMe(i)) and (i:GetLevel() > script_grind.maxLevel) then
            script_grind:addTargetToHardBlacklist(i:GetGUID());
            DEFAULT_CHAT_FRAME:AddMessage("Blacklisting " .. i:GetUnitName() .. ", too high level...");
        end

        -- Add selected target name to blacklist
        if (i:GetUnitName() == script_grind.blacklistTargetName or i:GetUnitName() == script_grind.blacklistTargetName2) and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) then
            script_grind:addTargetToHardBlacklist(i:GetGUID());
        end

        -- Get player position
        local px, py, pz = GetLocalPlayer():GetPosition();

        -- Get hotspot position
        local hotspot_x, hotspot_y, hotspot_z = script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ;

	-- use quester hotspot locations of using quester
	if _quest.usingQuester then 
		hotspot_x, hotspot_y, hotspot_z = _questDB:getQuestGrindPos();
	end

        -- Get target distance and position
        local _x = i:GetDistance();
        local tx, ty, tz = i:GetPosition();

        -- Get distance from player to hotspot
        local _y = script_nav:getDistanceToHotspot();

	if _quest.usingQuester then
		_y = _quest.distToGrind;
	end

        -- Calculate actual distance from hotspot to target
        local dist_to_hotspot = math.sqrt((tx - hotspot_x)^2 + (ty - hotspot_y)^2 + (tz - hotspot_z)^2);

        -- Define ranges
        local max_move_range = script_grind.distToHotSpot;
        local max_target_range = script_grind.pullDistance;

	-- if using quester then set variables
	if _quest.usingQuester then
		max_move_range = _quest.distToGrindFromHotspot;
	end

        -- Check if target is within hotspot range and targeting range for ALL conditions
        local function isTargetInRange()
            return dist_to_hotspot <= max_move_range and _x <= max_target_range;
        end

        -- Valid Targets: Tapped by us, or is attacking us or our pet
        if (script_grind:isTargetingMe(i)
            or (script_grind:isTargetingPet(i) and (i:IsTappedByMe() or not i:IsTapped()))
            or (script_grindParty.forceTarget and script_grind:isTargetingGroup(i) and (i:IsTappedByMe() or not i:IsTapped()))
            or (i:IsTappedByMe() and not i:IsDead())
            -- Avoided target is attacking us
            or ((script_grind:isTargetBlacklisted(i:GetGUID())) and (script_grind:isTargetingMe(i)))
            -- Blacklisted target is attacking us
            or ((script_grind:isTargetHardBlacklisted(i:GetGUID())) and (script_grind:isTargetingMe(i)) and (i:IsInLineOfSight()))
            -- Blacklisted target is polymorphed or feared
            or ((script_grind:isTargetBlacklisted(i:GetGUID())) and (i:HasDebuff("Polymorph") or i:HasDebuff("Fear")) and (script_grind:enemiesAttackingUs() < 2) and (GetNumPartyMembers() <= 1))
            -- Attacking pet
            or ((script_grind:isTargetingPet(i)) and (i:IsInLineOfSight()))) then
            if isTargetInRange() then
                return true;
            end
        end

        -- Don't use avoid targets and don't recheck aggro range targets, only skip hard pulls
        if (script_grind.skipHardPull) and (not script_grind.extraSafe) and (not script_grindEX.avoidBlacklisted)
            and (not script_grind:isTargetBlacklisted(i:GetGUID()))
            and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) then
            if (not i:IsDead() and i:CanAttack() and not i:IsCritter()
                and (i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel)
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
                if isTargetInRange() then
                    return true;
                end
            end
        end

        -- Don't skip blacklisted or avoid targets - attack these targets
        if (not script_grind.skipHardPull) then
            if (not i:IsDead() and i:CanAttack() and not i:IsCritter()
                and (i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel)
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
                if isTargetInRange() then
                    return true;
                end
            end
        end

        -- These are targets that are not avoided or blacklisted, with extra safety
        if (script_grind.skipHardPull) and (script_grind.extraSafe)
            and (not script_grind:isTargetBlacklisted(i:GetGUID()))
            and (not script_grind:isTargetHardBlacklisted(i:GetGUID())) then
            if (not i:IsDead() and i:CanAttack() and not i:IsCritter()
                and (i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel)
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
                if isTargetInRange() then
                    return true;
                end
            end
        end

        -- Recheck targets: Blacklisted targets moved away from others
        if (script_grind.skipHardPull) and (script_grind.extraSafe)
            and (i:GetDistance() <= 65)
            and (script_grind:isTargetBlacklisted(i:GetGUID()))
            and (script_aggro:safePullRecheck(i)) then
            if (not script_grind:isTargetHardBlacklisted(i:GetGUID()))
                and (not i:IsDead() and i:CanAttack() and not i:IsCritter()
                and (i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel)
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
                if isTargetInRange() then
                    script_grind.enemyObj = currentObj; -- Force bot to keep this target
                    return true;
                end
            end
        end

        -- Recheck targets: Allow pulling avoid targets from a safe range
        if (script_grind.skipHardPull)
            and (script_grind.extraSafe)
            and (script_grind:isTargetBlacklisted(i:GetGUID()))
            and (script_grind.safePullAvoidTargets)
            and (script_aggro:safePullRecheck(i))
            and (i:GetDistance() <= 35) then
            if (not script_grind:isTargetHardBlacklisted(i:GetGUID()))
                and (not i:IsDead() and i:CanAttack() and not i:IsCritter()
                and (i:GetLevel() <= script_grind.maxLevel and i:GetLevel() >= script_grind.minLevel)
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
                if isTargetInRange() then
                    script_grind.enemyObj = currentObj; -- Force bot to keep this target
                    return true;
                end
            end
        end
    end

    return false; -- Target does not meet any valid conditions
end