script_grindSetup = {}

function script_grindSetup:setup()

-- used to auto select vendors based on position of last known position
	myLastX, myLastY, myLastZ = GetLocalPlayer():GetPosition();

	-- Classes that don't use mana
	local _ , class = UnitClass('player');
	if (class == "WARRIOR" or GetMyClass() == "WARRIOR") or (class == "ROGUE" or GetMyClass() == "ROGUE") then
		script_grind.useMana = false;
		script_grind.restMana = 0;
	end

	-- grind party or in a group using grind for some other reason?
	if (GetNumPartyMembers() >= 1) then
		script_paranoia.paranoidOn = false;
		script_grind.skipHardPull = false;
		script_grindEX.avoidBlacklisted = false;
		script_grindParty.forceTarget = true;
		script_grindParty.waitForGroup = true;
		script_grind.drawEnabled = false;
		script_grind.drawUnits = false;
		script_grind.useExpChecker = false;
		
	end

	if (strfind("HUNTER", class)) or GetMyClass() == "HUNTER" then
		script_hunter.waitAfterCombat = true;
	end

	if (strfind("WARLOCK", class)) or GetMyClass() == "WARLOCK" then
		script_warlock.waitAfterCombat = true;
	end
	
	-- No refill as mage or at level 1
	if (strfind("MAGE", class)) or GetMyClass() == "MAGE" then
		script_grind.vendorRefill = false;
	end

	-- don't refill water or food on start of bot
	if (GetLocalPlayer():GetLevel() < 3) then
		script_grind.vendorRefill = false;
	end

	if ((UnitClass("Player") == "ROGUE" or GetMyClass() == "ROGUE") and script_rogue.useStealth) or (HasSpell("Prowl") and script_druid.useStealth) then
		script_grind.blacklistTime = 45;
	end

	-- don't skip hard pulls or elites when we are at starter zones or in a group
	if GetLocalPlayer():GetLevel() <= 5 or GetNumPartyMembers() ~= 0 then
		script_grind.skipHardPull = false;
		script_grind.skipElites = false;
		script_grind.blacklistTime = 20;
	end
	if (GetLocalPlayer():GetLevel() <= 10) then
		script_grind.getSpells = true;
		--script_grind.useFPS = true;
	end

	-- enable drawing unit info on screen
	script_grind.drawEnabled = true;
	
	-- setup helper script
	script_helper:setup();
	
	-- setup talent script
	script_talent:setup();

	-- setup vendor script
	script_vendor:setup();

	-- setup gather script
	script_gather:setup();

	-- vendor database script loaded
	vendorDB:setup();

	-- hotspot database script loaded
	hotspotDB:setup();

	-- auto load sell vendors
	vendorDB:loadDBVendors();

	script_getSpells:setup();

	-- navigation script loaded
	script_nav:setup();

	-- load all combat script setups now
	script_rogue:setup();
	script_druid:setup();
	script_mage:setup();
	script_warlock:setup();
	script_warrior:setup();
	script_paladin:setup();
	script_shaman:setup();
	script_priest:setup();

	-- safer min level for low level botting
	if (GetLocalPlayer():GetLevel() < 20) then
		script_grind.minLevel = GetLocalPlayer():GetLevel() - 3;
	end
	
	-- don't stop bot on next level if level is under 10
	if (GetLocalPlayer():GetLevel() < 10) then
		script_paranoia.stopOnLevel = false;
	end

	-- turn on skinning if have
	if (HasSpell("Skinning")) then
		script_grind.skinning = true;
	end
	-- turn on herbs
	if (HasSpell("Find Herbs")) then
		script_grind.gather = true;
	end
	-- turn on mining
	if (HasSpell("Find Minerals")) then
		script_grind.gather = true;
		script_gather.blacklistSetTime = 30;
	end

	-- change some values to random
	local randomLogout = math.random(25, 40);
	script_grind.setParanoidTimer = randomLogout;
	local randomHotspot = math.random(200, 375);
	script_grind.distToHotSpot = randomHotspot;
	local randomSetTimer = math.random(3, 10);
	script_grind.paranoidSetTimer = randomSetTimer;
	local randomRange = math.random(45, 100);
	script_grind.paranoidRange = randomRange;

	-- set timers for script to run based on grind script timer
	script_grind.nodeTimer = GetTimeEX();
	script_grind.attackTimer = GetTimeEX();
	script_grind.blacklistLootTime = GetTimeEX();
	script_grind.blacklistLootTimeCheck = GetTimeEX() + script_grind.blacklistLootTimeVar * 1000;
	script_grind.deleteCheckTimer = GetTimeEX();
	script_shamanTotems.waitTimer = GetTimeEX();
	script_grind.swimJumpTimer = GetTimeEX();
	script_grind.lootCheck['target'] = 0;
	script_grind.lootCheck['timer'] = GetTimeEX() + 10000;
	script_grind.buffTimer = GetTimeEX();
	script_getSpells.waitTimer = GetTimeEX();
	script_navEX.waitTimer = GetTimeEX();
	script_grind.timeToSit = GetTimeEX();
	script_grindEX.waitTimer = GetTimeEX();
	script_aggro.waitTimer = GetTimeEX();
	script_grind.moveTimer = GetTimeEX();
	script_goToFP.goToFPTimer = GetTimeEX();
	script_nav.timer = GetTimeEX();
	script_navEXCombat.timer = GetTimeEX();
	script_grindEX.tryTravelFormTimer = GetTimeEX();
	script_grind.autoBlacklistTimer = GetTimeEX();
	script_grind.checkTotemKillTimer = GetTimeEX();
	script_helper.gateTimer = GetTimeEX();
	script_grindEX.deleteItemTimer = GetTimeEX();
	script_grind.unstuckTimer = GetTimeEX();
	script_grind.lootCheckTime = 10000;
	script_grind.resetBlacklistLootTableTimer = GetTimeEX();

	-- if we are a melee class we can blacklist loot sooner since we are closer
	if GetMyClass() == "ROGUE" or GetMyClass() == "WARRIOR" or GetMyClass() == "SHAMAN" or GetMyClass() == "DRUID" or GetMyClass() == "PALADIN" then
		script_grind.blacklistLootTimeVar = 10;
	end

	local level = GetLocalPlayer():GetLevel();
	if (level < 6) then
		script_gather.safeGather = false;
	end
	if (level < 10) then
		script_checkAdds.addsRange = 18;
		script_grind.paranoidRange = 25;
		script_grind.paranoidSetTimer = 3;
	end
	if (level >= 10) and (level < 40) then
		script_checkAdds.addsRange = 23;
	end
	if (level > 40) then
		script_checkAdds.addsRange = 25;
	end
	if (level == 60) then
		script_checkAdds.addsRange = 28;
	end

	-- Check bags if they are full
	if (not HasSpell("Auto Shot")) then
		local inventoryFull = true;
		for i = 1, 5 do 
			if (i ~= 0) then 
				for y=1,GetContainerNumSlots(i-1) do 
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					if (itemCount == 0 or itemCount == nil) then 
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we cant loot
		if (inventoryFull) then
			script_grind.bagsFull = true;
		end
		if (not inventoryFull) then
			script_grind.bagsFull = false;
		end
	elseif HasSpell("Auto Shot") then 
		local inventoryFull = true;

		-- skip slot 5, it's a quiver
		for i = 1, 4 do 
			if (i ~= 0) then 
				for y=1,GetContainerNumSlots(i-1) do 
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					if (itemCount == 0 or itemCount == nil) then 
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we cant loot
		if (inventoryFull) then
			script_grind.bagsFull = true;
		end
		if (not inventoryFull) then
			script_grind.bagsFull = false;
		end
	end

end