tempSetupWindow = {pathNum = 1}

function tempSetupWindow:tempSetupWindow()

	Text("Current pos in list - "..script_gathererPaths.currentLocationInPath)
-- add current position to file as a path node

	if Button("Add to file") then
		self.pathNum = self.pathNum + 1
		local a = nil;
		local b, c, d = GetLocalPlayer():GetPosition();
		local e = ");"

		if GetMapID() == 141 then
			a = "teldrassilGatherPaths:addTeldrassilPath(teldrassilGatherPaths.numTeldrassilPaths, "
		elseif GetMapID() == 148 then
			a = "darkshoreGatherPaths:addDarkshorePath(darkshoreGatherPaths.numDarkshorePaths, "
		elseif GetMapID() == 331 then
			a = "ashenvaleGatherPaths:addAshenvalePath(ashenvaleGatherPaths.numAshenvalePaths, "
		elseif GetMapID() == 361 then
			a = "felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, "
		elseif GetMapID() == 12 then
			a = "elwynnGatherPaths:addElwynnPath(elwynnGatherPaths.numElwynnPaths, "
		elseif GetMapID() == 40 then
			a = "westfallGatherPaths:addWestfallPath(westfallGatherPaths.numWestfallPaths, "
		elseif GetMapID() == 10 then
			a = "duskwoodGatherPaths:addDuskwoodPath(duskwoodGatherPaths.numDuskwoodPaths, "
		elseif GetMapID() == 17 then
			a = "barrensGatherPaths:addBarrensPath(barrensGatherPaths.numBarrensPaths, "
		elseif GetMapID() == 14 then
			a = "durotarGatherPaths:addDurotarPath(durotarGatherPaths.numDurotarPaths, "
		elseif GetMapID() == 85 then	
			a = "tirisfalGatherPaths:addTirisfalPath(tirisfalGatherPaths.numTirisfalPaths, "
		elseif GetMapID() == 215 then
			a = "mulgoreGatherPaths:addMulgorePath(mulgoreGatherPaths.numMulgorePaths, "
		elseif GetMapID() == 11 then
			a = "wetlandsGatherPaths:addWetlandsPath(wetlandsGatherPaths.numWetlandsPaths, "
		elseif GetMapID() == 45 then
			a = "arathiGatherPaths:addArathiPath(arathiGatherPaths.numArathiPaths, "


		end
	ToFile(a..b..", "..c..", "..d..e);
	DEFAULT_CHAT_FRAME:AddMessage("added to log file..."..self.pathNum);
	end
end