coremenu = {

	isSetup = false,
}

function coremenu:reload()

	self.isSetup = false;

	coremenu:draw();
end

function coremenu:draw()


	if self.isSetup == false and coremenu ~= nil then

		--[[
			----------------------------
			Core Files
			----------------------------
		]]--

		include("core\\core.lua");
		include("core\\functions.lua");
		include("core\\racialSpells.lua");
		include("core\\instantCastSpells.lua");
		-- Load DBs
		include("scripts\\db\\vendorDB.lua");
		include("scripts\\db\\hotspotDB.lua");

		--[[
			----------------------------
			Class Rotations
			----------------------------
		]]--

		LoadScript("Shaman", "scripts\\combat\\shaman\\script_shaman.lua");
		AddScriptToCombat("Shaman", "script_shaman");

		LoadScript("Druid", "scripts\\combat\\druid\\script_druid.lua");
		AddScriptToCombat("Druid", "script_druid");

		LoadScript("Warlock", "scripts\\combat\\warlock\\script_warlock.lua");
		AddScriptToCombat("Warlock", "script_warlock");

		--LoadScript("Warlock 2", "scripts\\combat\\warlock\\script_warlock2.lua");
		--AddScriptToCombat("Warlock 2", "script_warlock2");

		LoadScript("Mage", "scripts\\combat\\mage\\script_mage.lua");
		AddScriptToCombat("Mage", "script_mage");

		LoadScript("Rogue", "scripts\\combat\\rogue\\script_rogue.lua");
		AddScriptToCombat("Rogue", "script_rogue");

		LoadScript("Hunter", "scripts\\combat\\hunter\\script_hunter.lua");
		AddScriptToCombat("Hunter", "script_hunter");

		LoadScript("Paladin", "scripts\\combat\\paladin\\script_paladin.lua");
		AddScriptToCombat("Paladin", "script_paladin");

		LoadScript("Priest", "scripts\\combat\\priest\\script_priest.lua");
		AddScriptToCombat("Priest", "script_priest");

		LoadScript("Warrior", "scripts\\combat\\warrior\\script_warrior.lua");
		AddScriptToCombat("Warrior", "script_warrior");

		--[[
			----------------------------
			Bot Types
			----------------------------
		]]--

		LoadScript("Grinder", "scripts\\script_grind.lua");
		AddScriptToMode("Grinder", "script_grind");

		LoadScript("Grinder2", "scripts\\grind2\\grind2.lua");
		AddScriptToMode("Grinder2", "grind2");
		
		LoadScript("Quester", "scripts\\quester\\_quest.lua");
		AddScriptToMode("Quester 1 - 20", "_quest");

		LoadScript("Follower", "scripts\\follow\\script_follow.lua");
		AddScriptToMode("Follower", "script_follow");

		LoadScript("Rotation", "scripts\\script_rotation.lua");
		AddScriptToMode("Rotation", "script_rotation");

		LoadScript("Fishing", "scripts\\gather\\script_fish.lua");
		AddScriptToMode("Fishing", "script_fish");

		LoadScript("Gatherer", "scripts\\gather\\script_gatherer.lua");
		AddScriptToMode("Gatherer", "script_gatherer");

		--LoadScript("Test Enviornment", "scripts\\testEnviornment.lua");
		--AddScriptToMode("Test Enviornment", "testEnviornment");
		-- Nav Mesh Runner by Rot, Improved by Logitech
		--LoadScript("Runner", "scripts\\script_runner.lua");
		--AddScriptToMode("Runner", "script_runner");
		--LoadScript("Unstuck Test", "scripts\\script_unstuck.lua");
		--AddScriptToMode("Unstuck Test", "script_unstuck");
		--LoadScript("Pather", "scripts\\script_pather.lua");
		--AddScriptToMode("Pather Debug", "script_pather");

	self.isSetup = true;

	end

end