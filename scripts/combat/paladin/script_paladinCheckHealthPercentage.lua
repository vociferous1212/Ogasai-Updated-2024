script_paladinCheckHealthPercentage = {}

-- this slows down the healing and gives the bot time to react.. time was having issues...
function script_paladinCheckHealthPercentage:doubleCheckHealthPercentage()
	local localObj = GetLocalPlayer();
	local localHealth = localObj:GetHealthPercentage();
	
	for i=0, 5 do
		if (localHealth > 0) then
			return localHealth;
		end
	end
return 0;
end