testEnviornment = {waitTimer = GetTimeEX(), a = false,}

function testEnviornment:draw()
end

function testEnviornment:run()
local x, y, z = GetLocalPlayer():GetPosition();


local dist = GetDistance3D(x, y, z, -8904.390625, -191.40814208984, 89.166107177734);
local dist2 = GetDistance3D(x, y, z, -8856.015625, -183.39405822754, 89.313957214355);
script_drawData:drawPath()
script_grind.nextToNodeDist = 3;
	NavmeshSmooth(3.5);
if dist <= 5 then self.a = true;
	end
if dist2 <= 5 then self.a = false;
	end
if dist > 5 and not self.a then
script_navEX:moveToTarget(GetLocalPlayer(), -8904.390625, -191.40814208984, 89.166107177734);
	
elseif dist2 > 5 and self.a then
script_navEX:moveToTarget(GetLocalPlayer(), -8856.015625, -183.39405822754, 89.313957214355);
	
end

	if self.waitTimer > GetTimeEX() then return; end
	local a, b = 0, 0;
	if GetTarget() ~= 0 and GetTarget() ~= nil then
		a = GetTarget():GetAngle();
		b = GetLocalPlayer():GetAngle();
	end
	if a - b > 1 or a - b < -1 or b - a > 1 or a - b < -1 then
		GetTarget():FaceTarget();
		self.waitTimer = GetTimeEX() + 50;
	end
--script_navEX:moveToTarget(GetLocalPlayer(), 384.74301147461, -4600.1298828125, 76.088417053223);

--script_runner:run(260.59149169922, -3042.9353027344, 96.310523986816)

--_questEdgeCaseQuest:run()

return;
end
