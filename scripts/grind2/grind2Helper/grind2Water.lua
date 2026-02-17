grind2Water = {

	water = {},

	numWater = 0,

	timer = GetTimeEX(),

	isSetup = false,

}

function grind2Water:setup()

	self.timer = GetTimeEX();

	if not self.isSetup then

		-- Vendor water
		grind2Water:addWater("Morning Glory Dew");
		grind2Water:addWater("Moonberry Juice");
		grind2Water:addWater("Sweet Nectar");
		grind2Water:addWater("Melon Juice");
		grind2Water:addWater("Ice Cold Milk");
		grind2Water:addWater("Refreshing Spring Water");
		grind2Water:addWater("Fizzy faire Drink");
		grind2Water:addWater("Freshly-Squeezed Lemonade");
		grind2Water:addWater("Hyjal Nectar");
		grind2Water:addWater("Green Garden Tea");
		grind2Water:addWater("Bottle Winterspring Water");

		-- Mage water
		grind2Water:addWater("Conjured Crystal Water");
		grind2Water:addWater("Conjured Sparkling Water");
		grind2Water:addWater("Conjured Mineral Water");
		grind2Water:addWater("Conjured Spring Water");
		grind2Water:addWater("Conjured Purified Water");
		grind2Water:addWater("Conjured Fresh Water");
		grind2Water:addWater("Conjured Water");
	end

	self.isSetup = true;
end

function grind2Water:addWater(name)

	self.water[self.numWater] = name;

	self.numWater = self.numWater + 1;
end

function grind2Water:drink()

	if not self.isSetup then

		grind2Water:setup();
	end

	if self.timer > GetTimeEX() or IsDrinking() then

		return false;
	end

	for i = 0, self.numWater do

		if HasItem(self.water[i]) and not IsDrinking() and not IsMoving() then
			
			self.timer = GetTimeEX() + 2500 + grind2.scriptSpeed;

			if UseItem(self.water[i]) then

				self.timer = GetTimeEX() + 2500 + grind2.scriptSpeed;

				return true;
			end
		end
	end

	return false;
end