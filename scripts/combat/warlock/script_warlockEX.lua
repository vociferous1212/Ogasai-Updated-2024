script_warlockEX = {
}

function script_warlockEX:useHealthstones()

	if (HasItem("Major Healthstone")) then
		UseItem("Major Healthstone");
		return true;
	elseif (HasItem("Greater Healthstone")) then
		UseItem("Greater Healthstone");
		return true;
	elseif (HasItem("Healthstone")) then
		UseItem("Healthstone");
		return true;
	elseif (HasItem("Lesser Healthstone")) then
		UseItem("Lesser Healthstone");
		return true;
	elseif (HasItem("Minor Healthstone")) then
		UseItem("Minor Healthstone");
		return true;
	end

return false;
end

function script_warlockEX:checkHealthstones()

	if (HasSpell("Create Healthstone (Major)")) then
		if (not HasItem("Major Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Major)()")) then
				script_warlock.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone (Greater)")) then
		if (not HasItem("Greater Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Greater)()")) then
				script_warlock.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone")) then
		if (not HasItem("Healstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone ()")) then
				script_warlock.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end

	elseif (HasSpell("Create Healthstone (Lesser)")) then
		if (not HasItem("Lesser Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Lesser)()")) then
				script_warlock.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone (Minor)")) then
		if (not HasItem("Minor Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Minor)()")) then
				script_warlock.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	end

return false;
end

function script_warlockEX:useSoulstones()
	if (GetLocalPlayer():GetUnitsTarget():GetGUID() ~= GetLocalPlayer():GetGUID()) then
		ClearTarget();
	end

	if (HasItem("Major Soulstone")) then
		UseItem("Major Soulstone");
		return true;
	elseif (HasItem("Greater Soulstone")) then
		UseItem("Greater Soulstone");
		return true;
	elseif (HasItem("Soulstone")) then
		UseItem("Soulstone");
		return true;
	elseif (HasItem("Lesser Soulstone")) then
		UseItem("Lesser Soulstone");
		return true;
	elseif (HasItem("Minor Soulstone")) then
		UseItem("Minor Soulstone");
		return true;
	end

return false;
end

function script_warlockEX:checkSoulstonesSpells()
	if (HasSpell("Create Soulstone (Major)")) or (HasSpell("Create Soulstone (Greater)")) or (HasSpell("Create Soulstone ()")) or (HasSpell("Create Soulstone (Lesser)")) or (HasSpell("Create Soulstone (Minor)")) then
		return true;
	end
return false;
end

function script_warlockEX:checkSoulstones()

	if (HasSpell("Create Soulstone (Major)")) then
		if (not HasItem("Major Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Major)()")) then
				script_warlock.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone (Greater)")) then
		if (not HasItem("Greater Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Greater)()")) then
				script_warlock.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone ()")) then
		if (not HasItem("Healstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone ()")) then
				script_warlock.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end

	elseif (HasSpell("Create Soulstone (Lesser)")) then
		if (not HasItem("Lesser Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Lesser)()")) then
				script_warlock.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone (Minor)")) then
		if (not HasItem("Minor Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Minor)()")) then
				script_warlock.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	end

return false;
end


function script_warlockEX:menu()

	-- select local player
	localObj = GetLocalPlayer();

	-- close menus on startup
	local wasClicked = false;

	-- show combat menu
	if (CollapsingHeader("Warlock Combat Options")) then
		if (script_warlockEX:checkSoulstonesSpells()) then
			wasClicked, script_warlock.useSoulstone = Checkbox("Use Soul Stones", script_warlock.useSoulstone);
			if (script_warlock.useSoulstone) then
				SameLine();
				Text("	Make sure item is not on CD!");
				Text("Can bug out if you accept a res and stone is on CD");
				Separator();
				end
		end
		
		if (HasSpell("Corruption")) then
			wasClicked, script_warlock.warlockDOTS = Checkbox("Feeling Lucky?", script_warlock.warlockDOTS);
			if (script_warlock.warlockDOTS) then
				Text("Your luck");
				script_warlock.warlockDOTSCount = SliderInt("NPC Count", 0, 5, script_warlock.warlockDOTSCount);
			end
		end
		--wasClicked, script_warlock.waitAfterCombat = Checkbox("Wait After Combat", script_warlock.waitAfterCombat);
		--SameLine();
		--if (HasSpell("Corruption")) then
		--	wasClicked, script_warlock.feelingLucky = Checkbox("Feeling Lucky?", script_warlock.feelingLucky);
		--end
		--if (script_warlock.feelingLucky) then
		--	Text("Your Luck");
		--	script_warlock.howLucky = SliderInt("???", 1, 8, script_warlock.howLucky);
		--	script_warlock.fearAdds = false;
		--	script_grindEX.avoidBlacklisted = false;
		--	script_grind.skipHardPull = false;
		--end
			
		-- if has spell summon imp then show summon imp button
		if (HasSpell("Summon Imp")) then

			-- summon imp button
			wasClicked, script_warlock.useImp = Checkbox("Use Imp", script_warlock.useImp);
			
			-- keep next summon demon on same line
			SameLine();

			-- if use Imp button was clicked then turn off other pets
			if (script_warlock.useImp) then
				
				-- turn off use voidwalker
				script_warlock.useVoid = false;
				
				-- turn off use succubus
				script_warlock.useSuccubus = false;
				
				-- turn off use felhunter
				script_warlock.useFelhunter = false;
			end
			
		end
		
		-- if has spell summon voidwalker then show use voidwalker button
		if (HasSpell("Summon Voidwalker")) then

			-- show use voidwalker button
			wasClicked, script_warlock.useVoid = Checkbox("Use Voidwalker", script_warlock.useVoid);
			
			-- keep next summon demon on same line
			SameLine();

			-- if use voidwalker button was clicked then turn off other pets
			if (script_warlock.useVoid) then
				
				-- turn off use imp
				script_warlock.useImp = false;
				
				-- turn off use succubus
				script_warlock.useSuccubus = false;
				
				-- turn off use felhunter
				script_warlock.useFelhunter = false;
			end
		end

		-- if has spell summon succubus then show use succubus button
		if (HasSpell("Summon Succubus")) then
			
			wasClicked, script_warlock.useSuccubus = Checkbox("Use Succubus", script_warlock.useSuccubus);

			if (script_warlock.useSuccubus) then
				
				script_warlock.useImp = false;
				
				script_warlock.useVoid = false;
				
				script_warlock.useFelhunter = false;
			end
		end

		if (HasSpell("Summon Felhunter")) then
			
			wasClicked, script_warlock.useFelhunter = Checkbox("Use Felhunter", script_warlock.useFelhunter);
			
			SameLine();

			if (script_warlock.useFelhunter) then
				
				script_warlock.useImp = false;
				
				script_warlock.useSuccubus = false;
				
				script_warlock.useVoid = false;
			end
		end

		Separator();

		Text('Drink below mana percentage');
		
		script_warlock.drinkMana = SliderFloat("M%", 1, 100, script_warlock.drinkMana);
		
		Text('Eat below health percentage');
		
		script_warlock.eatHealth = SliderFloat("H%", 1, 100, script_warlock.eatHealth);
			
		Text('Use health potions below percentage');
		
		script_warlock.potionHealth = SliderFloat("HP%", 1, 99, script_warlock.potionHealth);
		
		Text('Use mana potions below percentage');
		
		script_warlock.potionMana = SliderFloat("MP%", 1, 99, script_warlock.potionMana);
		
		Separator();

		Text('Skills options:');

		
		if (script_warlock.alwaysFear) then
			SameLine();
			wasClicked, script_warlock.followFeared = Checkbox("Follow Feared Target", script_warlock.followFeared);
		end

		-- always fear
		if (HasSpell("Fear")) and (not script_warlock.enableGatherShards) then

			wasClicked, script_warlock.alwaysFear = Checkbox("Fear Single Targets", script_warlock.alwaysFear);
		
			SameLine();
			
			if (script_warlock.alwaysFear) then
	
				script_warlock.fearAdds = false;
			end
		end
		
		-- fear only adds
		if (HasSpell("Fear")) then
	
			wasClicked, script_warlock.fearAdds = Checkbox("Fear Adds", script_warlock.fearAdds);

			if (script_warlock.fearAdds) then
	
				script_warlock.alwaysFear = false;
			end
		end

		-- use wand
		if (localObj:HasRangedWeapon()) then

			wasClicked, script_warlock.useWand = Checkbox("Use Wand", script_warlock.useWand);
			
			SameLine();

			if (script_warlock.useWand) then

				script_warlock.useShadowBolt = false;
			end
		end

		if (HasSpell("Death Coil")) then
		
			SameLine();

			wasClicked, script_warlock.useDeathCoil = Checkbox("Use Coil", script_warlock.useDeathCoil);
	
		end

		-- shadowbolt
		wasClicked, script_warlock.useShadowBolt = Checkbox("Shadowbolt instead of wand", script_warlock.useShadowBolt);
		
		if (not localObj:HasRangedWeapon()) then

			script_warlock.useShadowBolt = true;
		end
		if (script_warlock.useShadowBolt) then

			script_warlock.useWand = false;
		end

		-- unending breath
		if (HasSpell("Unending Breath")) then

			wasClicked, script_warlock.useUnendingBreath = Checkbox("Use Unending Breath", script_warlock.useUnendingBreath);
		end
		
		SameLine();

		if (HasSpell("Drain Mana")) then

			wasClicked, script_warlock.useDrainMana = Checkbox("Use Drain Mana", script_warlock.useDrainMana);
		end

		Separator();

		if (HasSpell("Drain Life")) then

			Text("Use Drain Life below self health percent");
			
			script_warlock.drainLifeHealth = SliderInt("DLH", 1, 80, script_warlock.drainLifeHealth);
			
			Separator();
		end

		if (HasSpell("Health Funnel")) then
			
			Separator();		
	
			Text("Heal Pet below pet health percent");
			
			script_warlock.healPetHealth = SliderInt("HPH", 1, 80, script_warlock.healPetHealth);
		end

		if (script_warlock.useVoid) and (script_warlock.hasSacrificeSpell) then
			
			wasClicked, script_warlock.sacrificeVoid = Checkbox("Sacrifice Voidwalker when low script_warlock health", script_warlock.sacrificeVoid);
			
			if (script_warlock.sacrificeVoid) then
				
				Text("Self Health OR Pet Health percent to Sacrifice Voidwalker")
				
				script_warlock.sacrificeVoidHealth = SliderInt("SVH", 1, 25, script_warlock.sacrificeVoidHealth);
				
				Separator();
			end
		end

		if (localObj:HasRangedWeapon()) and (script_warlock.useWand) then
			
			if (CollapsingHeader("|+| Wand Options")) then
				
				Text("Use Wand below target health percent");
				
				script_warlock.useWandHealth = SliderInt("WH", 1, 100, script_warlock.useWandHealth);
				
				Text("Use Wand below self mana percent");
				
				script_warlock.useWandMana = SliderInt("WM", 1, 100, script_warlock.useWandMana);
			end
		end

		if (CollapsingHeader("|+| DoT Options")) then
				
			
			if (HasSpell("Siphon Life")) then

				wasClicked, script_warlock.enableSiphonLife = Checkbox("Use Siphon Life", script_warlock.enableSiphonLife);
				
				SameLine();
			end

			if (HasSpell("Immolate")) then
				
				wasClicked, script_warlock.enableImmolate = Checkbox("Use Immolate",script_warlock.enableImmolate);
			end

			if (HasSpell("Curse of Agony")) then
				
				wasClicked, script_warlock.enableCurseOfAgony = Checkbox("Use Curse of Agony", script_warlock.enableCurseOfAgony);

				if (script_warlock.useCurseOfAgony) then
					script_warlock.useCurseOfWeakness = false;
					script_warlock.useCurseOfTongues = false;
				end
				
				SameLine();
			end

			if (HasSpell("Corruption")) then
				
				wasClicked, script_warlock.enableCorruption = Checkbox("Use Corruption", script_warlock.enableCorruption);
			end

		end		

		if (CollapsingHeader("|+| Curse Options")) then
			
			if (HasSpell("Curse of Weakness")) then
				wasClicked, script_warlock.useCurseOfWeakness = Checkbox("Weakness", script_warlock.useCurseOfWeakness);
				
				if (script_warlock.useCurseOfWeakness) then
					script_warlock.useCurseOfAgony = false;
					script_warlock.useCurseOfTongues = false;
				end
			end

			if (HasSpell("Curse of Tongues")) then
				wasClicked, script_warlock.useCurseOfTongues = Checkbox("Tongues", script_warlock.useCurseOfTongues);
				
				if (script_warlock.useCuroseOfTongues) then
					script_warlock.useCurseOfAgony = false;
					script_warlock.useCurseOfWeakness = false;
				end
			end
			
		end

		Separator();

		if (HasSpell("Life Tap")) then
			
			if (CollapsingHeader("|+| Life Tap Options")) then
				
				Text("Use Life Tap above this percent health");
				
				script_warlock.lifeTapHealth = SliderInt("LTH", 50, 90, script_warlock.lifeTapHealth);
				
				Text("Use Life Tap below this percent mana");
				
				script_warlock.lifeTapMana = SliderInt("LTM", 15, 80, script_warlock.lifeTapMana);
			end
		end
	end
end