grind2Bandage = {

	bandage = {},

	numBandage = 0,

	timer = GetTimeEX(),

	isSetup = false,

}

function grind2Bandage:setup()

	self.timer = GetTimeEX();

	if not self.isSetup then

		-- Add Bandages
		grind2Bandage:addBandage("Linen Bandage");
		grind2Bandage:addBandage("Heavy Linen Bandage");
		grind2Bandage:addBandage("Wool Bandage");
		grind2Bandage:addBandage("Heavy Wool Bandage");
		grind2Bandage:addBandage("Silk Bandage");
		grind2Bandage:addBandage("Heavy Silk Bandage");
		grind2Bandage:addBandage("Mageweave Bandage");
		grind2Bandage:addBandage("Heavy Mageweave Bandage");
		grind2Bandage:addBandage("Runecloth Bandage");
		grind2Bandage:addBandage("Heavy Runecloth Bandage");

	end

	self.isSetup = true;
end

function grind2Bandage:addBandage(name)

	self.bandage[self.numBandage] = name;

	self.numBandage = self.numBandage +1;
end

function grind2Bandage:useBandage()

	if not self.isSetup then

		grind2Bandage:setup();
	end

	if self.timer > GetTimeEX() then
		
		return false;
	end

	local bandageIndex = -1;

	for i=0,self.numBandage do

		if HasItem(self.bandage[i]) then

			bandageIndex = i;

			break;
		end
	end
		
	if HasItem(self.bandage[bandageIndex]) then

		if UseItem(self.bandage[bandageIndex]) then
						
			self.timer = GetTimeEX() + 2500 + grind2.scriptSpeed;

			return true;
		end
	end
	
	return false;
end