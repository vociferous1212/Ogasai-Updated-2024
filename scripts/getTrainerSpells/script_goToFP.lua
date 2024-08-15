script_goToFP = {waitTimer = 0, getFPStatus = 0, fpTarget = " ", fx = 0, fy = 0, fz = 0,}

function script_goToFP:run()

		if (self.waitTimer > GetTimeEX()) then
			return;
		end
		local x, y, z = GetLocalPlayer():GetPosition();

		self.getFPStatus = 1;
	
		if (not fpDB:areWeInStarterZones()) then
			self.fx, self.fy, self.fz = fpDB:getFP();
		end

		local x, y, r, g, b = 0, 0, 0, 0, 0;
		DrawText("Moving To Closest Flight Path ",  x+800, y+300, r+255, g+255, b+0);

		local x, y, z = GetLocalPlayer():GetPosition();

		if (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) <= 20) then
			if (HasForm()) then
				RemoveForm();
			end
		end

		-- if position not close to FP then move to FP
		if (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) > 3) then
			script_grind.message = script_navEX:moveToTarget(localObj, self.fx, self.fy, self.fz);
			self.getFPStatus = 1;
			if (not IsMoving()) then
				local px, py, pz = GetLocalPlayer():GetPosition();
				local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
				DrawText("Canont find a path!", _tX+ 50, _tY-50, 0, 255, 0);
				Move(self.fx, self.fy, self.fz);
			end
		return true;
		end

		if (not IsInCombat()) and (PlayerHasTarget()) and (GetDistance3D(x, y, z, self.fx, self.fy, self.fz) > 15) then
			ClearTarget();
		end

		-- if distance is close to FP then
		if (GetDistance3D(x, y, z, fx, self.fy, self.fz) <= 4) then
			
			if (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetUnitName() ~= self.fpTarget) then
				ClearTarget();
			end
			-- target FP
			TargetByName(self.fpTarget);

			if (GetTarget() == 0 or GetTarget() == nil) then
				self.fpTarget = GetTarget();
			end

			if (GetTarget():UnitInteract()) then
				self.waitTimer = GetTimeEX() + 2000;
				SelectGossipOption(1);
				for f=0, 50 do
					a = TaxiNodeName(f);
					if (a == "Astranaar, Ashenvale") then
						if (GetMoney() >= TaxiNodeCost(f)) then
							TakeTaxiNode(f);
						end
					end
				end
			end
		end

return false;
end