_questDB_Mulgore_CampNarache = {

isSetup = false

}

function _questDB_Mulgore_CampNarache:setup()

--[[(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)]]--

_questDB:addQuest("no", 1, "Rites of the Earthmother", "Chief Hawkwind", -2877.9499511719, -221.83000183105, 54.820861816406, 215, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2333.5400390625, -393.07299804688, -8.0124425888062, "Baine Bloodhoof", 0, 0, 0, 0, 0, 2, "Take the Totem of Hawkwind to Baine Bloodhoof in Bloodhoof Village. Follow the road out of Camp Narache.", 0, 1);

_questDB:addQuest("no", 1, "Break Sharptusk!", "Brave Windfeather", -2920.3586425781, -254.90600585938, 52.97253036499, 215, 4, 8, -2940.2119140625, -1217.6257324219, 61.54547882080, 1, 1, 0, 0, 0, 0, -2920.3586425781, -254.90600585938, 52.97253036499, "Brave Windfeather", "Chief Sharptusk Thornmantle", 0, 0, 0, 0, 2, "Bring the head of Chief Sharptusk Thornmantle to Brave Windfeather in Red Cloud Mesa.", 0, 1);

if GetMyClass() == "SHAMAN" then

	_questDB:addQuest("no", 1, "Call of Earth", "Minor Manifestation of Earth", -3031.3601074219, -720.8330078125, 44.890098571777, 215, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2882.2600097656, -250.20100402832, 53.906074523926, "Seer Ravenfeather", 0, 0, 0, 0, 0, 0, "Bring the Rough Quartz to Seer Ravenfeather in Camp Narache.", 0, 1);

	_questDB:addQuest("no", 1, "Call of Earth", "Seer Ravenfeather", -2882.2600097656, -250.20100402832, 53.906074523926, 215, 4, 8, -3033.298828125, -719.48992919922, 44.524024963379, 5, 0, 0, 0, 0, 0, -3031.3601074219, -720.8330078125, 44.890098571777, "Minor Manifestation of Earth", 0, 0, 0, 0, 0, 0, "Find Kodo Rock and drink the Earth Sapta.", "Earth Sapta", 0);

	_questDB:addQuest("no", 1, "Call of Earth", "Seer Ravenfeather", -2882.2600097656, -250.20100402832, 53.906074523926, 215, 4, 8, -3027.4916992188, -1242.7445068359, 76.664749145508, 1, 20, 0, 0, 0, 0, -2882.2600097656, -250.20100402832, 53.906074523926, "Seer Ravenfeather", "Bristleback Shaman", 0, 0, 0, 0, 0, "Bring 2 applications of Ritual Salve to Seer Ravenfeather in Camp Narache.", 0, 1);

end

_questDB:addQuest("no", 1, "Rite of Strength", "Seer Graytongue", -3430.3100585938, -139.2799987793, 103.0778427124, 215, 3, 6, -3169.2238769531, -1054.2880859375, 54.741600036621, 1, 20, 20, 0, 0, 0, -2877.9499511719, -221.83000183105, 54.820789337158, "Chief Hawkwind", "Bristleback Quilboar", "Bristleback Shaman", 0, 0, 0, 5, "Kill Bristlebacks in Brambleblade Ravine and bring 12 Bristleback Belts to Chief Hawkwind in Camp Narache.", 0, 1);

_questDB:addQuest("no", 1, "Rites of the Earthmother", "Chief Hawkwind", -2877.9499511719, -221.83000183105, 54.820789337158, 215, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3426.2470703125, -139.44728088379, 101.6287689209, "Seer Graytongue", 0, 0, 0, 0, 0, 0, "Travel to Seer Graytongue who lives in the hills directly south of Camp Narache.", 0, 0);

_questDB:addQuest("no", 1, "The Battleboars", "Grull Hawkwind", -2912.6999511719, -257.54000854492, 52.940914154053, 215, 3, 6, -3101.59765625, -821.95526123047, 50.618579864502, 1, 20, 0, 0, 0, 0, -2912.6999511719, -257.54000854492, 52.940921783447, "Grull Hawkwind", "Battleboar", 0, 0, 0, 0, 0, "Grull Hawkwind in Camp Narache wants you to kill Battleboars and bring back 8 Battleboar Snouts and 8 Battleboar Flanks.", 0, 1);

_questDB:addQuest("no", 1, "A Humble Task", "Greatmother Hawkwind", -3052.5400390625, -522.49798583984, 26.931287765503, 215, 2, 6, -3052.5400390625, -522.49798583984, 26.93128776550, 2, 0, 0, 0, 1, 0, -2877.9499511719, -221.83000183105, 54.820861816406, "Chief Hawkwind", 0, 0, 0, 297, 0, 0, "Take a Water Pitcher from the water well.\n\nReturn the pitcher to Chief Hawkwind in Camp Narache which is northwest from the water well.", 0, 0);

_questDB:addQuest("no", 1, "A Humble Task", "Chief Hawkwind", -2877.9499511719, -221.83000183105, 54.820861816406, 215, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3052.5400390625, -522.49798583984, 26.931287765503, "Greathmother Hawkwind", 0, 0, 0, 0, 0, 0, "Chief Hawkwind wants you to search for his mother near the water well to the southeast of Camp Narache.", 0, 0);

if GetMyClass() == "DRUID" then
_questDB:addQuest("no", 1, "Verdant Note", "Grull Hawkwind", -2912.6999511719, -257.54000854492, 52.940937042236, 215, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2873.5700683594, -268.59100341797, 53.916873931885, "Gart Mistrunner", 0, 0, 0, 0, 0, 0, "Read the Verdant Note and speak to Gart Mistrunner in Camp Narache.", 0, 2);
end

_questDB:addQuest("no", 1, "The Hunt Continues", "Grull Hawkwind", -2912.6999511719, -257.54000854492, 52.940914154053, 215, 1, 6, -3400.8754882813, -299.08343505859, 68.37378692627,  1, 20, 0, 0, 0, 0, -2912.6999511719, -257.54000854492, 52.94091415405, "Grull Hawkwind", "Mountain Cougar", 0, 0, 0, 0, 2, "Grull Hawkwind in Camp Narache wants you to bring him 10 Mountain Cougar Pelts.", 0, 1);

if GetMyClass() == "SHAMAN" then
	_questDB:addQuest("no", 1, "Rune-Inscribed Note", "Grull Hawkwind", -2912.6999511719, -257.54000854492, 52.940914154053, 215, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2873.8798828125, -264.70901489258, 53.916511535645, "Meela Dawnstrider", 0, 0, 0, 0, 0, 0, "Read the Rune-Inscribed Note and speak to Meela Dawnstrider in Camp Narache.", 0, 2);
end

_questDB:addQuest("no", 1, "The Hunt Begins", "Grull Hawkwind", -2912.6999511719, -257.54000854492, 52.940994262695, 215, 1, 6, -2991.4387207031, -375.06997680664, 52.509288787842, 1, 20, 0, 0, 0, 0, -2912.6999511719, -257.54000854492, 52.940994262695, "Grull Hawkwind", "Plainstrider", 0, 0, 0, 0, 2, "Grull Hawkwind in Camp Narache wants you to bring him 7 Plainstrider Feathers and 7 pieces of Plainstrider Meat.", 0, 1);


self.isSetup = true;
end

	