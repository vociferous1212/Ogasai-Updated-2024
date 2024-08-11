script_shamanFollowerHeals = {

	waitTimer = 0;
	isSetup = false;
	enableHeals = true,
	lesserHealingWaveHealth = 30,
	lesserHealingWaveMana = 30,
	healingWaveHealth = 60,
	healingWaveMana = 20,
	chainHealHealth = 45,
	chainHealMana = 60,
	useStrengthOfEarthTotem = true,
	useStoneskinTotem = false,
	useWindfuryTotem = false,
	useHealingStreamTotem = false,
	useManaSpringTotem = true,
	useLesserHealingWave = true,
	useChainHeal = true,
	totemMana = 20,

}
function script_shamanFollowerHeals:setup()

	self.waitTimer = GetTimeEX();

	self.isSetup = true;
end

function script_shamanFollowerHeals:HealsAndBuffs()

	if (not self.isSetup) then
		script_shamanFollowerHeals:setup();
		self.isSetup = true;
	end
	
	local localMana = GetLocalPlayer():GetManaPercentage();
	local localHealth = GetLocalPlayer():GetHealthPercentage();

	if (not IsStanding()) then 
		StopMoving();
	end


	-- Wait out the wait-timer and/or casting or channeling
	if (self.waitTimer > GetTimeEX() or IsCasting() or IsChanneling()) then
		return;
	end

	-- set tick rate for scripts
	if (GetTimeEX() > self.waitTimer) then
		waitTimer = GetTimeEX() + script_follow.tickRate;

		for i = 1, GetNumPartyMembers() do

				local partyMembers = GetPartyMember(i);
				local partyMember = GetPartyLeaderObject();
				if (partyMembers:GetGUID() ~= GetLocalPlayer():GetGUID()) then
					partyMember = GetPartyMember(i);
				end

			if (GetNumPartyMembers() > 1) and (self.enableHeals) then

				local partyMembersHP = partyMember:GetHealthPercentage();
				local partyMemberDistance = partyMember:GetDistance();
				local leaderObj = GetPartyLeaderObject();
				local px, py, pz = GetPartyMember(i):GetPosition();
				local localObj = GetLocalPlayer();
	
				if (HasSpell("Cure Poison")) and (localMana > 20) then
					if (partyMember:HasDebuff("Poison")) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Cure Poison", partyMember)) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (HasSpell("Cure Disease")) and (localMana > 20) then
					if (partyMember:HasDebuff("Disease")) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Cure Disease", partyMember)) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (self.useLesserHealingWave) and (HasSpell("Lesser Healing Wave")) then
					if (partyMemberHP < self.lesserHealingWaveHealth) and (localMana > self.lesserHealingWaveMana) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Lesser Healing Wave", partyMember)) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (HasSpell("Healing Wave")) then
					if (partyMemberHP < self.healingWaveHealth) and (localMana > self.healingWaveMana) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Healing Wave", partyMember)) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (self.useStrengthOfEarthTotem) and (not self.useStoneskinTotem) then
					if (HasSpell("Strength of Earth Totem")) and (not partyMember:HasBuff("Strength of Earth") and not localObj:HasBuff("Strength of Earth")) and (partyMember:GetDistance() < 20) and (localMana > self.totemMana) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Strength of Earth Totem")) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (self.useStoneskinTotem) and (not self.useStrengthOfEarthTotem) then
					if (HasSpell("Stoneskin Totem")) and (not partyMember:HasBuff("Stoneskin") and not localObj:HasBuff("Stoneskin")) and (partyMember:GetDistance() < 20) and (localMana > self.totemMana) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Stoneskin Totem")) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (self.useWindfuryTotem) and (HasSpell("Windfury Totem")) then
					if (not partyMember:HasBuff("Windfury") and not localObj:HasBuff("Windfury")) and (partyMember:GetDistance() < 20) and (localMana > self.totemMana) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Windfury Totem")) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end

				if (self.useHealingStreamTotem) and (HasSpell("Healing Stream Totem")) then
					if (not partyMember:HasBuff("Healing Stream") and not localObj:HasBuff("Healing Stream")) and (partyMember:GetDistance() < 20) and (localMana > self.totemMana) then
						if (not partyMember:IsInLineOfSight()) and (partyMemeberDistance() < script_follow.followLeaderDistance and leaderObj:IsInLineOfSight()) then
							script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
						return true;
						end
						if (CastSpellByName("Healing Stream Totem")) then
							self.waitTimer = GetTimeEX() + 1650;
							return true;
						end
					end
				end
			end
		end
	end
return false;
end