script_followPlayerIsDead = {}

function script_followPlayerIsDead:playerIsDead()

	local localObj = GetLocalPlayer();

-- Corpse-walk if we are dead
	if(localObj:IsDead()) then

		script_follow.tickRate = 100;

		script_follow.message = "Walking to corpse...";

-- Release body
		if(not IsGhost()) then

			RepopMe(); 

		return;
		end

-- Ressurrect within the ress distance to our corpse
		local _lx, _ly, _lz = localObj:GetPosition();
		
		if (GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_follow.ressDistance) then

			script_nav:moveToNav(localObj, GetCorpsePosition());
			script_follow.message = "Running to corpse...";

			return;
		else

			local rx, ry, rz = GetCorpsePosition();
-- safe res
			if (script_aggro:safeRess(rx, ry, rz, script_grind.ressDistance)) then

				script_grind.message = "Finding a safe spot to ress...";
			return;
			end
-- retrieve corpse
		RetrieveCorpse();

		end
	return;
	end
end