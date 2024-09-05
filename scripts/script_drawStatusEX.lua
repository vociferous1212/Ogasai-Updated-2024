script_drawStatusEX = {

}


function script_drawStatusEX:drawSetup()
	if (script_grind.drawAggro) then
		script_aggro:drawAggroCircles(45);
	end
	if (script_grind.drawAggro2) then
		script_aggro:drawAggroCircles2(script_aggro.addsRange);
	end
	if (script_grind.autoPath and script_grind.drawAutoPath) then
		script_drawData:drawSavedTargetLocations();
	end
	if (script_grind.drawGather) then
		script_gather:drawGatherNodes();
	end
	if (script_grind.drawPath) then
		if (IsMoving()) then
			script_drawData:drawPath();
		end
	end
	if (script_grind.drawUnits) then
		script_drawData:drawUnitsDataOnScreen();
	end
	if (not script_grind.drawEnabled and script_grind.showClassOptions) then
		RunCombatDraw();
	end
end