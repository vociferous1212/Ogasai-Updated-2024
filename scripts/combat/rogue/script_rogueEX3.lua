script_rogueEX3 = {}

function script_rogueEX3:menuOne()
	if (script_rogue.useStealth) then
	SameLine();
	wasClicked, script_rogue.usePickPocket = Checkbox("Use Pick Pocket", script_rogue.usePickPocket);
	end
end

function script_rogueEX3:menuTwo()

end
