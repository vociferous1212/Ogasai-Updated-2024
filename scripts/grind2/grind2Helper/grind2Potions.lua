grind2Potions = {

	healthPotion = {},

	numHealthPotion = 0,

	manaPotion = {},

	numManaPotion = 0,

	potionTimer = 0,

	timer = GetTimeEX(),

	isSetup = false,

}

function grind2Potions:setup()

	self.timer = GetTimeEX();

	self.potionTimer = GetTimeEX();

	if not self.isSetup then

		-- Add Health Potions
		grind2Potions:addHealthPotion("Minor Healing Potion");
		grind2Potions:addHealthPotion("Discolored Healing Potion");
		grind2Potions:addHealthPotion("Lesser Healing Potion");
		grind2Potions:addHealthPotion("Healing Potion");
		grind2Potions:addHealthPotion("Superior Healing Potion");
		grind2Potions:addHealthPotion("Major Healing Potion");
		grind2Potions:addHealthPotion("Minor Rejuvenation Potion");

		-- Add Mana Potions
		grind2Potions:addManaPotion("Minor Mana Potion");
		grind2Potions:addManaPotion("Lesser Mana Potion");
		grind2Potions:addManaPotion("Mana Potion");
		grind2Potions:addManaPotion("Superior Mana Potion");
		grind2Potions:addManaPotion("Major Mana Potion");
		grind2Potions:addManaPotion("Minor Rejuvenation Potion");
	end

	self.isSetup = true;
end

function grind2Potions:addHealthPotion(name)

	self.healthPotion[self.numHealthPotion] = name;

	self.numHealthPotion = self.numHealthPotion + 1;
end

function grind2Potions:addManaPotion(name)

	self.manaPotion[self.numManaPotion] = name;

	self.numManaPotion = self.numManaPotion + 1;
end

function grind2Potions:useHealthPotion()

	if not self.isSetup then
	
		grind2Potions:setup();
	end

	if (self.potionTimer or self.timer) > GetTimeEX() then

		return false;
	end

	-- Search for potion
	local potionIndex = -1;

	for i = 0, self.numHealthPotion do

		if HasItem(self.healthPotion[i]) then

			potionIndex = i;

			break;
		end
	end
		
	if HasItem(self.healthPotion[potionIndex]) then

		UseItem(self.healthPotion[potionIndex])

		self.potionTimer = GetTimeEX() + 120000;

		self.timer = GetTimeEX() + 2500 + grind2.scriptSpeed;

		return true;
	end

	return false;
end

function grind2Potions:useManaPotion()

	if not self.isSetup then

		grind2Potions:setup();
	end

	if (self.potionTimer or self.timer) > GetTimeEX() then

		return false;
	end

	-- Search for potion
	local potionIndex = -1;

	for i = 0, self.numManaPotion do

		if HasItem(self.manaPotion[i]) then

			potionIndex = i;

			break;
		end
	end
		
	if HasItem(self.manaPotion[potionIndex]) then

		UseItem(self.manaPotion[potionIndex])

		self.potionTimer = GetTimeEX() + 120000;

		self.timer = GetTimeEX() + 2500 + grind2.scriptSpeed;

		return true;
	end

	return false;
end