script_hunterChooseAspect = {}

function script_hunterChooseAspect:chooseAspect(targetObj)

if script_hunter.waitTimer > GetTimeEX() then
	return false;
end


-- set variables
	local localObj = GetLocalPlayer();

	local localHealth = localObj:GetHealthPercentage();

	local localMana = localObj:GetManaPercentage();

	local localLevel = localObj:GetLevel();

	hasHawk = HasSpell("Aspect of the Hawk");

	hasMonkey = HasSpell("Aspect of the Monkey");

	hasCheetah = HasSpell("Aspect of the Cheetah");



-- jump if we are sitting
	if not IsStanding() and not IsEating() and not IsDrinking() then 
		JumpOrAscendStart();
	end
	


-- use aspect of the mokney
	if (hasMonkey) and (localObj:GetLevel() < 10) then 

		if (not localObj:HasBuff('Aspect of the Monkey')) then  

			CastSpellByName('Aspect of the Monkey'); 

			script_hunter.waitTimer = GetTimeEX() + 1550;

			return true; 
		end
	end



-- use aspect of the monkey if target is too close
	if (hasMonkey) and (targetObj ~= nil) and (targetObj ~= 0) then

		if (targetObj:GetDistance() <= script_hunter.meleeDistance) and (IsInCombat()) and (localHealth <= 50) then

			if (not localObj:HasBuff('Aspect of the Monkey')) then  

				CastSpellByName('Aspect of the Monkey'); 

				script_hunter.waitTimer = GetTimeEX() + 1550;

				return true; 
			end
		end
	end



-- use aspect of the hawk
	if (targetObj ~= 0) and (targetObj ~= nil) then

		if (hasHawk) and (targetObj:GetDistance() <= 37) and targetObj:GetDistance() >= 12 and (not targetObj:IsDead()) and (targetObj:CanAttack()) then 

			if (not localObj:HasBuff('Aspect of the Hawk')) then 

				CastSpellByName('Aspect of the Hawk'); 

				script_hunter.waitTimer = GetTimeEX() + 1550;

				return true; 
			end 
		end
	end



-- aspect of the cheetah
	if (script_hunter.useCheetah) and (hasCheetah) and (not IsInCombat())
	and (targetObj == nil or target:GetDistance() >= 50) and (localMana > script_hunter.drinkMana + 10) then 

		if (not localObj:HasBuff('Aspect of the Cheetah')) then 

			CastSpellByName('Aspect of the Cheetah'); 

			script_hunter.waitTimer = GetTimeEX() + 1550;

			return true;  
		end 
	end



return false;
end
