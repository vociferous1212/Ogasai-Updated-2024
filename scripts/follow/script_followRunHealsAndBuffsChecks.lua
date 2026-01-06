script_followRunHealsAndBuffsChecks = {}

function script_followRunHealsAndBuffsChecks:run()

local localObj = GetLocalPlayer();

-- OUT OF COMBAT PHASE AND IN COMBAT HEALS - it's an ogasai quirk... don't leave open else statements.. use elseif
	-- heals and buffs 
	if (not localObj:IsDead()) and (script_follow.enemyObj ~= nil and script_follow.enemyObj ~= 0) then
		-- heals and buffs out of combat
		if (script_priestFollowerHeals.enableHeals) or (script_shamanFollowerHeals.enableHeals) or (script_druidFollowerHeals.enableHeals) or (script_paladinFollowerHeals.enableHeals) then
			-- Healer check: heal/buff the party
			for i = 1, GetNumPartyMembers() do
				local member = GetPartyMember(i);
				if (not member:IsDead()) and (not localObj:IsDead()) and (not IsMoving()) and (not IsCasting()) and (not IsChanneling()) then
					if (script_followHealsAndBuffs:healAndBuff()) then
						--script_follow.waitTimer = GetTimeEX() + 1550;
						script_follow.message = "Healing/buffing the party...";
						ClearTarget();
						return true;
					end
				end
			end
		end
	else
		script_follow.enemyObj = nil;
		-- heals and buffs in combat force to run it because of 'else'
		-- Healer check: heal/buff the party
		if (script_priestFollowerHeals.enableHeals) or (script_shamanFollowerHeals.enableHeals) or (script_druidFollowerHeals.enableHeals) or (script_paladinFollowerHeals.enableHeals) then
			for i = 1, GetNumPartyMembers() do
				local member = GetPartyMember(i);
				if (not member:IsDead()) and (not localObj:IsDead()) and (not IsMoving()) then
					if (script_followHealsAndBuffs:healAndBuff()) then
						script_follow.message = "Healing/buffing the party...";
						ClearTarget();
						return true;
					end
				end
			end
		end
	end
return false;
end