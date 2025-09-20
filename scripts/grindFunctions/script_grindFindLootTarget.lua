script_grindFindLootTarget = {}


-- find a loot target if bags are not full and we are not skipping looting

function script_grindFindLootTarget:findLootTarget()

	if not script_grind.bagsFull
	and not script_hunter.bagsFull
	and not AreBagsFull()
	and not script_grind.skipLooting
	
	then
		
			-- find loot before moving to a new target...
		script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance);
	end

return false;
end