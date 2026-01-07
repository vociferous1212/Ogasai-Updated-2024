grind2DrawUnitData = {

	drawPlayers = true,

	drawNPC = true,

	drawFriendlies = false,

	drawEnemies = true,

	drawTargeted = true,


}

--[[

	DRAW THE ENEMIES, FRIENDLIES, PLAYERS DATA ON SCREEN

	THIS SCRIPT RUNS THE OBJECT MANAGER CHECKING THE OTHER SCRIPTS CALLED HERE

]]

function grind2DrawUnitData:drawUnitsOnScreen()

	local target, targetType = GetFirstObject();

	local player = GetLocalPlayer();

	-- run object manager
	while target ~= 0 and target ~= nil do

		-- show my selected target whatever it is
		if targetType == 3 and PlayerHasTarget() and self.drawTargeted then

			if target:GetGUID() == GetTarget():GetGUID() then

				grind2SelectDrawTargets:selectNPCTarget(target);
			end
		end

		if self.drawNPC then
		
			-- NPC enemy targets
			if self.drawEnemies and targetType == 3 and not target:IsCritter() and not target:IsDead() and target:CanAttack() then
			
				grind2SelectDrawTargets:selectNPCTarget(target);
			end

			-- NPC friendly targets
			if self.drawFriendlies and targetType == 3 and not target:IsCritter() and not target:IsDead() and not target:CanAttack() then

				grind2SelectDrawTargets:selectNPCTarget(target);
			end
		end

		if self.drawPlayers then
		
			-- draw friendly player targets
			if targetType == 4 and not target:IsCritter() and not target:IsDead() and not target:CanAttack() then
		
				grind2SelectDrawTargets:SelectPlayerTarget(target)
			end
		end

		-- get next target
		target, targetType = GetNextObject(target);
	end
end