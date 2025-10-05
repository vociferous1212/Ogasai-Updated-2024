script_enchanting = {

    bookOpen = false;
    showEnchanting = false;
    copperRod = false;

}

function script_enchanting:openMenu()
    if (not self.bookOpen) then
        if (HasItem("Strange Dust")) then
           if (CastSpellByName("Enchanting")) then
            return 0;
           end
            self.bookOpen = true;
        end
    end
end

function script_enchanting:closeMenu()
    if (not HasItem("Strange Dust")) and (self.bookOpen) then  
        CloseTradeSkill();
        self.bookOpen = false;
    end
end

function script_enchanting:doEnchant()
    local name = "";

    -- Enchant Bracer - Minor Health
    if (HasItem("Strange Dust")) then
            script_enchanting:openMenu();
            for i=1,GetNumTradeSkills() do
                name, _, _, _, _ = GetTradeSkillInfo(i);


                -- use this way it works!
                
                if (name == "Enchant Bracer - Minor Health") then
               		DoTradeSkill(i, 1);
			ReplaceEnchant();
                	self.waitTimer = GetTimeEX() + 5500;
			return true
                end
            end
    end
    return;
end