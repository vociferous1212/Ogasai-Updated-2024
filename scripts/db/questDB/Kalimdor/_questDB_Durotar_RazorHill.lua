_questDB_Durotar_RazorHill = {isSetup = false;}

function _questDB_Durotar_RazorHill:setup()

local questDescription, questObjectives = GetQuestLogQuestText(1);
if GetMyClass() == "SHAMAN" then
	if questObjectives == "Find Kranal Fiss in the Barrens." then

		--call of fire
		_questDB:addQuest("no", 1, "Call of Fire", "Kranal Fiss", 260.59149169922, -3042.9353027344, 96.310523986816, 14, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -265.56140136719, -4000.3620605469, 169.64166259766, "Telf Joolam", 0, 0, 0, 0, 0, 0, "Bring the Torch of the Dormant Flame to Telf Joolam in Durotar.", 0, 0);
	end
end




self.isSetup = true;
end