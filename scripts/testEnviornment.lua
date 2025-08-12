testEnviornment = {waitTimer = GetTimeEX(), a = false,}

function testEnviornment:draw()
end

function testEnviornment:run()

	--if (self.waitTimer > GetTimeEX()) then
	--	return;
	--end

	--if IsLooting() then
	--	LootTarget();
	--	self.waitTimer = GetTimeEX() + 250;
	--end
	
	
	--ReplaceEnchant();
	--self.waitTimer = GetTimeEX() + 250;


script_navEX:raycastMove(GetLocalPlayer(), -2000, -90, 84)

end
