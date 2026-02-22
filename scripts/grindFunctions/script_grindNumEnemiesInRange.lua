script_grindNumEnemiesInRange = {}

function script_grindNumEnemiesInRange:numEnemiesInRange(range)

	local i, t = GetFirstObject();

	local numEnemies = 0;

	if range == 0 or range == nil then
		range = 10;
	end

	while i ~= 0 do

		if t == 3 then

			if i:GetDistance() <= range then

				numEnemies = numEnemies + 1;
			end
		end
	i, t = GetNextObject(i);
	end

return numEnemies;
end