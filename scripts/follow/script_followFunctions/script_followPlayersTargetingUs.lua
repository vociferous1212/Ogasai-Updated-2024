script_followPlayersTargetingUs = {}

function script_followPlayersTargetingUs:playersTargetingUs() -- returns number of players attacking us
		local nrPlayersTargetingUs = 0; 
		local currentObj, typeObj = GetFirstObject(); 
	while currentObj ~= 0 do 
		if typeObj == 4 then
			if (script_followIsTargetingMe:IsTargetingMe(currentObj)) then 
               			nrPlayersTargetingUs = nrPlayersTargetingUs + 1; 
			end 
		end
        	currentObj, typeObj = GetNextObject(currentObj); 
	end
    return nrPlayersTargetingUs;
end
