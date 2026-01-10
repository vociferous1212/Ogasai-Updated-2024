grind2Mounts = {

	mounts = {},

	numMounts = 0,

	timer = GetTimeEX(),

	isSetup = false,

	tryMountTimer = GetTimeEX(),

}

function grind2Mounts:addMount(name)

	self.mounts[self.numMounts] = name;

	self.numMounts = self.numMounts + 1;
end

function grind2Mounts:setup()

	self.timer = GetTimeEX();

	self.tryMountTimer = GetTimeEX();

	if not self.isSetup then

		-- Epic mounts
		grind2Mounts:addMount("Reins of the Swift Mistsaber");
		grind2Mounts:addMount("Deathcharger's Reins");
		grind2Mounts:addMount("Black War Kodo");
		grind2Mounts:addMount("Black War Ram");
		grind2Mounts:addMount("Black War Steed Bridle");
		grind2Mounts:addMount("Great Brown Kodo");
		grind2Mounts:addMount("Great Gray Kodo");
		grind2Mounts:addMount("Great White Kodo");
		grind2Mounts:addMount("Green Kodo");
		grind2Mounts:addMount("Horn of the Black War Wolf");
		grind2Mounts:addMount("Horn of the Frostwolf Howler");
		grind2Mounts:addMount("Horn of the Swift Brown Wolf");
		grind2Mounts:addMount("Horn of the Swift Gray Wolf");
		grind2Mounts:addMount("Horn of the Swift Timber Wolf");
		grind2Mounts:addMount("Red Skeletal Warhorse");
		grind2Mounts:addMount("Reins of the Black War Tiger");
		grind2Mounts:addMount("Stormspike Battle Charger");
		grind2Mounts:addMount("Swift Blue Raptor");
		grind2Mounts:addMount("Swift Brown Ram");
		grind2Mounts:addMount("Swift Brown Steed");
		grind2Mounts:addMount("Swift Gray Ram");
		grind2Mounts:addMount("Swift Green Mechanostrider");
		grind2Mounts:addMount("Swift Olive Raptor");
		grind2Mounts:addMount("Swift Orange Raptor");
		grind2Mounts:addMount("Swift Palomino");
		grind2Mounts:addMount("Swift Razzashi Raptor");
		grind2Mounts:addMount("Swift White Mechanostrider");
		grind2Mounts:addMount("Swift White Ram");
		grind2Mounts:addMount("Swift White Steed");
		grind2Mounts:addMount("Swift Yellow Mechanostrider");
		grind2Mounts:addMount("Swift Zulian Tiger");
		grind2Mounts:addMount("Teal Kodo");
		grind2Mounts:addMount("The Phylactery of Kel'Thuzad");
		grind2Mounts:addMount("Warlords Deck");
		grind2Mounts:addMount("Whistle of the Black War Raptor");
		grind2Mounts:addMount("Whistle of the Ivory Raptor");
		grind2Mounts:addMount("Whistle of the Mottled Red Raptor");

		-- Level 40 mounts
		grind2Mounts:addMount("Black Stallion Bridle");
		grind2Mounts:addMount("Blue Mechanostrider");
		grind2Mounts:addMount("Blue Skeletal Horse");
		grind2Mounts:addMount("Brown Horse Bridle");
		grind2Mounts:addMount("Brown Kodo");
		grind2Mounts:addMount("Brown Ram");
		grind2Mounts:addMount("Brown Skeletal Horse");
		grind2Mounts:addMount("Chestnut Mare Bridle");
		grind2Mounts:addMount("Gray Kodo");
		grind2Mounts:addMount("Gray Ram");
		grind2Mounts:addMount("Green Mechanostrider");
		grind2Mounts:addMount("Horn of the Brown Wolf");
		grind2Mounts:addMount("Horn of the Dire Wolf");
		grind2Mounts:addMount("Horn of the Timber Wolf");
		grind2Mounts:addMount("Palomino");
		grind2Mounts:addMount("Pinto Bridle");
		grind2Mounts:addMount("Red Mechanostrider");
		grind2Mounts:addMount("Red Skeletal Horse");
		grind2Mounts:addMount("Unpainted Mechanostrider");
		grind2Mounts:addMount("Whistle of the Emerald Raptor");
		grind2Mounts:addMount("Whistle of the Turquoise Raptor");
		grind2Mounts:addMount("Whistle of the Violet Raptor");
		grind2Mounts:addMount("White Ram");
		grind2Mounts:addMount("White Stallion");
		grind2Mounts:addMount("Reins of the Spotted Frostsaber");
		grind2Mounts:addMount("Reins of the Striped Frostsaber");
		grind2Mounts:addMount("Reins of the Striped Nightsaber");
	end

	self.isSetup = true;
end

function grind2Mounts:setTimer(ms)

	self.timer = GetTimeEX() + grind2.scriptSpeed + ms;
end

function grind2Mounts:useMount()

	if not self.isSetup then

		grind2Mounts:setup();
	end

	-- return for any reason
	if (self.timer or self.tryMountTimer) > GetTimeEX()
	or IsCasting() or IsChanneling() or IsInCombat() or not grind2Mounts:doWeHaveAMount() or IsMounted() then

		return false;
	end

	if not HasForm() then

		if IsMoving() then

			StopMoving();

			return true;
		end


		if GetMyClass() == "WARLOCK" then

			if HasSpell("Summon Dreadsteed") then

				CastSpellByName("Summon Dreadsteed");

				grind2Mounts:setTimer(500)

				return true;
			end

			if HasSpell("Summon Felsteed") then

				CastSpellByName("Summon Felsteed");

				grind2Mounts:setTimer(500)

				return true;
			end

		elseif GetMyClass() == "PALADIN" then

			if HasSpell("Summon Charger") then

				CastSpellByName("Summon Charger");

				grind2Mounts:setTimer(500)

				return true;
			end
	
			if HasSpell("Summon Warhorse") then

				CastSpellByName("Summon Warhorse");

				grind2Mounts:setTimer(500)

				return true;
			end

		else
	
			for i = 0, self.numMounts do

				if not IsMoving() then

					if HasItem(self.mounts[i]) then

						if UseItem(self.mounts[i]) then

							grind2Mounts:setTimer(500)

							return true;
						end
					end
				end
			end
		end
	end

	self.tryMountTimer = GetTimeEX() + 10000;
	return false;
end

function grind2Mounts:doWeHaveAMount()

	for i = 0, self.numMounts do

		if HasItem(self.mounts[i]) then

			return true;
		end
	end

	return false;
end

function DisMount()

	if IsMounted() then

		for i = 0, grind2Mounts.numMounts do

			if HasItem(grind2Mounts.mounts[i]) then

				if UseItem(grind2Mounts.mounts[i]) then

					return true;
				end
			end
		end
	end

	return false;
end