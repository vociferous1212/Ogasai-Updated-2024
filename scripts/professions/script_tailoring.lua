script_tailoring = {

    bookOpen = false;
    showTailoring = false;

}

function script_tailoring:openMenu()
    if (not self.bookOpen) then
        if (HasItem("Linen Cloth")) then
           if (CastSpellByName("Tailoring")) then
            return true;
           end
            self.bookOpen = true;
        end
    end
return false;
end

function script_tailoring:closeMenu()
    if (not HasItem("Linen Cloth")) and (self.bookOpen) then  
        CloseTradeSkill();
        self.bookOpen = false;
    end
end

function script_tailoring:doTailoring()
    local name = "";

    -- Bolt of Linen Cloth
    if (HasItem("Linen Cloth")) then
            script_tailoring:openMenu();
            for i=1,GetNumTradeSkills() do
                name, _, _, _, _ = GetTradeSkillInfo(i);
 		local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine(i);
		if (currentLevel < 50) then
              	  if (name == "Bolt of Linen Cloth") then
               		DoTradeSkill(i, 100);
			return true;
		end
                end
            end
    end
	script_tailoring:closeMenu();
    return false;
end