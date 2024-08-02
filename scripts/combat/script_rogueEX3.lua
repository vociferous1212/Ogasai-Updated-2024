script_rogueEX3 = {}

function script_rogueEX3:menu()
	if (script_rogue.useStealth) then
	SameLine();
	wasClicked, script_rogue.usePickPocket = Checkbox("Use Pick Pocket", script_rogue.usePickPocket);
	end
end
