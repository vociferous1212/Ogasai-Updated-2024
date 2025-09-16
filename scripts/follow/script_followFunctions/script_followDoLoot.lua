script_followDoLoot = {}


function script_followDoLoot:doLoot(localObj)

	if (script_follow.lootObj ~= nil) then

		local _x, _y, _z = script_follow.lootObj:GetPosition();

		local dist = script_follow.lootObj:GetDistance();
	
		-- Loot checking/reset target
		if (GetTimeEX() > script_follow.lootCheck['timer']) then

			if (script_follow.lootCheck['target'] == script_follow.lootObj:GetGUID()) then

				script_follow.lootObj = nil; -- reset lootObj

				ClearTarget();

				script_follow.message = 'Reseting loot target...';
			end

			script_follow.lootCheck['timer'] = GetTimeEX() + 10000; -- 5 sec

			if (script_follow.lootObj ~= nil) then 

				script_follow.lootCheck['target'] = script_follow.lootObj:GetGUID();
			else

				script_follow.lootCheck['target'] = 0;
			end

			return;
		end
	
		if(dist <= script_follow.lootDistance) then

			script_follow.message = "Trying to loot before we follow leader...";

			if (IsMoving() and not localObj:IsMovementDisabed()) then

				StopMoving();

				script_follow.waitTimer = GetTimeEX() + 350;

				return;
			end
	
			if(not IsStanding()) then

				StopMoving();

				script_follow.waitTimer = GetTimeEX() + 350;

				return;
			end
	
			-- Dismount
			if (IsMounted()) then 

				DisMount();

				script_follow.waitTimer = GetTimeEX() + 350;

				return;
			end
	
			if(not script_follow.lootObj:UnitInteract() and not IsLooting()) then

				script_follow.waitTimer = GetTimeEX() + 550;

				return;
			end
	
			if (not LootTarget()) then

				script_follow.waitTimer = GetTimeEX() + 250;

				return;
			else

				script_follow.lootObj = nil;

				script_follow.waitTimer = GetTimeEX() + 250;
			end

		elseif (script_follow.lootObj ~= nil) and script_follow.lootObj ~= 0 then

			script_navEX:moveToTarget(GetLocalPlayer(), _x, _y, _z);

			if not IsMoving()  then

				Move(_x, _y, _z); script_follow.message = "Nav broke...";
			end
		end
	end
end