script_firstAid = {

	bookOpen = false,
	showFirstAid = false,
}

function script_firstAid:openMenu()

	if (not self.bookOpen) then
 		if (HasItem("Linen Cloth")) then
			if (CastSpellByName("First Aid")) then
				self.bookOpen = true;
				return true;
			end
		end
	end

return false;
end

function script_firstAid:closeMenu()

	if (not HasItem("Linen Cloth")) and (self.bookOpen) then  
		CloseTradeSkill();
		self.bookOpen = false;
		return true;
	end

return false;
end

function script_firstAid:craftBandages()

	-- linen bandage
	if (HasItem("Linen Cloth")) then
		for i = 1, GetNumTradeSkills() do
			local name, _, _, _, _ = GetTradeSkillInfo(i);
			if (name == "Heavy Linen Bandage") then
				if (HasItem("Linen Cloth")) then
					script_firstAid:openMenu();
					DoTradeSkill(i, 20);
					return true;
				end
			end                   
			if (name == "Linen Bandage") then
				script_firstAid:openMenu();
				DoTradeSkill(i, 20);
				return true;
			end
		end
	end

return false;
end

function script_firstAid:Menu()

	if (self.showFirstAid) then

		wasClicked, self.linenBandage = Checkbox("Craft Linen Bandage", self.linenBandage);
		if (self.linenBandage) then
			script_firstAid:craftBandages();
		end

		wasClicked, self.heavyLinenBandage = Checkbox("Craft Heavy Linen Bandage", self.heavyLinenBandage);
		if (self.heavyLinenBandage) then
			script_firstAid:craftBandages();
		end

	end
end