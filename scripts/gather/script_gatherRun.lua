script_gatherRun = {}

function script_gatherRun:gather()
	
	if(not script_gather.isSetup) then
		script_gather:setup();
	end

	if (script_gather.timer > GetTimeEX()) then
		return true;
	end

	if (not script_gather.timerSet) then
		script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;
		script_gather.timerSet = true;
	end
	
	local tempNode = script_gather:GetNode();
	local newNode = (script_gather.nodeObj == tempNode);
	script_gather.nodeObj = script_gather:GetNode();

	-- set nodes
	if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) then
		script_gather.nodeGUID = script_gather.nodeObj:GetGUID();
		script_gather.lastNode = script_gather.nodeObj;
	end
	
	-- if gather node == 0 and we have a last node object then blacklist it (out of range or left minimap zone)
	if (script_gather.nodeObj == 0 or script_gather.nodeObj == nil) and (not script_gather:isNodeBlacklisted(script_gather.nodeGUID)) then
		if (script_gather.lastNode ~= 0 and script_gather.lastNode ~= nil) then
			script_gather:addNodeToBlacklist(script_gather.lastNode:GetGUID());
			script_gather.nodeObj = 0;
		end
		if (not script_gather.messageSent) and (script_gather.lastNode ~= 0) then
			script_gather.messageSent = true; DEFAULT_CHAT_FRAME:AddMessage("Left gather area of node, or node left visible range, adding to blacklist. "..script_gather.lastNode:GetUnitName().." "..math.floor(script_gather.lastNode:GetDistance()).." (yd)");
		end
	end

	if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) and (not script_gather:isNodeBlacklisted(script_gather.nodeGUID))
	and (script_gatherEX2:isNodeSafeToGather() and script_gather.safeGather or not script_gather.safeGather) then


		script_gather.messageSent = false;
		script_gather.gathering = true;
		local _x, _y, _z = script_gather.nodeObj:GetPosition();
		local dist = script_gather.nodeObj:GetDistance();	
		script_gather.nodeID = script_gather.nodeObj:GetObjectDisplayID();
		--script_gather.dist to use node dist in other scripts...
		script_gather.dist = script_gather.nodeObj:GetDistance();
		-- start to blacklist by nodeID?
		script_gather.nodeGUID = script_gather.nodeObj:GetGUID();
		if (GetTimeEX() > script_gather.blacklistTime) then
			script_gather:addNodeToBlacklist(script_gather.nodeGUID);
			script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;
			script_gather.timerSet = false;
		end
		if (dist < script_gather.lootDistance) then
			if (script_gather.isChest) and (HasForm()) and (script_gather.collectChests) then
				if (IsCatForm()) then
					script_druidEX:removeCatForm();
				end
				if (IsBearForm()) then 
					script_druidEX:removeBearForm();
				end
				if (IsTravelForm) then
					script_druidEX:removeTravelForm();
				end
			end		
			if (IsMoving()) then
				StopMoving();
				script_gather.timer = GetTimeEX() + 950;
				return true;
			end
			if (not IsLooting() and not IsChanneling()) and (not IsMoving()) and (not IsCasting()) and (IsStanding()) then
				script_gather.nodeObj:GameObjectInteract();
				script_gather.timer = GetTimeEX() + 1650;
				return true;
			end
			if (not LootTarget()) and (script_gather.nodeObj:GameObjectInteract()) and (not IsMoving()) and (not IsLooting()) then
				script_gather.timer = GetTimeEX() + 4550;
				script_grind:setWaitTimer(2500);
				_quest:setTimer(2500);
			end
			if (IsLooting()) then
			script_gather.lastNode = 0;
				script_gather.waitTimer = GetTimeEX() + 2500;
				if (LootTarget()) or (IsLooting()) then
					if (script_gather.collectHerbs) then
						script_gather.waitTimer = GetTimeEX() + 2500;
						script_grind:setWaitTimer(5000);
						_quest:setTimer(5000);
					end
				end
				if (script_gather.timerSet) then
					script_gather.timerSet = false;
					script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;
				end
			end
			script_gather.waitTimer = GetTimeEX() + 450;
		else
			if (_x ~= 0) then
				local nDist = math.floor(script_gather.nodeObj:GetDistance());
				if (IsPathLoaded(5)) then
					script_navEX:moveToLoot(GetLocalPlayer(), _x, _y, _z);
					script_gather.messageToGrinder = "" ..nDist.. " (yd) - Nav Script Move";
					return true;
				elseif (IsPathLoaded(5) and not IsMoving()) or (not IsPathLoaded(5)) then
					local px, py, pz = GetLocalPlayer():GetPosition();
					local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
					DrawText("Canont find a path!", _tX+ 50, _tY-50, 0, 255, 0);
					MoveToTarget(_x, _y, _z);
					script_gather.messageToGrinder = "" ..nDist.. " (yd) - Nav Script Force Move - no nav path!";
				end
			end
		end
		return true;
	end
	script_gather.gathering = false;
	return false;
end