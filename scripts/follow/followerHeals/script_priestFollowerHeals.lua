script_priestFollowerHeals = {

    	enableHeals = true,
    	renewMana = 25,
	partyRenewHealth = 85,
	shieldMana = 55,
	partyShieldHealth = 39,
	lesserHealMana = 5,
	partyLesserHealHealth = 80,
	healMana = 10,
	partyHealHealth = 60,
	greaterHealMana = 20,
	partyGreaterHealHealth = 28,
	flashHealMana = 7,
	partyFlashHealHealth = 54,
	clickRenew = true,
	clickShield = true,
	clickFlashHeal = true,
	clickGreaterHeal = true,
	clickHeal = true,
	timer = 0,
	isSetup = false,
    
}

function script_priestFollowerHeals:setup()
	
	local level = GetLocalPlayer():GetLevel();
	if (level < 10) then
		self.lesserHealMana = 30;
	end
end

function script_priestFollowerHeals:HealsAndBuffs()

	if (not self.isSetup) then
		script_priestFollowerHeals:setup();
		self.isSetup = true;
	end
	
	local localMana = GetLocalPlayer():GetManaPercentage();
	local localHealth = GetLocalPlayer():GetHealthPercentage();

	if (not IsStanding()) then 
		StopMoving();
	end


	-- Wait out the wait-timer and/or casting or channeling
	if (self.timer > GetTimeEX() or IsCasting() or IsChanneling()) then
		return;
	end

	-- set tick rate for scripts
	if (GetTimeEX() > self.timer) then
		self.timer = GetTimeEX() + script_follow.tickRate;

		-- Check if anything is attacking us Priest
		if (script_followEX2:enemiesAttackingUs() >= 1) then
				local localMana = GetLocalPlayer():GetManaPercentage();
			if (localMana > 6 and HasSpell('Fade') and not IsSpellOnCD('Fade')) then
				CastSpellByName('Fade');
			end
		end

		local partyMember = 0;
		for i = 1, GetNumPartyMembers() do

			partyMember = GetPartyMember(i);
	
			if (GetNumPartyMembers() > 0) and (partyMember:GetGUID() ~= GetLocalPlayer():GetGUID()) then

				local partyMembersHP = partyMember:GetHealthPercentage();
				local partyMemberDistance = partyMember:GetDistance();
				local leaderObj = GetPartyLeaderObject();
				local px, py, pz = GetPartyMember(i):GetPosition();
				local localObj = GetLocalPlayer();
			
				if (not leaderObj:IsInLineOfSight()) or (leaderObj:IsInLineOfSight() and not partyMember:IsInLineOfSight() and partyMemberDistance < script_follow.followLeaderDistance) or (leaderObj:GetDistance() > 40 and self.enableHeals) then
					script_followMoveToTarget:moveToTarget(GetLocalPlayer(), px, py, pz);
					if (script_follow.followLeaderDistance >= 10 and leaderObj:GetDistance() < 10 and leaderObj:IsInLineOfSight()) then
						if (IsMoving()) then
							StopMoving();
							return true;
						end
					end
					return true;

                       		end

				-- Dispel Magic
				if (HasSpell("Dispel Magic")) and (localMana > 20) then 
					if (partyMember:HasDebuff("Sleep"))
						or (partyMember:HasDebuff("Druid's Slumber"))
						or (partyMember:HasDebuff("Terrify"))
						or (leaderObj:HasDebuff("Frost Nova"))
						or (partyMember:HasDebuff("Screams of the Past"))
						or (partyMember:HasDebuff("Wavering Will"))
						or (partyMember:HasDebuff("Slow"))
							or (leaderObj:HasDebuff("Frostbolt"))
						or (partyMember:HasDebuff("Dominate Mind"))
				then
						local dispellRandom = random(1, 100);
						if (dispellRandom > 90) then
		                       			if (CastHeal("Dispel Magic", partyMember)) then
                          					self.timer = GetTimeEX() + 1500;
       	                   					return true;
							end
						end
        	               		end
        	           	end				
	
				-- Cure Disease
				if (HasSpell("Cure Disease")) and (localMana > 75) and (GetNumPartyMembers() >= 1) then 
					if (partyMember:HasDebuff("Infected Wound")) then
						local cureRandom = random(1, 100);
						if (cureRandom > 90) then
							if (CastHeal("Cure Disease", partyMember)) then
								self.timer = GetTimeEX() + 1500;
								return true;
							end
						end
					end	
				end
                    
                		-- Power word Fortitude
                		if (HasSpell("Power Word: Fortitude")) and (localMana > 40)
					and (not partyMember:HasBuff("Power Word: Fortitude")) then
					if (Cast("Power Word: Fortitude", partyMember)) then
						self.timer = GetTimeEX() + 1500;
						return true;
					end
				end	
	
				-- Divine Spirit
				if (HasSpell("Divine Spirit")) and (localMana > 30) and (not partyMember:HasBuff("Divine Spirit")) then
					if (Cast("Divine Spirit", partyMember)) then
						self.timer = GetTimeEX() + 1500;
						return true;
	 				end	
				end
	
				-- Inner Fire
				if (HasSpell("Inner Fire")) and (localMana > 30)
					and (not localObj:HasBuff("Inner Fire")) then
					if (Buff("Inner Fire", localObj)) then
						self.timer = GetTimeEX() + 1500;
						return true;
					end
				end
	
				-- priest fear
				if (script_followEX2:enemiesAttackingUs() > 3) and (HasSpell("Psychic Scream")) then
					if (CastSpellByName("Psychic Scream")) then
						return true;
					end
				end
	
				-- inner focus
				if (HasSpell("Inner Focus")) and (not IsSpellOnCD("Inner Focus")) then
					if (localMana < self.flashHealMana)
						and (leaderObj:GetHealthPercentage() < self.partyFlashHealHealth) then
						if (Buff("Inner Focus", localObj)) then 
							self.timer = GetTimeEX() + 1400;
							return true; 
						end
						if (CastHeal("Flash Heal", partyMember)) then
							self.timer = GetTimeEX() + 1600;
							return true;
						end
					end
				end
	                
				-- Power Infusion
				if (HasSpell("Power Infusion")) and (not IsSpellOnCD("Power Infusion")) then
					if (partyMembersHP< 50) or (script_priest:enemiesAttackingUs(8) > 1) then
						if (Buff("Power Infusion")) then
							self.timer = GetTimeEX() + 1500;
							return true;
						end
					end
				end

				if (self.enableHeals) and (GetNumPartyMembers() > 0) then
				local localMana = GetLocalPlayer():GetManaPercentage();
	                		-- flash heal 
	                		if (self.clickFlashHeal) then
                				if (localMana > self.flashHealMana) and (partyMembersHP < self.partyFlashHealHealth) then
							if (CastHeal("Flash Heal", partyMember)) then
                		            			self.timer = GetTimeEX() + 2000;
								return true;
                        				end
               	    				end
               				end
		
		                	-- Greater Heal
		               		if (self.clickGreaterHeal) then
		               	    		if (localMana > self.greaterHealMana)
							and (partyMembersHP < self.partyGreaterHealHealth)
							and (HasSpell("Greater Heal")) then
							if (CastHeal("Greater Heal", partyMember)) then
        	 	        	       			self.timer = GetTimeEX() + 2000;
        	 	                   			return true;
        	 	               			end
						end
					end
		
        	        		-- Heal
        	        		if (self.clickHeal) then
        	            			if (localMana > self.healMana) and (partyMembersHP < self.partyHealHealth)
							and (HasSpell("Heal")) then
        	                			if (CastHeal("Heal", partyMember)) then
        	                	    			self.timer = GetTimeEX() + 3200;
        	                	    			return true;
       		 	        	        	end
       		 	        	    	end
		                	end
		
		                	-- Lesser Heal
		                	-- level 20+ at very low mana
		                	if (localObj:GetLevel() >= 20) then
		                    		if (localMana <= 8) and (partyMembersHP <= 20) then
		                        		if (CastHeal("Lesser Heal", partyMember)) then
		                        			self.timer = GetTimeEX() + 3500;
		                        		end
		                    		end
		                    	-- below level 20 cast lesser heal
		                	elseif (localObj:GetLevel() <= 20) then
		                    		if (localMana > self.lesserHealMana)
						and (partyMembersHP < self.partyLesserHealHealth)
							and (HasSpell("Lesser Heal")) then
		                        		if (Cast("Lesser Heal", partyMember)) then
		                            			self.timer = GetTimeEX() + 3500;
		                            			return true;
		                        		end
		                    		end
		                	end
		
        	        		-- Renew
        	        		if (self.clickRenew) then
        	            			if (localMana > self.renewMana) and (partyMembersHP < self.partyRenewHealth)
							and (not partyMember:HasBuff("Renew")) and (HasSpell("Renew")) then
        	                			if (CastHeal("Renew", partyMember)) then
        	                	    			self.timer = GetTimeEX() + 1650;
        	                	    			return true;
        	                			end
        	            			end
        	        		end
	
	                		-- Shield
	                		if (self.clickShield) then
	                    			if (localMana > self.shieldMana) and (partyMembersHP < self.partyShieldHealth)
							and (not partyMember:HasDebuff("Weakened Soul"))
							and (HasSpell("Power Word: Shield")) then
	                        			if (CastHeal("Power Word: Shield", partyMember)) then 
	                        	    			self.timer = GetTimeEX() + 1550;
	                        	    			return true; 
	                        			end
	                    			end
		   			end
	    			end
			
			end
		end
	return false;
	end
end