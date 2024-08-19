script_getSpells = {

	mageSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsMage.lua"),
	warlockSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsWarlock.lua"),
	warriorSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsWarrior.lua"),
	rogueSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsRogue.lua"),
	ShamanSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsShaman.lua"),
	druidSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsDruid.lua"),
	paladinSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsPaladin.lua"),
	hunterSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsHunter.lua"),
	priestSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpellsPriest.lua"),

	getSpellsStatus = 0,
	trainerTarget = nil,
	isSetup = false,
	waitTimer = 0,

}
function script_getSpells:setup()
	self.waitTimer = GetTimeEX(); self.isSetup = true;
end

function script_getSpells:checkForSpellsNeeded()
	if (HasSpell("Fireball")) then
		if (script_getSpellsMage:checkForSpellsNeededMage()) then
			return true;
		end
	end
	if (HasSpell("Shadow Bolt")) then
		if (script_getSpellsWarlock:checkForSpellsNeededWarlock()) then
			return true;
		end
	end
	if (HasSpell("Heroic Strike")) then
		if (script_getSpellsWarrior:checkForSpellsNeededWarrior()) then
			return true;
		end
	end
	if (HasSpell("Sinister Strike")) then
		if (script_getSpellsRogue:checkForSpellsNeededRogue()) then
			return true;
		end
	end
	if (HasSpell("Smite")) then
		if (script_getSpellsPriest:checkForSpellsNeededPriest()) then
			return true;
		end
	end
	if (HasSpell("Wrath")) then
		if (script_getSpellsDruid:checkForSpellsNeededDruid()) then
			return true;
		end
	end
	if (HasSpell("Raptor Strike")) then
		if (script_getSpellsHunter:checkForSpellsNeededHunter()) then
			return true;
		end
	end
	if (HasSpell("Seal of Righteousness")) then
		if (script_getSpellsPaladin:checkForSpellsNeededPaladin()) then
			return true;
		end
	end
	if (HasSpell("Lightning Bolt")) then
		if (script_getSpellsShaman:checkForSpellsNeededShaman()) then
			return true;
		end
	end
return false;
end

function script_getSpells:run()
		if (self.waitTimer > GetTimeEX()) then
			return;
		end
		self.getSpellsStatus = 1;

		if (GetLocalPlayer():GetLevel() >= 10) and (not fpDB:areWeInStarterZones()) and (not script_getSpells:cityZones()) then
			script_goToFP:run();
		return true;
		end

		if (script_goToFP.getFPStatus ~= 0) then
			return;
		end

		local x, y, r, g, b = 0, 0, 0, 0, 0;
		DrawText("Moving To Trainers if player is level 22 or lower... ",  x+800, y+300, r+255, g+255, b+0);

		local x, y, z = GetLocalPlayer():GetPosition();
		local vX, vY, vZ = 0, 0, 0;

		-- need to run table here
		if (HasSpell("Fireball")) then
			vX, vY, vZ = script_getSpellsMage:getTrainerTargetMage();
		end
		if (HasSpell("Shadow Bolt")) then
			vX, vY, vZ = script_getSpellsWarlock:getTrainerTargetWarlock();
		end
		if (HasSpell("Heroic Strike")) then
			vX, vY, vZ = script_getSpellsWarrior:getTrainerTargetWarrior();
		end
		if (HasSpell("Sinister Strike")) then
			vX, vY, vZ = script_getSpellsRogue:getTrainerTargetRogue();
		end
		if (HasSpell("Smite")) then
			vX, vY, vZ = script_getSpellsPriest:getTrainerTargetPriest();
		end
		if (HasSpell("Lightning Bolt")) then
			vX, vY, vZ = script_getSpellsShaman:getTrainerTargetShaman();
		end
		if (HasSpell("Seal of Righteousness")) then
			vX, vY, vZ = script_getSpellsPaladin:getTrainerTargetPaladin();
		end
		if (HasSpell("Wrath")) then
			vX, vY, vZ = script_getSpellsDruid:getTrainerTargetDruid();
		end
		if (HasSpell("Raptor Strike")) then
			vX, vY, vZ = script_getSpellsHunter:getTrainerTargetHunter();
		end

		if (script_grindEX:checkForTargetsOnHotspotRoute()) then
			script_grind.message = "Killing stuff in our path.";
			script_grind.combatError = RunCombatScript(script_grind.enemyObj:GetGUID());
			if (self.combatError == 3) then
				local x, y, z = script_grind.enemyObj:GetPosition();
				MoveToTarget(x, y, z);
				return true;
			end
			return true;
		end


		if (GetDistance3D(x, y, z, vX, vY, vZ) < 20) then
			if (HasForm()) then
				RemoveForm();
			end
		end
		-- if position not close to trainer then move to trainer
		if (GetDistance3D(x, y, z, vX, vY, vZ) > 3) then
if (not script_unstuck:pathClearAuto(2)) then
			script_unstuck:unstuck();
			return true;
		end

			script_grind.message = script_navEX:moveToTarget(localObj, vX, vY, vZ);
			self.getSpellsStatus = 1;
			if (not IsMoving()) then
				local px, py, pz = GetLocalPlayer():GetPosition();
				local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
				DrawText("Canont find a path!", _tX+ 50, _tY-50, 0, 255, 0);
				Move(vX, vY, vZ);
			end
		return true;
		end

		if (not IsInCombat()) and (PlayerHasTarget()) and (GetDistance3D(x, y, z, vX, vY, vZ) > 15) then
			ClearTarget();
		end

		-- if distance is close to trainer then
		if (GetDistance3D(x, y, z, vX, vY, vZ) <= 4) then

			script_goToFP.goToFPTimer = GetTimeEX();
			
			if (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetUnitName() ~= self.trainerTarget) then
				ClearTarget();
			end
			-- target trainer
			TargetByName(self.trainerTarget);

			if (GetTarget() == 0 or GetTarget() == nil) then
				self.trainerTarget = GetTarget();
			end

				if (GetTarget():UnitInteract()) then
					self.waitTimer = GetTimeEX() + 2000;
					SelectGossipOption(1);
				end
			
				-- need to do check for spells? this just buys anything available
				for i = 1, 15 do
				-- buy from trainer spell index
					BuyTrainerService(i);
				end
			
			
			
		end
	if (script_getSpells:checkForSpellsNeeded()) then
		return true;
	end
return false;
end
function script_getSpells:cityZones()
	local map = GetMapID();
		if map == 1537 or map == 1519 or map == 1657 or map == 1637 or map == 1638 or map == 1497 then
			return true;
		end
return false;
end
function script_getSpells:gnomeZones()
	local map = GetMapID();
		if map == 1 or map == 1537 or map == 38 or map == 11 then
			return true;
		end

return false;
end
function script_getSpells:humanZones()
	local map = GetMapID();
		if map == 12 or map == 10 or map == 44 or map == 40 or map == 1519 then
			return true;
		end

return false;
end
function script_getSpells:elfZones()
	local map = GetMapID();
		if map == 331 or map == 148 or map == 1657 or map == 141 then
			return true;
		end

return false;
end
function script_getSpells:orcZones()
	local map = GetMapID();
		if map == 14 or map == 1637 or map == 17 or ( (map == 406 or map == 400) and not script_getSpells:areWeAlliance()) then
			return true;
		end

return false;
end
function script_getSpells:cowZones()
	local map = GetMapID();
		if (GetFaction() == 6) then
			return false;
		end
		if map == 215 or map == 1638 or map == 17 or ( (map == 406 or map == 400) and not script_getSpells:areWeAlliance()) then
			return true;
		end

return false;
end
function script_getSpells:deadZones()
	local map = GetMapID();
		if map == 130 or map == 85 or map == 1497 or map == 267 or (map == 267 and not script_getSpells:areWeAlliance()) then
			return true;
		end

return false;
end
function script_getSpells:areWeAlliance()
	local a = GetFaction();
		if a == 4 or a == 115 or a == 3 or a == 1 then
			return true;
		end
return false;
end