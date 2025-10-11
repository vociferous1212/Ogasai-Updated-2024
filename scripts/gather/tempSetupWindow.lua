tempSetupWindow = {pathNum = 0, numLocations = 0, savedLocations = {}, savePaths = false, savePathRange = 40}

function tempSetupWindow:tempSetupWindow()

	Text("Current pos in list - "..script_gathererPaths.currentLocationInPath)

	wasClicked, self.savePaths = Checkbox("Save Paths", self.savePaths);
	self.savePathRange = SliderInt("Save Path Range", 5, 60, self.savePathRange);

	if self.numLocations ~= 0 then
		for i = 1, self.numLocations -1 do
		local tX, tY, onScreen = WorldToScreen(self.savedLocations[i]['x'], self.savedLocations[i]['y'], self.savedLocations[i]['z'])
            if onScreen then
                DrawText('Path Node: '..i+1, tX, tY - 20, 0, 255, 255)
            end
		end
	end

	if self.savePaths then
	
		local x, y, z = GetLocalPlayer():GetPosition();
		-- Check: Don't save if we are outside the hotspot distance
		local save = true;
		if (self.numLocations > 0) and x ~= nil then
			for i = 0, self.numLocations -1 do
				local dist = math.sqrt((x-self.savedLocations[i]['x'])^2+(y-self.savedLocations[i]['y'])^2);
				if (dist < self.savePathRange) then
					save = false;
				end
			end
		end
		if save then
			self.savedLocations[self.numLocations] = {};
			self.savedLocations[self.numLocations]['x'] = x;
			self.savedLocations[self.numLocations]['y'] = y;
			self.savedLocations[self.numLocations]['z'] = z;
			self.numLocations = self.numLocations + 1;
				
			self.pathNum = self.pathNum + 1
			local a = nil;
			local b, c, d = GetLocalPlayer():GetPosition();
			local e = ");"

			if GetMapID() == 141 then
				a = "teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, "
			elseif GetMapID() == 148 then
				a = "darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, "
			elseif GetMapID() == 331 then
				a = "ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, "
			elseif GetMapID() == 361 then
				a = "felwoodGatherPaths:addFelwoodPath(self.numFelwoodPaths, "
			elseif GetMapID() == 12 then
				a = "elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, "
			elseif GetMapID() == 40 then
				a = "westfallGatherPaths:addWestfallPath(self.numWestfallPaths, "
			elseif GetMapID() == 10 then
				a = "duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, "
			elseif GetMapID() == 17 then
				a = "barrensGatherPaths:addBarrensPath(self.numBarrensPaths, "
			elseif GetMapID() == 14 then
				a = "durotarGatherPaths:addDurotarPath(self.numDurotarPaths, "
			elseif GetMapID() == 85 then	
				a = "tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, "
			elseif GetMapID() == 215 then
				a = "mulgoreGatherPaths:addMulgorePath(self.numMulgorePaths, "
			elseif GetMapID() == 11 then
				a = "wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, "
			elseif GetMapID() == 45 then
				a = "arathiGatherPaths:addArathiPath(self.numArathiPaths, "
			elseif GetMapID() == 440 then
				a = "tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, "
			elseif GetMapID() == 16 then
				a = "azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, "
			elseif GetMapID() == 357 then
				a = "feralasGatherPaths:addFeralasPath(self.numFeralasPaths, "
			elseif GetMapID() == 618 then
				a = "winterspringGatherPaths:addWinterspringPath(self.numWinterspringPaths, "
			elseif GetMapID() == 406 then
				a = "stonetalonGatherPaths:addStonetalonPath(self.numStonetalonPaths, "
			elseif GetMapID() == 405 then
				a = "desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, "
		--	elseif GetMapID() ==
		--		a = "feralasGatherPaths:addFeralasPath(self.numFeralasPaths, "

			end

		ToFile(a..b..", "..c..", "..d..e);
		DEFAULT_CHAT_FRAME:AddMessage("added to log file..."..self.pathNum);

		end
	end
end
