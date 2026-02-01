grind2CanSkinTarget = {


}

function grind2CanSkinTarget:target(i)

	local targetLevel = i:GetLevel();

	-- Calculate required skinning skill
	local requiredSkill = 0;
	
	if targetLevel <= 10 then

		requiredSkill = 1;

	else

		requiredSkill = targetLevel * 5;
	end
	
	-- Get player's skinning skill
	local skinningSkill = 0

	for i = 1, GetNumSkillLines() do

		local skillName, _, _, skillRank = GetSkillLineInfo(i)
		
		if skillName == "Skinning" then
			
			skinningSkill = skillRank;

				break;
			end
		end
	
		-- Check if target is skinnable
		if skinningSkill >= requiredSkill then
			return true;
		end

return false;
end