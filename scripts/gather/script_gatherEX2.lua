script_gatherEX2 = {waitTimer = 0,}

-- is there a node anywhere on the map we can see
function script_gatherEX2:isThereAnyValidNode()
	local i, t = GetFirstObject();
	while i ~= 0 do
		if t == 5 then
			return true;
		end
	i, t = GetNextObject(i);
	end
return false;
end


function script_gatherEX2:isNodeSafeToGather()
	local i, t = GetFirstObject();

-- if we have a valid node and it's not blacklisted then
	if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) and (not script_gather:isNodeBlacklisted(script_gather.nodeObj:GetGUID())) then

		
					local numberOfEnemiesNearNode = 0;


		while i ~= 0 do
			if t == 3 then
				if not i:IsDead() and not i:IsCritter() then
					local nx, ny, nz = script_gather.nodeObj:GetPosition();
					local ix, iy, iz = i:GetPosition();
	
					local dist = GetDistance3D(nx, ny, nz, ix, iy, iz);
	
					-- aggro range of mobs around me and node
					local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 27.2;
					
					if (dist <= aggro) then
						numberOfEnemiesNearNode = numberOfEnemiesNearNode + 1;
					end
					
				end
			end
		i, t = GetNextObject(i);
		end
		
		if (numberOfEnemiesNearNode >= 3) and script_gather.safeGather then
							script_gather.messageSent = true;
							script_gather:addNodeToBlacklist(script_gather.nodeObj:GetGUID());
							DEFAULT_CHAT_FRAME:AddMessage("3 or more enemies in range of node - blacklisting "..script_gather.nodeObj:GetUnitName().." "..math.floor(script_gather.nodeObj:GetDistance()).." (yd)");
						return false;
						end
	end
return true;
end
