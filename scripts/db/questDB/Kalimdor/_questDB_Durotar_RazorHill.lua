_questDB_Durotar_RazorHill = {isSetup = false;}

function _questDB_Durotar_RazorHill:setup()

local questDescription, questObjectives = GetQuestLogQuestText(1);

--_questDB:addQuest("no", 1, "", "", xyz, 14, 6, 10, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 14, 6, 10, xyz, type

_questDB:addQuest("no", 1, "Conscript of the Horde", "Takrin Pathseeker", 271.80499267578, -4650.830078125, 11.70618057251, 14, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 303.43200683594, -3686.1599121094, 27.067232131958, "Kargal Battlescar", 0, 0, 0, 0, 0, 0, "Follow the western road from Razor Hill to the Barrens over a bridge.\n\nStop at the orc outpost across the bridge.\n\nGive Kargal Battlescar at the Barrens outpost your recruitment letter.", 0, 1);

_questDB:addQuest("no", 1, "Minshina's Skull", "Master Gadrin", -825.63598632813, -4920.759765625, 19.358591079712, 14, 8, 14, -1284.7291259766, -5529.193359375, 15.194599151611, 2, 0, 0, 0, 1, 0, -825.63598632813, -4920.759765625, 19.358591079712, "Master Gadrin", 0, 0, 0, 226, 0, 1, "Retrieve Minshina's skull from the circle of power on the Echo Isles.\n\nBring it to Master Gadrin in Sen'jin Village.", 0, 1);

_questDB:addQuest("no", 1, "Zalazane", "Master Gadrin", -825.63598632813, -4920.759765625, 19.358591079712, 14, 6, 14, -1199.3676757813, -5501.9174804688, 5.7512197494507, 1, 1, 10, 10, 0, 0, -825.63598632813, -4920.759765625, 19.358591079712, "Master Gadrin", "Zalazane", "Hexed Troll", "Voodoo Troll", 0, 0, 2, "Defeat Zalazane.\n\nKill 8 Voodoo Trolls and 8 Hexed Trolls.\n\nBring Zalazane's Head to Gadrin.", 0, 2);

_questDB:addQuest("no", 1, "Practical Prey", "Vel'rin Fang", -797.52301025391, -4921.169921875, 22.874328613281, 14, 8, 14, -1382.1340332031, -5183.8759765625, 2.2133538722992, 99, 10, 0, 0, 0, 0, -797.52301025391, -4921.169921875, 22.874328613281, "Vel'rin Fang", "Durotar Tiger", 0, 0, 0, 0, 0, "Bring 4 Durotar Tiger Furs to Vel'rin Fang in Sen'jin Village.", 0, 1);

_questDB:addQuest("no", 1, "Break a Few Eggs", "Cook Torka", 312.09899902344, -4664.9501953125, 16.353736877441, 14, 6, 12, -1065.3076171875, -5152.2578125, 0.53842830657959, 2, 0, 0, 0, 3, 0, 312.09899902344, -4664.9501953125, 16.353736877441, "Cook Torka", 0, 0, 0, 412, 0, 2, "Bring 3 Taillasher Eggs to Cook Torka in Razor Hill.", 0, 1);

_questDB:addQuest("no", 1, "Winds in the Desert", "Rezlak", 999.76300048828, -4414.3999023438, 14.388426780701, 14, 6, 12, 845.51995849609, -4678.6469726563, 10.663455963135, 2, 0, 0, 0, 323, 0, 999.76300048828, -4414.3999023438, 14.388426780701, "Rezlak", 0, 0, 0, 323, 0, 0, "Retrieve 5 Sacks of Supplies and return them to Rezlak near Orgrimmar.", 0, 1);

_questDB:addQuest("no", 1, "Thwarting Kolkar Aggression", "Lar Prowltusk", -814.41998291016, -4837.2099609375, 21.444341659546, 14, 6, 12, -1028.0526123047, -4477.10546875, 26.444641113281, 2, 0, 0, 0, 3, 0, -814.41998291016, -4837.2099609375, 21.444341659546, "Lar Prowltusk", 0, 0, 0, 210, 0, 2, "Lar Prowltusk outside of Sen'jin Village wants you to destroy the 3 sets of Attack Plans held within Kolkar Crag.", 0, 1);

_questDB:addQuest("no", 1, "Carry Your Weight", "Furl Scornbrow", 384.74301147461, -4600.1298828125, 76.088417053223, 14, 6, 12, -980.15240478516, -4620.0561523438, 25.402267456055, 1, 20, 20, 0, 0, 0, 384.74301147461, -4600.1298828125, 76.088417053223, "Furl Scornbrow", "Kolkar Drudge", "Kolkar Outrunner", 0, 0, 0, 1, "Furl Scornbrow in the Razor Hill watchtower wants 8 Canvas Scraps.", 0, 1);

_questDB:addQuest("no", 1, "A Solvent Spirit", "Master Vornal", -813.99401855469, -4920.5698242188, 19.353820800781, 14, 6, 12, -983.638671875, -4950.9658203125, 2.2797949314117, 1, 10, 10, 0, 0, 0, -813.99401855469, -4920.5698242188, 19.353820800781, "Master Vornal", "Pygmy Surf Crawler", "Makrura Clacker", 0, 0, 0, 1, "Bring 4 Intact Makrura Eyes and 8 vials of Crawler Mucus to Master Vornal in Sen'jin Village.", 0, 1);

_questDB:addQuest("no", 1, "A Peon's Burden", "Ukor", -599.44897460938, -4715.3198242188, 35.146465301514, 14, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 340.36199951172, -4686.2900390625, 16.457960128784, "Innkeeper Grosk", 0, 0, 0, 0, 0, 2, "Bring Ukor's Burden to Innkeeper Grosk in Razor Hill.", 0, 1);

_questDB:addQuest("no", 1, "Report to Orgnil", "Master Gadrin", -825.63598632813, -4920.759765625, 19.358600616455, 14, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 287.26501464844, -4724.8798828125, 13.131739616394, "Orgnil Soulscar", 0, 0, 0, 0, 0, 0, "Speak with Orgnil Soulscar in Razor Hill.", 0, 2);

if GetMyClass() == "SHAMAN" then
	if questObjectives == "Find Kranal Fiss in the Barrens." then

		--call of fire
		_questDB:addQuest("no", 1, "Call of Fire", "Kranal Fiss", 260.59149169922, -3042.9353027344, 96.310523986816, 14, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -265.56140136719, -4000.3620605469, 169.64166259766, "Telf Joolam", 0, 0, 0, 0, 0, 0, "Bring the Torch of the Dormant Flame to Telf Joolam in Durotar.", 0, 0);
	end
end




self.isSetup = true;
end