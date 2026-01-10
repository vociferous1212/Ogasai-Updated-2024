grind2SelectDrawTargets = {

	drawLevel = true,

	drawHP = true,

	drawDistance = true,

	drawName = false,

}

function grind2SelectDrawTargets:selectNPCTarget(target)

	local player = GetLocalPlayer();

	local distance = target:GetDistance();

	local tX, tY, onScreen = WorldToScreen(target:GetPosition());

	-- if target is on screen
	if onScreen and grind2DrawDataMenu.drawUnits then
	
		-- draw creature name
		if self.drawName or (grind2DrawUnitData.drawTargeted and GetTarget() ~= nil and GetTarget() ~= 0 and GetTarget():GetGUID() == target:GetGUID()) then

			-- friendlies
			if not target:CanAttack() and grind2DrawUnitData.drawFriendlies or (grind2DrawUnitData.drawTargeted and GetTarget() ~= nil and GetTarget() ~= 0 and GetTarget():GetGUID() == target:GetGUID()) then
				DrawText("" .. target:GetUnitName(), tX, tY-20, 0, 255, 0);
			end

			-- enemies
			if target:CanAttack() then
				DrawText("" .. target:GetUnitName(), tX, tY-20, 255, 255, 0);
			end
			
		end

		-- draw creature level
		if self.drawLevel or (grind2DrawUnitData.drawTargeted and GetTarget() ~= nil and GetTarget() ~= 0 and GetTarget():GetGUID() == target:GetGUID()) then

			-- enemies
			if target:CanAttack() then
				DrawText(target:GetCreatureType() .. " - " .. target:GetLevel(), tX, tY-10, 255, 255, 0);
			end

			-- friendlies
			if not target:CanAttack() and grind2DrawUnitData.drawFriendlies or (grind2DrawUnitData.drawTargeted and GetTarget() ~= nil and GetTarget() ~= 0 and GetTarget():GetGUID() == target:GetGUID()) then
				DrawText(target:GetCreatureType() .. " - " .. target:GetLevel(), tX, tY-10, 0, 255, 0);
			end
		end

		-- draw my target "TARGETED"
		if GetTarget() ~= 0 and GetTarget() ~= nil then

			if GetTarget():GetGUID() == target:GetGUID() and GetTarget():GetGUID() ~= player:GetGUID() then 

				DrawText("TARGETED", tX, tY-40, 255, 0, 0); 
			end
		end

		-- draw rares "RARE"
		if target:GetClassification() == 4 then

			DrawText("RARE", tX, tY-25, 255, 255, 255);
		end

		-- draw elites if not in dungeon group (party members less than 3)
		if target:GetClassification() == 1 and GetNumPartyMembers() >= 4 then

			DrawText("ELITE", tX, tY-25, 255, 255, 255);
		end

		-- draw unit HP
		if self.drawHP or (grind2DrawUnitData.drawTargeted and GetTarget() ~= nil and GetTarget() ~= 0 and GetTarget():GetGUID() == target:GetGUID()) then
			DrawText("HP: " .. math.floor(target:GetHealthPercentage()) .. "%", tX, tY, 255, 0, 0);
		end

		-- draw unit distance
		if self.drawDistance or (grind2DrawUnitData.drawTargeted and GetTarget() ~= nil and GetTarget() ~= 0 and GetTarget():GetGUID() == target:GetGUID())then
			DrawText("" .. math.floor(distance) .. " yd.", tX, tY+10, 255, 255, 255);
		end

		-- draw blacklisted targets
		if grind2Blacklisting:isTargetBlacklisted(target:GetGUID()) then
			DrawText("|Blacklisted|", tX-5, tY+22, 255, 100, 0);
		end

	end
end

function grind2SelectDrawTargets:SelectPlayerTarget(target)

	local player = GetLocalPlayer();

	if target:GetGUID() ~= player:GetGUID() then 

		local distance = target:GetDistance();

		local tX, tY, onScreen = WorldToScreen(target:GetPosition());

		if onScreen then

			if self.drawLevel then

				if target:CanAttack() then 

					DrawText("" .. target:GetUnitName() .. " - " .. target:GetLevel(), tX, tY-10, 255, 0, 0);

				elseif not target:CanAttack() then 

					DrawText("" .. target:GetUnitName() .. " - " .. target:GetLevel(), tX, tY-10, 0, 255, 0);
				end
			end

			if self.drawHP then
				DrawText("HP: " .. math.floor(target:GetHealthPercentage()) .. "%", tX, tY, 255, 0, 0);
			end

			if self.drawDistance then
				DrawText("" .. math.floor(distance) .. " yd.", tX, tY+10, 255, 255, 255);
			end
			
			-- draw my target "TARGETED"
			if GetTarget() ~= 0 and GetTarget() ~= nil then
				
				if GetTarget():GetGUID() == target:GetGUID() then 
					
					DrawText("TARGETED", tX, tY-40, 255, 0, 0); 
				end
			end	
		end
	end
end