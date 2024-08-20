script_goToFP = {

		waitTimer = 0,
		getFPStatus = 0,
		fpTarget = "",
		fx = 0, fy = 0,
		fz = 0, lastZone = 0,
		closestCityZone = "",
		goToFPTimer = 0,
		timerSet = false,
}

function script_goToFP:run()

		-- make sure to add all the flight paths to tables
		if (not fpDB.isSetup) then
			fpDB.isSetup = true;
			fpDB:setup();
		end

		-- timer for script to run
		if (self.waitTimer > GetTimeEX()) then
			return;
		end

		-- get our position
		local x, y, z = GetLocalPlayer():GetPosition();

		-- tell the bot to not to return to status 1 if we can't find a FP or are broke and can't afford
		if (self.getFPStatus ~= 3) then
			self.getFPStatus = 1;
		end
		if (self.getFPStatus == 3) then
			return false;
		end
		-- we are in a city and are done getting spells and need to fly back
		if (self.fx == 0 and self.fx ~= nil) and (script_getSpells:cityZones()) and (script_getSpells.getSpellsStatus == 0) then
			-- we need to target a city flight master
			self.fx, self.fy, self.fz = fpDB:getClosestCity();
		end

		-- fly to city from area
		if (self.fx == 0) and (not script_getSpells:cityZones()) then
			self.fx, self.fy, self.fz = fpDB:getFP();
		end

		-- draw some status text on screen
		local x, y, r, g, b = 0, 0, 0, 0, 0;
		DrawText("Moving To Closest Flight Path",  x+800, y+300, r+255, g+255, b+0);

		local x, y, z = GetLocalPlayer():GetPosition();

		-- if we are shapeshift then remove form
		if (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) <= 20) then
			if (HasForm()) then
				RemoveForm();
			end
		end

		-- if position not close to FP then move to FP
		if (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) > 4) then

			-- move to target
			script_grind.message = script_navEX:moveToTarget(localObj, self.fx, self.fy, self.fz);
			self.getFPStatus = 1;

			-- force the damn bot to move until it finds a path again
			if (not IsMoving()) then
				local px, py, pz = GetLocalPlayer():GetPosition();
				local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
				DrawText("Canont find a path!", _tX+ 50, _tY-50, 0, 255, 0);
				Move(self.fx, self.fy, self.fz);
			end
		return true;
		end

		-- clear target
		if (not IsInCombat()) and (PlayerHasTarget()) and (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) > 15) then
			-- start timer
			ClearTarget();
		end


		-- if distance is close to FP then
		if (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) <= 4) then
			
			-- clear target again if we have one selected and we shouldn't
			if (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetUnitName() ~= self.fpTarget) then
				ClearTarget();
			end

			-- target FP
			TargetByName(self.fpTarget);
			if (not self.timerSet) then
				self.timerSet = true;
				self.goToFPTimer = GetTimeEX() + 15000;
			end

			-- get target
			if (GetTarget() == 0 or GetTarget() == nil) then
				self.fpTarget = GetTarget();
			end


-- set some variables
				local temp = "name";
				local temp2 = "name2";
				local sString = string;
				self.closestCityZone = fpDB:getClosestCityZone();
		
			-- interact with flight master
			if (GetTarget():UnitInteract()) then

				

				-- set a wait timer for actions
				self.waitTimer = GetTimeEX() + 2000;

				-- open the map
				SelectGossipOption(1);

				-- Save our variables for flying back to grind spot
				if (not script_getSpells:cityZones()) then
					temp = GetSubZoneText();
					temp2 = GetRealZoneText();
					sString = ""..temp..", "..temp2.."";
					self.lastZone = ""..temp..", "..temp2.."";
				end

				-- we have no flight path saved so go to location based on current level
				-- maybe we reloaded the bot?
				if (temp == "name" or temp2 == "name") then

					--if we are in HUMAN zones then based on level fly to westfall or duskwood
					if (script_getSpells:humanZones()) then
						sString = fpDB:getAHumanZone();
					end
					if (script_getSpells:elfZones()) then
						sString = fpDB:getAElfZone();
					end
					if (script_getSpells:gnomeZones()) then
						sString = fpDB:getADwarfZone();
					end
					if (script_getSpells:orcZones()) or (script_getSpells:cowZones()) then
						sString = fpDB:getAOrcZone();
					end
					if (script_getSpells:deadZones()) then
						sString = fpDB:getAUndeadZone();
					end
				end

				-- check to see if we have the FP or not and if not then return false and status == 0
				--for i=0, NumTaxiNodes() do
				--	if (TaxiNodeName(2) == "INVALID" and GetLocalPlayer():GetLevel() <= 10) or (TaxiNodeName(3) == "INVALID" and GetLocalPlayer():GetLevel() >= 20) and (script_getSpells:cityZones()) then
				--		DEFAULT_CHAT_FRAME:AddMessage("No FP connection found - walking to hotspot");
				--		self.getFPStatus = 3;
				--	return false;			
				--	end
				--end
					if (GetTimeEX() > self.goToFPTimer) then
						self.goToFPTimer = GetTimeEX() + 10000;
						fpDB:removeCity();
						fpDB:removeFP();
						DEFAULT_CHAT_FRAME:AddMessage("Took too long at flight master. No path found!");
					end
					
			
			-- we are not in a city so take this flight path
				if (not script_getSpells:cityZones()) then

					-- search the taxi nodes we have available
					for i=0, NumTaxiNodes() do
		
						-- we get our closest city from fpDB
						if (TaxiNodeName(i) == self.closestCityZone) then

							-- if we have enough money to take the FP
							if (GetMoney() >= TaxiNodeCost(i)) then

								-- take the FP
								TakeTaxiNode(i);

								-- target player
								name = GetLocalPlayer():GetUnitName();
								TargetByName(name);

								-- if we are on a taxi then pause the bot
								if (UnitOnTaxi('player')) then
									script_grind.pause = true;
								end
		
								-- reset our variables for use again
								self.getFPStatus = 0;
								self.fx, self.fy, self.fz = 0, 0, 0;
								self.fpTarget = "";
							else 
								-- we don't have enough money
								self.getFPStatus = 3;
								return false;
							end
						end
					end
				-- we are in a city so take this flight path
				elseif (script_getSpells:cityZones()) then

					-- search the nodes we have available
					for i=0, NumTaxiNodes() do

						-- sString taken from fpDB
						if (TaxiNodeName(i) == sString) then

							-- if we have enough money to take the FP
							if (GetMoney() >= TaxiNodeCost(i)) then

								-- take the taxi node
								TakeTaxiNode(i);
			
								-- target player
								name = GetLocalPlayer():GetUnitName();
								TargetByName(name);

								-- pause bot if on taxi
								if (UnitOnTaxi('player')) then
									script_grind.pause = true;
								end

								-- reset variables for later use
								self.getFPStatus = 0;
								self.fx, self.fy, self.fz = 0, 0, 0;
								self.fpTarget = "";
							end
						end
					end
				end
			return true;
			end
		end

-- we are done or no FP to go to
self.getFPStatus = 0;
self.timerSet = false;
return false;
end