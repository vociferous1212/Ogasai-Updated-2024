_questEquipItems = {isBagsSetup = false, bagTable = {}, bagTableNum = 0}

--if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end
-- check to see if we have bags or not
function _questEquipItems:checkMyBags()

	if GetBagName(4) == nil then
		return true;
	end

return false;
end

function _questEquipItems:addBagsToTable(name)
	self.bagTable[self.bagTableNum] = {};
	self.bagTable[self.bagTableNum]['name'] = name;
	self.bagTableNum = self.bagTableNum + 1;
end

function _questEquipItems:bagsSetup()
	_questEquipItems:addBagsToTable("Small Brown Pouch");
	_questEquipItems:addBagsToTable("Small Red Pouch");
	_questEquipItems:addBagsToTable("Small Black Pouch");
	_questEquipItems:addBagsToTable("Small Blue Pouch");
	_questEquipItems:addBagsToTable("Small Green Pouch");
self.isBagsSetup = true;
end

--check inventory for bags
function _questEquipItems:checkInventoryForBags()

	if not self.isBagsSetup then
		_questEquipItems:bagsSetup();
	end

	if _quest.waitTimer > GetTimeEX() then
		return;
	end

	local name = nil;

	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 

	-- do we have a bag in slot 4?
	if _questEquipItems:checkMyBags() then

		if GetMyClass() == "HUNTER" then
			for i = 0, 3 do 

				for y=0,GetContainerNumSlots(i) do 
	
					if (GetContainerItemLink(i,y) ~= nil) then

						_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
			
						itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink); 

						for u = 0, self.bagTableNum -1 do
							if itemName == self.bagTable[u]['name'] then
								name = itemName
							end
						end
						if (UseItem(name)) then
							_quest:setTimer(500);
						end
					end
				end 
			end
		else
			for i = 0, 4 do 

				for y=0,GetContainerNumSlots(i) do 
	
					if (GetContainerItemLink(i,y) ~= nil) then

						_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
			
						itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink); 

						for u = 0, self.bagTableNum -1 do
							if itemName == self.bagTable[u]['name'] then
								name = itemName
							end
						end
						if (UseItem(name)) then
							_quest:setTimer(500);
						end
					end
				end 
			end
		end
	end

return false;
end



function CheckBagsForBetterGear()

	local _, playerClass = UnitClass("player")
	local playerLevel = UnitLevel("player")
	local isLowLevel = playerLevel <= 8

	local slotNames = {
		[1] = "Head", [3] = "Shoulders", [5] = "Chest", [6] = "Waist",
		[7] = "Legs", [8] = "Feet", [9] = "Wrists", [10] = "Hands",
		[11] = "Finger 1", [12] = "Finger 2", [13] = "Trinket 1",
		[14] = "Trinket 2", [15] = "Back", [16] = "Main Hand",
		[17] = "Off Hand", [18] = "Ranged"
	}

	local validEquipTypes = {
		["INVTYPE_HEAD"] = true, ["INVTYPE_SHOULDER"] = true, ["INVTYPE_CHEST"] = true,
		["INVTYPE_WAIST"] = true, ["INVTYPE_LEGS"] = true, ["INVTYPE_FEET"] = true,
		["INVTYPE_WRIST"] = true, ["INVTYPE_HAND"] = true, ["INVTYPE_FINGER"] = true,
		["INVTYPE_TRINKET"] = true, ["INVTYPE_CLOAK"] = true, ["INVTYPE_WEAPON"] = true,
		["INVTYPE_WEAPONMAINHAND"] = true, ["INVTYPE_WEAPONOFFHAND"] = true,
		["INVTYPE_RANGED"] = true, ["INVTYPE_THROWN"] = true, ["INVTYPE_SHIELD"] = true,
		["INVTYPE_2HWEAPON"] = true
	}

	local armorProficiencies = {
		["WARRIOR"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = true, ["Plate"] = playerLevel >= 40, ["Shield"] = true },
		["PALADIN"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = true, ["Plate"] = playerLevel >= 40, ["Shield"] = true },
		["HUNTER"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = playerLevel >= 40 },
		["ROGUE"] = { ["Cloth"] = true, ["Leather"] = true },
		["PRIEST"] = { ["Cloth"] = true },
		["SHAMAN"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = playerLevel >= 40, ["Shield"] = true },
		["MAGE"] = { ["Cloth"] = true },
		["WARLOCK"] = { ["Cloth"] = true },
		["DRUID"] = { ["Cloth"] = true, ["Leather"] = true }
	}

	local weaponProficiencies = {
		["WARRIOR"] = { ["Dagger"] = true, ["Sword"] = true, ["Mace"] = true, ["Axe"] = true, ["Polearm"] = true, ["Staff"] = true, ["Bow"] = true, ["Crossbow"] = true, ["Gun"] = true, ["Thrown"] = true, ["Fist"] = true },
		["PALADIN"] = { ["Sword"] = true, ["Mace"] = true, ["Axe"] = true, ["Polearm"] = true, ["Two-Handed Sword"] = true, ["Two-Handed Mace"] = true, ["Two-Handed Axe"] = true },
		["HUNTER"] = { ["Dagger"] = true, ["Axe"] = true, ["Sword"] = true, ["Polearm"] = true, ["Staff"] = true, ["Bow"] = true, ["Crossbow"] = true, ["Gun"] = true, ["Thrown"] = true },
		["ROGUE"] = { ["Dagger"] = true, ["Sword"] = true, ["Mace"] = true, ["Fist"] = true, ["Bow"] = true, ["Crossbow"] = true, ["Gun"] = true, ["Thrown"] = true },
		["PRIEST"] = { ["Dagger"] = true, ["Mace"] = true, ["Staff"] = true, ["Wand"] = true },
		["SHAMAN"] = { ["Mace"] = true, ["Axe"] = true, ["Staff"] = true, ["Dagger"] = true },
		["MAGE"] = { ["Dagger"] = true, ["Staff"] = true, ["Wand"] = true },
		["WARLOCK"] = { ["Dagger"] = true, ["Staff"] = true, ["Wand"] = true },
		["DRUID"] = { ["Dagger"] = true, ["Mace"] = true, ["Staff"] = true, ["Polearm"] = true, ["Fist"] = true }
	}

	local statPriorities = {
		["ROGUE"] = "Agility",
		["DRUID"] = "Agility",
		["HUNTER"] = "Agility",
		["SHAMAN"] = "Agility",
		["WARRIOR"] = "Strength",
		["PALADIN"] = "Strength",
		["MAGE"] = "Intellect",
		["WARLOCK"] = "Stamina",
		["PRIEST"] = "Intellect"
	}

	local function GetStatScore(itemName, priorityStat)
		if not itemName then return 0 end
		local score = 0
		if priorityStat == "Agility" and string.find(itemName, "of Agility") then
			score = 10
		elseif priorityStat == "Strength" and string.find(itemName, "of Strength") then
			score = 10
		elseif priorityStat == "Intellect" and string.find(itemName, "of Intellect") then
			score = 10
		elseif priorityStat == "Stamina" and string.find(itemName, "of Stamina") then
			score = 10
		end
		return score
	end

	local function GetItemScore(itemRarity, isLowLevel)
		local score = itemRarity or 0
		if isLowLevel and score == 0 then
			score = 5  -- Boost grey items (rarity 0) at low levels
		elseif isLowLevel then
			score = score - 1  -- Reduce white (rarity 1) priority to favor grey
		end
		return score
	end

	OpenAllBags()

	for bagID = 0, 4 do
		local numSlots = GetContainerNumSlots(bagID)
		if numSlots and numSlots > 0 then
			for slotID = 1, numSlots do
				local itemLink = GetContainerItemLink(bagID, slotID)
				if itemLink then
					local _, _, parsedItemLink = string.find(itemLink, "(item:%d+)")
					if parsedItemLink then
						local itemName, _, itemRarity, _, _, _, _, itemStackCount = GetItemInfo(parsedItemLink)
						if itemName and itemRarity and itemStackCount and itemStackCount ~= "" and validEquipTypes[itemStackCount] then
							local isEquippable = false
							local classArmorProfs = armorProficiencies[playerClass]
							local classWeaponProfs = weaponProficiencies[playerClass]

							-- Armor check
							if itemStackCount == "INVTYPE_HEAD" or itemStackCount == "INVTYPE_SHOULDER" or itemStackCount == "INVTYPE_CHEST" or
							   itemStackCount == "INVTYPE_WAIST" or itemStackCount == "INVTYPE_LEGS" or itemStackCount == "INVTYPE_FEET" or
							   itemStackCount == "INVTYPE_WRIST" or itemStackCount == "INVTYPE_HAND" then
								if (classArmorProfs["Cloth"] and string.find(itemName, "Cloth")) or
								   (classArmorProfs["Leather"] and string.find(itemName, "Leather")) or
								   (classArmorProfs["Mail"] and string.find(itemName, "Mail")) or
								   (classArmorProfs["Plate"] and string.find(itemName, "Plate")) then
									isEquippable = true
								end
							elseif itemStackCount == "INVTYPE_CLOAK" and classArmorProfs["Cloth"] then
								isEquippable = true
							elseif itemStackCount == "INVTYPE_SHIELD" and classArmorProfs["Shield"] then
								isEquippable = true
							-- Weapon check
							elseif itemStackCount == "INVTYPE_WEAPON" or itemStackCount == "INVTYPE_WEAPONMAINHAND" or itemStackCount == "INVTYPE_WEAPONOFFHAND" or
								   itemStackCount == "INVTYPE_2HWEAPON" or itemStackCount == "INVTYPE_RANGED" or itemStackCount == "INVTYPE_THROWN" then
								if (string.find(itemName, "Dagger") and classWeaponProfs["Dagger"]) or
								   (string.find(itemName, "Sword") and classWeaponProfs["Sword"]) or
								   (string.find(itemName, "Mace") and classWeaponProfs["Mace"]) or
								   (string.find(itemName, "Axe") and classWeaponProfs["Axe"]) or
								   (string.find(itemName, "Polearm") and classWeaponProfs["Polearm"]) or
								   (string.find(itemName, "Staff") and classWeaponProfs["Staff"]) or
								   (string.find(itemName, "Bow") and classWeaponProfs["Bow"]) or
								   (string.find(itemName, "Crossbow") and classWeaponProfs["Crossbow"]) or
								   (string.find(itemName, "Gun") and classWeaponProfs["Gun"]) or
								   (string.find(itemName, "Wand") and classWeaponProfs["Wand"]) or
								   (string.find(itemName, "Fist") and classWeaponProfs["Fist"]) or
								   (string.find(itemName, "Thrown") and classWeaponProfs["Thrown"]) or
								   ((itemStackCount == "INVTYPE_2HWEAPON") and (
										(string.find(itemName, "Sword") and classWeaponProfs["Two-Handed Sword"]) or
										(string.find(itemName, "Mace") and classWeaponProfs["Two-Handed Mace"]) or
										(string.find(itemName, "Axe") and classWeaponProfs["Two-Handed Axe"])
									)) then
									isEquippable = true
								end
							-- Non-armor/weapon
							elseif itemStackCount == "INVTYPE_FINGER" or itemStackCount == "INVTYPE_TRINKET" then
								isEquippable = true
							end

							if isEquippable then
								local targetSlot
								if itemStackCount == "INVTYPE_HEAD" then targetSlot = 1
								elseif itemStackCount == "INVTYPE_SHOULDER" then targetSlot = 3
								elseif itemStackCount == "INVTYPE_CHEST" or itemStackCount == "INVTYPE_ROBE" then targetSlot = 5
								elseif itemStackCount == "INVTYPE_WAIST" then targetSlot = 6
								elseif itemStackCount == "INVTYPE_LEGS" then targetSlot = 7
								elseif itemStackCount == "INVTYPE_FEET" then targetSlot = 8
								elseif itemStackCount == "INVTYPE_WRIST" then targetSlot = 9
								elseif itemStackCount == "INVTYPE_HAND" then targetSlot = 10
								elseif itemStackCount == "INVTYPE_FINGER" then targetSlot = 11
								elseif itemStackCount == "INVTYPE_TRINKET" then targetSlot = 13
								elseif itemStackCount == "INVTYPE_CLOAK" then targetSlot = 15
								elseif itemStackCount == "INVTYPE_WEAPON" or itemStackCount == "INVTYPE_WEAPONMAINHAND" or itemStackCount == "INVTYPE_2HWEAPON" then targetSlot = 16
								elseif itemStackCount == "INVTYPE_WEAPONOFFHAND" or itemStackCount == "INVTYPE_SHIELD" then targetSlot = 17
								elseif itemStackCount == "INVTYPE_RANGED" or itemStackCount == "INVTYPE_THROWN" then targetSlot = 18
								end

								if targetSlot then
									local slotsToCheck = { targetSlot }
									if itemStackCount == "INVTYPE_FINGER" then
										slotsToCheck = { 11, 12 }
									elseif itemStackCount == "INVTYPE_TRINKET" then
										slotsToCheck = { 13, 14 }
									end

									local itemStatScore = GetStatScore(itemName, statPriorities[playerClass])
									local itemScore = GetItemScore(itemRarity, isLowLevel)

									for _, slotID in ipairs(slotsToCheck) do
										local equippedItemLink = GetInventoryItemLink("player", slotID)
										local equippedStatScore = 0
										local equippedRarity = -1
										local equippedScore = -1
										local equippedName = "None"

										if equippedItemLink then
											local _, _, parsedEquippedLink = string.find(equippedItemLink, "(item:%d+)")
											if parsedEquippedLink then
												equippedName, _, equippedRarity = GetItemInfo(parsedEquippedLink)
												if equippedName and equippedRarity then
													equippedStatScore = GetStatScore(equippedName, statPriorities[playerClass])
													equippedScore = GetItemScore(equippedRarity, isLowLevel)
												end
											end
										end

										local shouldEquip = false
										if isLowLevel then
											if itemScore > equippedScore then
												shouldEquip = true
											elseif itemScore == equippedScore and itemStatScore > equippedStatScore then
												shouldEquip = true
											end
										else
											if itemStatScore > equippedStatScore then
												shouldEquip = true
											elseif itemStatScore == equippedStatScore and itemRarity > equippedRarity then
												shouldEquip = true
											end
										end

										if shouldEquip then
											UseItem(itemName)
					if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end