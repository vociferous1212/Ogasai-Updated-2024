getCurrentAreaAndPath = {}

function getCurrentAreaAndPath:getCurrentAreaAndPath()

	local areaPathsTable = {
		[1] = {
			area = "Dun Morogh",
			path = dunmoroghGatherPaths.dunmoroghPaths,
			numPath = dunmoroghGatherPaths.numDunmoroghPaths
		},
		[3] = {
			area = "Badlands",
			path = badlandsGatherPaths.badlandsPaths,
			numPath = badlandsGatherPaths.numBadlandsPaths
		},
		[4] = {
			area = "Blasted Lands",
			path = blastedlandsGatherPaths.blastedlandsPaths,
			numPath = blastedlandsGatherPaths.numBlastedlandsPaths
		},
		[8] = {
			area = "Swamp Of Sorrows",
			path = swampofsorrowsGatherPaths.swampofsorrowsPaths,
			numPath = swampofsorrowsGatherPaths.numSwampofsorrowsPaths
		},
		[10] = {
			area = "Duskwood",
			path = duskwoodGatherPaths.duskwoodPaths,
			numPath = duskwoodGatherPaths.numDuskwoodPaths
		},
		[11] = {
			area = "Wetlands",
			path = wetlandsGatherPaths.wetlandsPaths,
			numPath = wetlandsGatherPaths.numWetlandsPaths
		},
		[12] = {
			area = "Elwynn",
			path = elwynnGatherPaths.elwynnPaths,
			numPath = elwynnGatherPaths.numElwynnPaths
		},
		[14] = {
			area = "Durotar",
			path = durotarGatherPaths.durotarPaths,
			numPath = durotarGatherPaths.numDurotarPaths
		},
		[15] = {
			area = "Dustwallow Marsh",
			path = dustwallowGatherPaths.dustwallowPaths,
			numPath = dustwallowGatherPaths.numDustwallowPaths
		},
		[16] = {
			area = "Azshara",
			path = azsharaGatherPaths.azsharaPaths,
			numPath = azsharaGatherPaths.numAzsharaPaths
		},
		[17] = {
			area = "Barrens",
			path = barrensGatherPaths.barrensPaths,
			numPath = barrensGatherPaths.numBarrensPaths
		},
		[28] = {
			area = "Western Plaguelands",
			path = westernplaguelandsGatherPaths.westernplaguelandsPaths,
			numPath = westernplaguelandsGatherPaths.numWesternplaguelandsPaths
		},
		[33] = {
			area = "Stranglethorn Vale",
			path = stranglethornGatherPaths.stranglethornPaths,
			numPath = stranglethornGatherPaths.numStranglethornPaths
		},
		[36] = {
			area = "Alterac Mountains",
			path = alteracGatherPaths.alteracPaths,
			numPath = alteracGatherPaths.numAlteracPaths
		},
		[38] = {
			area = "Loch Modan",
			path = lochmodanGatherPaths.lochmodanPaths,
			numPath = lochmodanGatherPaths.numLochmodanPaths
		},
		[40] = {
			area = "Westfall",
			path = westfallGatherPaths.westfallPaths,
			numPath = westfallGatherPaths.numWestfallPaths
		},
		[41] = {
			area = "Deadwind Pass",
			path = deadwindGatherPaths.deadwindPaths,
			numPath = deadwindGatherPaths.numDeadwindPaths
		},
		[44] = {
			area = "Redridge Mountains",
			path = redridgeGatherPaths.redridgePaths,
			numPath = redridgeGatherPaths.numRedridgePaths
		},
		[45] = {
			area = "Arathi Highlands",
			path = arathiGatherPaths.arathiPaths,
			numPath = arathiGatherPaths.numArathiPaths
		},
		[46] = {
			area = "Burning Steppes",
			path = burningsteppesGatherPaths.burningsteppesPaths,
			numPath = burningsteppesGatherPaths.numBurningsteppesPaths
		},
		[47] = {
			area = "Hinterlands",
			path = hinterlandsGatherPaths.hinterlandsPaths,
			numPath = hinterlandsGatherPaths.numHinterlandsPaths
		},
		[51] = {
			area = "Searing Gorge",
			path = searinggorgeGatherPaths.searinggorgePaths,
			numPath = searinggorgeGatherPaths.numSearinggorgePaths
		},
		[85] = {
			area = "Tirisfal Glades",
			path = tirisfalGatherPaths.tirisfalPaths,
			numPath = tirisfalGatherPaths.numTirisfalPaths
		},
		[130] = {
			area = "Silverpine Forest",
			path = silverpineGatherPaths.silverpinePaths,
			numPath = silverpineGatherPaths.numSilverpinePaths
		},
		[137] = {
			area = "Silithus",
			path = silithusGatherPaths.silithusPaths,
			numPath = silithusGatherPaths.numSilithusPaths
		},
		[139] = {
			area = "Eastern Plaguelands",
			path = easternplaguelandsGatherPaths.easternplaguelandsPaths,
			numPath = easternplaguelandsGatherPaths.numEasternplaguelandsPaths
		},
		[141] = {
			area = "Teldrassil",
			path = teldrassilGatherPaths.teldrassilPaths,
			numPath = teldrassilGatherPaths.numTeldrassilPaths
		},
		[148] = {
			area = "Darkshore",
			path = darkshoreGatherPaths.darkshorePaths,
			numPath = darkshoreGatherPaths.numDarkshorePaths
		},
		[215] = {
			area = "Mulgore",
			path = mulgoreGatherPaths.mulgorePaths,
			numPath = mulgoreGatherPaths.numMulgorePaths
		},
		[267] = {
			area = "Hillsbrad Foothills",
			path = hillsbradGatherPaths.hillsbradPaths,
			numPath = hillsbradGatherPaths.numHillsbradPaths
		},
		[331] = {
			area = "Ashenvale",
			path = ashenvaleGatherPaths.ashenvalePaths,
			numPath = ashenvaleGatherPaths.numAshenvalePaths
		},
		[357] = {
			area = "Feralas",
			path = feralasGatherPaths.feralasPaths,
			numPath = feralasGatherPaths.numFeralasPaths
		},
		[361] = {
			area = "Felwood",
			path = felwoodGatherPaths.felwoodPaths,
			numPath = felwoodGatherPaths.numFelwoodPaths
		},
		[400] = {
			area = "Thousand Needles",
			path = thousandneedlesGatherPaths.thousandneedlesPaths,
			numPath = thousandneedlesGatherPaths.numThousandneedlesPaths
		},
		[405] = {
			area = "Desolace",
			path = desolaceGatherPaths.desolacePaths,
			numPath = desolaceGatherPaths.numDesolacePaths
		},
		[406] = {
			area = "Stonetalon Mountains",
			path = stonetalonGatherPaths.stonetalonPaths,
			numPath = stonetalonGatherPaths.numStonetalonPaths
		},
		[440] = {
			area = "Tanaris",
			path = tanarisGatherPaths.tanarisPaths,
			numPath = tanarisGatherPaths.numTanarisPaths
		},
		[490] = {
			area = "Un'goro Crater",
			path = ungoroGatherPaths.ungoroPaths,
			numPath = ungoroGatherPaths.numUngoroPaths
		},
		[493] = {
			area = "Moonglade",
			path = moongladeGatherPaths.moongladePaths,
			numPath = moongladeGatherPaths.numMoongladePaths
		},
		[618] = {
			area = "Winterspring",
			path = winterspringGatherPaths.winterspringPaths,
			numPath = winterspringGatherPaths.numWinterspringPaths
		}
	}

	local mapID = GetMapID()
	for id, data in pairs(areaPathsTable) do
		if id == mapID then
			script_gathererPaths.paths = data.path
			script_gathererPaths.numPaths = data.numPath
		end
	end
end
