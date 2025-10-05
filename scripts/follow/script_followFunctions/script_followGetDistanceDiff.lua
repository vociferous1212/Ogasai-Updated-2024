script_followGetDistanceDiff = {}

function script_followGetDistanceDiff:getDistanceDif()

	local x, y, z = GetLocalPlayer():GetPosition();

	local xV, yV, zV = self.myX-x, self.myY-y, self.myZ-z;

	return math.sqrt(xV^2 + yV^2 + zV^2);

end