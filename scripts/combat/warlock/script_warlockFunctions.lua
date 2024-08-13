script_warlockFunctions = {}

-- used to turn off wand casting else it will 'stutter' and cause a wait timer lag
function script_warlockFunctions:doesTargetHaveAllDots(target)
	local a = HasSpell("Immolate"); local b = HasSpell("Corruption"); local c = HasSpell("Curse of Agony"); local d = HasSpell("Siphon Life");
	if (target ~= 0 and target ~= nil) and (GetLocalPlayer():GetManaPercentage() >= 15) and (target:GetHealthPercentage() > 30) then
		if ( (a) and script_warlock.enableImmolate and not script_warlockFunctions:targetHasImmolate(target))
		or ( (b) and script_warlock.enableCorruption and not script_warlockFunctions:targetHasCorruption(target))
		or ( (c) and script_warlock.enableCurseOfAgony and not script_warlockFunctions:targetHasCurseOfAgony(target))
		or ( (d) and script_warlock.enableSiphonLife and not IsSpellOnCD("Siphon Life") and not target:HasDebuff("Siphon Life"))
		then
			return false;
		end
	end
return true;
end

function script_warlockFunctions:castImmolate(target)
	if (target ~= 0 and target ~= nil) then
		if (not script_warlockFunctions:targetHasImmolate(target)) then
			if (not targetObj:HasDebuff("Immolate")) then
				if (not IsCasting()) and (not IsChanneling()) then
					CastSpellByName("Immolate");
					return true;
				else
					return 4;
				end
			end
		end
	end
return false;
end
function script_warlockFunctions:castCorruption(target)
	if (target ~= 0 and target ~= nil) then
		if (not script_warlockFunctions:targetHasCorruption(target)) then
			if (not targetObj:HasDebuff("Corruption")) then
				if (not IsCasting()) and (not IsChanneling()) then
					target:FaceTarget();
					CastSpellByName("Corruption");
					return true;
				else
					return 4;
				end
			end
		end
	end
return false;
end

--if a target is targeting me and not my pet then send pet to attack
--only if 2 targets or only check 2 targets

function script_warlockFunctions:petAssistMe()
	local i, t = GetFirstObject();
	if (HasPet() and not GetPet():IsDead()) and (script_grind.enemiesAttackingUs() <= 3) then
		while i ~= 0 do
			if t == 3 then
				if (script_grind:isTargetingMe(i)) and (not script_grind:isTargetingPet(i))
				and (GetPet():GetUnitsTarget():GetGUID() ~=  i:GetGUID()) then
					PetAttack(i);
				end
			end
		i, t = GetNextObject(i); 
		end
	end
end
-- need to make a sperate function to check
function script_warlockFunctions:targetHasImmolate(target)
		local debuffCheck = 10;
	if (PlayerHasTarget()) then
		for i=0, debuffCheck do
			if (target:HasDebuff("Immolate")) then
				return true;
			end
		end
	end
return false;
end

-- might as well do it for the rest because it works
function script_warlockFunctions:targetHasCorruption(target)
		local debuffCheck = 5;
	if (PlayerHasTarget()) then
		for i=0, debuffCheck do
			script_warlock.waitTimer = GetTimeEX() + 200;
			if (target:HasDebuff("Corruption")) then
				return true;
			end
		end
	end
return false;
end

-- checking for debuffs in a way that actually works
function script_warlockFunctions:targetHasCurseOfAgony(target)
			local debuffCheck = 5;
		if (PlayerHasTarget()) then
			for i=0, debuffCheck do
				script_warlock.waitTimer = GetTimeEX() + 200;
				if (target:HasDebuff("Curse of Agony")) then
					return true;
				end
			end
		end
return false;
end

function script_warlockFunctions:cast(spellName, target)
	if (HasSpell(spellName)) then
		if (target:IsSpellInRange(spellName)) then
			if (not IsSpellOnCD(spellName)) then
				if (not IsAutoCasting(spellName)) then
					target:FaceTarget();
					target:TargetEnemy();
					return target:CastSpell(spellName);
				end
			end
		end
	end
	return false;
end

function script_warlockFunctions:petAttack()

	if (HasPet()) then
		PetAttack();
	end
return true;
end

function script_warlockFunctions:getTargetNotFeared()
   	local unitsAttackingUs = 0; 
   	local currentObj, typeObj = GetFirstObject(); 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
               			if ((script_grind:isTargetingMe(currentObj) or script_grind:isTargetingPet(currentObj)) and not currentObj:HasDebuff('Fear')) then 
           		return currentObj;
              	 	end 
           	end 
       	end
        currentObj, typeObj = GetNextObject(currentObj); 
    end
	return nil;
end

function script_warlockFunctions:isAddFeared()
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:HasDebuff("Fear")) then
				script_warlock.addFeared = true; 
				return true;
			else 
				script_warlock.addFeared = false;
			end
		end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
    return false;
end

function script_warlockFunctions:fearAdd(targetObjGUID) 
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) and (currentObj:GetCreatureType() ~= "Undead") then
				if (currentObj:GetGUID() ~= targetObjGUID) and (script_grind:isTargetingMe(currentObj) or script_grind:isTargetingPet(currentObj)) then
					if (not currentObj:HasDebuff("Fear") and currentObj:GetCreatureType() ~= 'Elemental' and not currentObj:IsCritter()) then
						if (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) and (IsInCombat()) then
								script_grind.tickRate = 100;
								script_rotation.tickRate = 100;
							end
							if (script_warlockFunctions:cast("Fear", currentObj)) then
								script_warlock.waitTimer = GetTimeEX() + 2500;
								script_grind:setWaitTimer(2500);
								script_warlock.addFeared = true; 
								return true; 
							end
						end
					end 
				end 
			end 
		end
        currentObj, typeObj = GetNextObject(currentObj); 
	end
    return false;
end

-- Run backwards if the target is within range
function script_warlockFunctions:runBackwards(targetObj, range) 
	local localObj = GetLocalPlayer();
 	if (targetObj ~= 0) and (not script_checkDebuffs:hasDisabledMovement()) then
 		local xT, yT, zT = targetObj:GetPosition();
 		local xP, yP, zP = localObj:GetPosition();
 		local distance = targetObj:GetDistance();
 		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
 		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
 		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;		
 		local moveX, moveY, moveZ = xT + xUV*20, yT + yUV*20, zT + zUV;		
 		if (distance < range and targetObj:IsInLineOfSight()) then
 			script_navEX:moveToTarget(localObj, moveX, moveY, moveZ);
			if (IsMoving()) then
				script_warlock.waitTimer = GetTimeEX() + 1500;
				JumpOrAscendStart();
			end
 			return true;
 		end
	end
	return false;
end

function script_warlockFunctions:petAttackTargetAtackingMe()
	if (not PlayerHasTarget()) or (not PetHasTarget()) then
		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if (script_grind:isTargetingMe(i) or script_grind:isTargetingPet(i)) then
					script_grind.enemyObj = i;
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end

function script_warlockFunctions:doWeHaveSoulStone()

return false;
end

function script_warlockFunctions:applySoulStone()

return false;
end