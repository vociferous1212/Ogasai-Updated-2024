script_shamanEX2 = {


}

function script_shamanEX2:ghostWolf()
	-- Shaman Ghost Wolf 
	if (not IsMounted()) and (not script_grind.useMount) and (HasSpell('Ghost Wolf')) and (not localObj:HasBuff('Ghost Wolf')) and (not localObj:IsDead()) and (not IsIndoors()) then
		if (IsMoving()) then
			StopMoving();
			return false;
		else
			CastSpellByName('Ghost Wolf');
			self.waitTimer = GetTimeEX() + 2500;
			script_grind:setWaitTimer(2500);
			return true;
		end
	return true;
	end
return false;
end

function script_shamanEX2:usingTotems()
	if (script_shaman.useEarthTotem) or (script_shaman.useWaterTotem) or (script_shaman.useFireTotem) or (script_shaman.useAirTotem) then
		return true;
	end
return false;
end

function script_shamanEX2:removeGhostWolf()
	if (GetLocalPlayer():HasBuff("Ghost Wolf")) then
		CastSpellByName("Ghost Wolf");
		script_grind:setWaitTimer(1500);
		return true;
	end
return false;
end

function script_shamanEX2:menu()

	if (CollapsingHeader("Shaman Heal Options")) then
		Text('Rest options:');
		script_shaman.eatHealth = SliderInt("Eat below HP%", 1, 100, script_shaman.eatHealth);
		script_shaman.drinkMana = SliderInt("Drink below Mana%", 1, 100, script_shaman.drinkMana);
		script_grind.drinkMana = script_shaman.drinkMana; script_grind.eatHealth = script_shaman.eatHealth;
		Text('You can add more food/drinks in script_helper.lua');

		Separator();

		script_shaman.potionHealth = SliderInt("Potion below HP%", 1, 99, script_shaman.potionHealth);
		script_shaman.potionMana = SliderInt("Potion below Mana%", 1, 99, script_shaman.potionMana);

		Separator();

		Text("Heal Below Health In Combat");
		script_shaman.healHealth = SliderInt("Heal when below HP% (in combat)", 1, 99, script_shaman.healHealth);
		Text("Mana Cost Of Healing Spell Percent")
		script_shaman.healMana = SliderInt("Heal Mana %", 5, 99, script_shaman.healMana);
		Text("Healing Spell");
		script_shaman.healingSpell = InputText("Heal Spell", script_shaman.healingSpell);
	end
end