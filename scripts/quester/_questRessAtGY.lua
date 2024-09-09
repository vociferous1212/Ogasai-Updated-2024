_questRessAtGY = {}

function _questRessAtGY:ressurect()

	if GetLocalPlayer():IsDead() or GetLocalPlayer():HasDebuff("Ghost") then
		if GetTarget() ~= 0 and GetTarget() ~= nil then
			if GetTarget():GetUnitName() ~= "Spirit Healer" then
				ClearTarget();
			end
		end
		if GetTarget() == 0 or GetTarget() == nil then
			TargetByName("Spirit Healer");
			if GetTarget() ~= 0 and GetTarget() ~= nil then
				if GetTarget():GetUnitName() == "Spirit Healer" then
					local x, y, z = GetTarget():GetPosition();
					local px, py, pz = GetLocalPlayer():GetPosition();
					local dist = math.sqrt((x - px)^2 + (y - py)^2)
					if dist > 2 then
						Move(x, y, z);
					end
					if not IsMoving() then
						AcceptXPLoss();
						GetTarget():UnitInteract();
						
					end
				end
			end
		end
AcceptXPLoss();

	return true;
	end

return false;
end