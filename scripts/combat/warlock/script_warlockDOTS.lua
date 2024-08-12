script_warlockDOTS = {

	waitTimer = 0,

}

function script_warlockDOTS:getTargetNotDOT()

	local unitsAttackingUs = 0; 
   	local currentObj, typeObj = GetFirstObject();

if (IsInCombat()) then 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) and (not currentObj:IsCritter()) then
               			if (script_grind:isTargetingMe(currentObj))
					or (script_grind:isTargetingPet(currentObj))
					then
					if (HasSpell("Corruption") and not currentObj:HasDebuff('Corruption') and not script_warlockFunctions:targetHasCorruption(currentObj))
					or (HasSpell("Immolate") and not currentObj:HasDebuff("Immolate") and not script_warlockFunctions:targetHasImmolate(currentObj))
					or (HasSpell("Curse of Agony") and not currentObj:HasDebuff("Curse of Agony") and not script_warlockFunctions:targetHasCurseOfAgony(currentObj))
					then
           				return currentObj;
              	 			end 
				end
			end
           	end 
        currentObj, typeObj = GetNextObject(currentObj)
       	end
end
 
return nil;
end

-- get a target that has DOTS if needed... maybe by health and focus to kill that one?
function script_warlockDOTS:getTargetDOT()

	local unitsAttackingUs = 0; 
   	local currentObj, typeObj = GetFirstObject(); 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) and (not currentObj:IsCritter()) then
               			if (script_grind:isTargetingMe(currentObj))
					or (script_grind:isTargetingPet(currentObj))
					then
					if (currentObj:HasDebuff('Corruption') or script_warlockFunctions:targetHasCorruption(currentObj))
					or (currentObj:HasDebuff("Immolate") or script_warlockFunctions.targetHasImmolate(currentObj))
					or (currentObj:HasDebuff("Curse of Agony") or script_warlockFunctions.targetHasCurseOfAgony(currentObj))
					then
           				return currentObj;
              	 			end 
				end
			end
           	end 
        currentObj, typeObj = GetNextObject(currentObj); 
       	end
return nil;
end

function script_warlockDOTS:corruption() 
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	local mana = localObj:GetManaPercentage();
	if (IsInCombat()) and (mana >= 15) and (HasSpell("Corruption")) then
		while currentObj ~= 0 do 
			if typeObj == 3 then
				if (currentObj:CanAttack()) and (not currentObj:IsDead()) and (not currentObj:IsCritter()) then
					if (currentObj:GetDistance() <= 28) then
						if (not currentObj:HasDebuff("Corruption") and not script_warlockFunctions:targetHasCorruption(currentObj)) and (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) then
								script_grind.tickRate = 250;
								script_rotation.tickRate = 250;
							end
							currentObj:FaceTarget();
							script_warlockFunctions:cast('Corruption', currentObj);
							script_grind:setWaitTimer(2500);
							script_warlock.waitTimer = GetTimeEX() + 2500;
							ClearTarget();
							return; 
						end 
					end 
				end 
			end
        	currentObj, typeObj = GetNextObject(currentObj); 
		end
	end
return false;
end

function script_warlockDOTS:immolate() 
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	local mana = localObj:GetManaPercentage();
	if (IsInCombat()) and (mana >= 40) and (HasSpell("Immolate")) then
		while currentObj ~= 0 do 
			if typeObj == 3 then
				if (currentObj:CanAttack()) and (not currentObj:IsDead()) and (not currentObj:IsCritter()) then
					if (currentObj:GetDistance() <= 28) then
						if (not currentObj:HasDebuff("Immolate") and not script_warlockFunctions:targetHasImmolate(currentObj)) and (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) then
								script_grind.tickRate = 250;
								script_rotation.tickRate = 250;
							end
							currentObj:FaceTarget();
							if (not script_warlockFunctions:cast('Immolate', currentObj)) then 
								script_grind:setWaitTimer(3000);
								script_warlock.waitTimer = GetTimeEX() + 3000;
								return; 
							end
						end 
					end 
				end 
			end
        	currentObj, typeObj = GetNextObject(currentObj); 
		end
	end
return false;
end

function script_warlockDOTS:curseOfAgony() 
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	local mana = localObj:GetManaPercentage();
	if (IsInCombat()) and (mana >= 15) and (HasSpell("Curse of Agony")) then
		while currentObj ~= 0 do 
			if typeObj == 3 then
				if (currentObj:CanAttack()) and (not currentObj:IsDead()) and (not currentObj:IsCritter()) then
					if (currentObj:GetDistance() <= 28) then
						if (not currentObj:HasDebuff("Curse of Agony") and not script_warlockFunctions:targetHasCurseOfAgony(currentObj)) and (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) then
								script_grind.tickRate = 250;
								script_rotation.tickRate = 250;
							end
							currentObj:FaceTarget();
							if (not script_warlockFunctions:cast('Curse of Agony', currentObj)) then 
								script_grind:setWaitTimer(2500);
								script_warlock.waitTimer = GetTimeEX() + 2500;
								ClearTarget();
								return; 
							end
						end 
					end 
				end 
			end
        	currentObj, typeObj = GetNextObject(currentObj); 
		end
	end
return false;
end

-- more than 1 target is attacking me or pet then cast DOTS
function script_warlockDOTS:DOTAdds()
	if (script_grind:enemiesAttackingUs() > 1) and (not script_warlock.warlockDOTS) then

		if (self.waitTimer > GetTimeEX()) then
			return;
		end

		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if script_grind:isTargetingMe(i) then
					if (not script_warlockFunctions:targetHasImmolate(i)) or (not script_warlockFunctions:targetHasCurseOfAgony(i)) or (not script_warlockFunctions:targetHasCorruption(i)) then
						if (targetObj:GetDistance() > 28) or (not targetObj:IsInLineOfSight()) then
							return 3;
						end

						if (script_warlockDOTS:corruption()) then
							self.waitTimer = GetTimeEX() + 1000;
							script_warlock.waitTimer = GetTimeEX() + 1500;
							return true;
						end
						if (script_warlockDOTS:curseOfAgony()) then
							self.waitTimer = GetTimeEX() + 1000;
							script_warlock.waitTimer = GetTimeEX() + 1500;
							return true;
						end
						if (script_warlockDOTS:immolate()) then
							self.waitTimer = GetTimeEX() + 1000;
							script_warlock.waitTimer = GetTimeEX() + 1500;
							return true;
						end
						ClearTarget();
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end
