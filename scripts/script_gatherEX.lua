script_gatherEX = {drawFishingPools = false,}

--gather setup function
function script_gatherEX:setup()
	script_gather:addHerb('Peacebloom', 269, false, 1);
	script_gather:addHerb('Silverleaf', 270, false, 1);
	script_gather:addHerb('Earthroot', 414, false, 15);
	script_gather:addHerb('Mageroyal', 268, false, 50);
	script_gather:addHerb('Briarthorn', 271, false, 70);
	script_gather:addHerb('Stranglekelp', 700, false, 85);
	script_gather:addHerb('Bruiseweed', 358, false, 100);
	script_gather:addHerb('Wild Steelbloom', 371, false, 115);
	script_gather:addHerb('Grave Moss', 357, false, 120);
	script_gather:addHerb('Kingsblood', 320, false, 125);
	script_gather:addHerb('Liferoot', 677, false, 150);
	script_gather:addHerb('Fadeleaf', 697, false, 160);
	script_gather:addHerb('Goldthorn', 698, false, 170);
	script_gather:addHerb('Khadgars Whisker', 701, false, 185);
	script_gather:addHerb('Wintersbite', 699, false, 195);
	script_gather:addHerb('Firebloom', 2312, false, 205);
	script_gather:addHerb('Purple Lotus', 2314, false, 210);
	script_gather:addHerb('Arthas Tears', 2310, false, 220);
	script_gather:addHerb('Sungrass', 2315, false, 230);
	script_gather:addHerb('Blindweed', 2311, false, 235);
	script_gather:addHerb('Ghost Mushroom', 389, false, 245);
	script_gather:addHerb('Gromsblood', 2313, false, 250);
	script_gather:addHerb('Golden Sansam', 4652, false, 260);
	script_gather:addHerb('Dreamfoil', 4635, false, 270);
	script_gather:addHerb('Mountain Silversage', 4633, false, 280);
	script_gather:addHerb('Plaguebloom', 4632, false, 285);
	script_gather:addHerb('Icecap', 4634, false, 290);
	script_gather:addHerb('Black Lotus', 4636, false, 300);

	script_gather:addMineral('Copper Vein', 310, false, 1);
	script_gather:addMineral('Incendicite Mineral Vein', 384, false, 65);
	script_gather:addMineral('Tin Vein', 315, false, 65);
	script_gather:addMineral('Lesser Bloodstone Deposit', 48, false, 75);
	script_gather:addMineral('Silver Vein', 314, false, 75);
	script_gather:addMineral('Iron Deposit', 312, false, 125);
	script_gather:addMineral('Indurium Mineral Vein', 385, false, 150);
	script_gather:addMineral('Gold Vein', 311, false, 155);
	script_gather:addMineral('Mithril Deposit', 313, false, 175);
	script_gather:addMineral('Truesilver Deposit', 314, false, 205);
	script_gather:addMineral('Dark Iron Deposit', 2571, false, 230);
	script_gather:addMineral('Small Thorium Vein', 3951, false, 230);
	script_gather:addMineral('Rich Thorium Vein', 3952, false, 255);

	script_gather:addChest("Duskwood Chest", 123214);
	script_gather:addChest("Adamantite Bound Chest", 181802);
	script_gather:addChest("Battered Chest", 259);
	script_gather:addChest("Battered Chest", 2843);
	script_gather:addChest("Battered Chest", 2844);
	script_gather:addChest("Battered Chest", 2849);
	script_gather:addChest("Battered Chest", 106318);
	script_gather:addChest("Battered Chest", 106319);
	script_gather:addChest("Primitive Chest", 184793);
	script_gather:addChest("Large Iron Bound Chest", 74447);
	script_gather:addChest("Large Iron Bound Chest", 75297);
	script_gather:addChest("Large Iron Bound Chest", 75296);
	script_gather:addChest("Large Iron Bound Chest", 75295);
	script_gather:addChest("Large Mithril Bound Chest", 153468);
	script_gather:addChest("Large Mithril Bound Chest", 153469);
	script_gather:addChest("Large Mithril Bound Chest", 131978);
	script_gather:addChest("Bound Adamantite Chest", 184940);
	script_gather:addChest("Bound Adamantite Chest", 184938);
	script_gather:addChest("Bound Adamantite Chest", 184936);
	script_gather:addChest("Fel Iron Chest", 181798);
	script_gather:addChest("Heavy Fel Iron Chest", 181800);
	script_gather:addChest("Large Battered Chest", 75293);
	script_gather:addChest("Large Duskwood Chest", 131979);
	script_gather:addChest("Large Solid Chest", 74448);
	script_gather:addChest("Large Solid Chest", 75298);
	script_gather:addChest("Large Solid Chest", 75299);
	script_gather:addChest("Large Solid Chest", 75300);
	script_gather:addChest("Large Solid Chest", 153462);
	script_gather:addChest("Large Solid Chest", 153463);
	script_gather:addChest("Large Solid Chest", 153464);

	script_gather:addLock("Battered Footlocker", 5743);

	script_gather:addFish("Floating Wreckage", 6434);
	script_gather:addFish("Safefish School", 6435);
	script_gather:addFish("Firefin Snapper School", 6482);
	script_gather:addFish("Oily Blackmouth School", 6291);
end

function script_gatherEX:drawFishNodes()

	local targetObj, targetType = GetFirstObject();
	while targetObj ~= 0 do
		if (targetType == 5) then 
			local id = targetObj:GetObjectDisplayID();
			local fishName = "";
			local _x, _y, _z = targetObj:GetPosition();
			local _tX, _tY, onScreen = WorldToScreen(_x, _y, _z);
			local dist = math.floor(targetObj:GetDistance());

			if(onScreen) then

				-- show fishing pools by name
				for i=0,script_gather.numFish - 1 do
					if (script_gather.fish[i][1] == id) then
						fishName = "*"..script_gather.fish[i][0].."*";
						local this = ""..dist.." yd";
						DrawText(this, _tX-10, _tY+12, 0, 255, 0);
					end
				end
	
				-- draw fishing pool by name
				DrawText(fishName, _tX-25, _tY, 0, 255, 0);

			end
		end
	targetObj, targetType = GetNextObject(targetObj);
	end
end
