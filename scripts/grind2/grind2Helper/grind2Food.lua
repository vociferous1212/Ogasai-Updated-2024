grind2Food = {

	food = {},

	numFood = 0,

	timer = GetTimeEX(),

	isSetup = false,

}

function grind2Food:addFood(name)

	self.food[self.numFood] = name;

	self.numFood = self.numFood + 1;
end

function grind2Food:setup()

	self.timer = GetTimeEX();

	if not self.isSetup then

		-- Vendor mushroom food
		grind2Food:addFood("Dried King Bolete");	
		grind2Food:addFood("Raw Black Truffle");	
		grind2Food:addFood("Delicious Cave Mold");	
		grind2Food:addFood("Spongy Morel");
		grind2Food:addFood("Red-speckled Mushroom");
		grind2Food:addFood("Forest Mushroom Cap");
		grind2Food:addFood("Winter Kimchi");

		-- Vendor fruit food
		grind2Food:addFood("Deep Fried Plantains");
		grind2Food:addFood("Moon Harvest Pumpkin");
		grind2Food:addFood("Goldenbark Apple");
		grind2Food:addFood("Snapvine Watermelon");
		grind2Food:addFood("Tel'Abim Banana");
		grind2Food:addFood("Shiny Red Apple");

		-- Vendor baked food
		grind2Food:addFood("Tough Hunk of Bread");
		grind2Food:addFood("Freshly Baked Bread");
		grind2Food:addFood("Moist Cornbread");
		grind2Food:addFood("Mulgore Spice Bread");
		grind2Food:addFood("Soft Banana Bread");
		grind2Food:addFood("Homemade Cherry Pie");
	
		-- Vendor meat food
		grind2Food:addFood("Cured Ham Steak");
		grind2Food:addFood("Haunch of Meat");
		grind2Food:addFood("Mutton Chop");
		grind2Food:addFood("Roasted Quail");
		grind2Food:addFood("Tough Jerky");
		grind2Food:addFood("Wild Hog Shank");
		grind2Food:addFood("Leg Meat");

		-- Vendor cheese
		grind2Food:addFood("Alterac Swiss");
		grind2Food:addFood("Fine Aged Cheddar");
		grind2Food:addFood("Stormwind Brie");
		grind2Food:addFood("Dwarven Mild");
		grind2Food:addFood("Dalaran Sharp");
		grind2Food:addFood("Darnassian Bleu");
	
		-- Vendor fish food
		grind2Food:addFood("Spinefin Halibut");
		grind2Food:addFood("Striped Yellowtail");
		grind2Food:addFood("Rockscale Cod");
		grind2Food:addFood("Bristle Whisker Catfish");
		grind2Food:addFood("Slitherskin Mackerel");
		grind2Food:addFood("Longjaw Mud Snapper");

		-- fishable fish
		grind2Food:addFood("Raw Brilliant Smallfish");

		-- Night elf vendor food
		grind2Food:addFood("Bean Soup");
		grind2Food:addFood("Versicolor Treat");

		--Halloween food and water
		grind2Food:addFood("Candy Corn");
		grind2Food:addFood("Lollipop");
		grind2Food:addFood("Candy Bar");
		grind2Food:addFood("Bobbing Apple");

		-- other food + water
		grind2Food:addFood("Senggin Root");
		grind2Food:addFood("Healing Herb");

		-- Mage food
		grind2Food:addFood("Conjured Cinnamon Roll");
		grind2Food:addFood("Conjured Sweet Roll");
		grind2Food:addFood("Conjured Sourdough")
		grind2Food:addFood("Conjured Pumpernickel");
		grind2Food:addFood("Conjured Rye");
		grind2Food:addFood("Conjured Bread");
		grind2Food:addFood("Conjured Muffin");
	end

	self.isSetup = true;
end

function grind2Food:eat()
	
	if not self.isSetup then

		grind2Food:setup();
	end

	if self.timer > GetTimeEX() then

		return false;
	end

	for i = 0, self.numFood do

		if HasItem(self.food[i]) and not IsEating() and not IsMoving() then

			self.timer = GetTimeEX() + 2500 + grind2.scriptSpeed;

			if UseItem(self.food[i]) then

				return true;
			end
		end
	end

	return false;
end