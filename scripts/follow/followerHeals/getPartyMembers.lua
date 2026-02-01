getPartyMembers = {
	partyMember1 = 0
	partyMember2 = 0
	partyMember3 = 0
	partyMember4 = 0
	partyMember1Health = 0
	partyMember2Health = 0
	partyMember3Health = 0
	partyMember4Health = 0
}

-- the follower rarely uses the object manager. let's use it!

-- get party members
function getPartyMembers:setPartyMembers()

if UnitExists("party1") then

	local name1 = GetUnitName("party1");
	local name2 = GetUnitName("party2");
	local name3 = GetUnitName("party3");
	local name4 = GetUnitName("party4");

	local i, t = GetFirstObject()

	while i ~= 0 do
		if t == 4 then
			if i:GetUnitName() == name then
				self.partyMember1 = i;
				self.partyMember1Health = UnitHealth("party1");
			end
			if i:GetUnitName() == name2 then
				self.partyMember2 = i;
				self.partyMember2Health = UnitHealth("party2");

			end
			if i:GetUnitName() == name3 then
				self.partyMember3 = i;
				self.partyMember3Health = UnitHealth("party3");

			end
			if i:GetUnitName() == name4 then
				self.partyMember4 = i;
				self.partyMember4Health = UnitHealth("party4");

			end
		end
	i, t = GetNextObject(i);
	end
end