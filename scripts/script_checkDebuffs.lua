script_checkDebuffs = {}

-- Helper function to check if a unit has any debuffs/buffs from a list
local function checkUnitEffects(unit, effectList, isBuff)

    if (unit == nil) then
        return false;
    end

    for effect in pairs(effectList) do
        if (isBuff and unit:HasBuff(effect)) or (not isBuff and unit:HasDebuff(effect)) then
            return true;
        end
    end

    return false;
end

-- Curse debuffs (dispellable by Druids/Mages)
function script_checkDebuffs:hasCurse()

    local curses = {
        ["Curse of Mending"] = true,
        ["Curse of the Shadowhorn"] = true,
        ["Curse of Recklessness"] = true,
        ["Curse of Thule"] = true,
        ["Curse of Thorns"] = true,
        ["Curse of Weakness"] = true, -- Reduces melee attack power/armor; dispel in PvE/PvP
        ["Curse of Agony"] = true, -- DoT; dispel in PvP, medium raid priority
        ["Curse of Doom"] = true, -- High-damage DoT; dispel in PvP, low raid priority
        ["Curse of the Elements"] = true, -- Increases Fire/Frost damage taken; high raid priority, don’t dispel
        ["Curse of Shadow"] = true, -- Increases Arcane/Shadow damage taken; high raid priority, don’t dispel
	["Curse of the Deadwood"] = true
    };
    return checkUnitEffects(GetLocalPlayer(), curses, false);
end

-- Poison debuffs (dispellable by Druids/Paladins)
function script_checkDebuffs:hasPoison()

    local poisons = {
        ["Weak Poison"] = true,
        ["Corrosive Poison"] = true,
        ["Poison"] = true,
        ["Slowing Poison"] = true,
        ["Poisoned Shot"] = true,
        ["Venom Spit"] = true,
        ["Bottle of Poison"] = true,
        ["Venom Sting"] = true,
        ["Touch of Zanzil"] = true,
        ["Webwood Lurker's Poison"] = true,
        ["Deadly Poison"] = true,
        ["Serpent Sting"] = true, -- DoT; dispel in PvP, avoid in raids (low priority)
        ["Viper Sting"] = true, -- Drains mana; dispel in PvP for mana classes, low raid priority
        ["Leech Poison"] = true
    };
    return checkUnitEffects(GetLocalPlayer(), poisons, false);
end

-- Disease debuffs (dispellable by Paladins/Priests)
function script_checkDebuffs:hasDisease()

    local diseases = {
        ["Rabies"] = true,
        ["Fevered Fatigue"] = true, -- Removed duplicate
        ["Dark Sludge"] = true,
        ["Infected Bite"] = true,
        ["Wandering Plague"] = true,
        ["Plague Mind"] = true,
        ["Tetanus"] = true,
        ["Creeping Mold"] = true,
        ["Diseased Slime"] = true,
        ["Infected Wound"] = true, -- Increases cast time, reduces healing; dispel in PvE/PvP
        ["Plague"] = true, -- DoT, spreads; dispel immediately in raids
	["Maggot Slime"] = true
    };
    return checkUnitEffects(GetLocalPlayer(), diseases, false);
end

-- Magic debuffs (dispellable by Priests/Mages/Paladins)
function script_checkDebuffs:hasMagic()

    local magic = {
        ["Faerie Fire"] = true,
        ["Sleep"] = true,
        ["Sap Might"] = true,
        ["Frost Nova"] = true,
        ["Fear"] = true,
        ["Entangling Roots"] = true,
        ["Sonic Burst"] = true,
        ["Shadow Word: Pain"] = true, -- DoT; medium raid priority, dispel in PvP
        ["Crystalline Slumber"] = true,
        ["Winter’s Chill"] = true, -- Increases Frost crit; high raid priority, don’t dispel
        ["Polymorph"] = true, -- Incapacitates; dispel in PvP
	["Immolate"] = true
    };
    return checkUnitEffects(GetLocalPlayer(), magic, false);
end

-- Movement-disabling debuffs (mixed types, check for bot navigation)
function script_checkDebuffs:hasDisabledMovement()

    local movement = {
        ["Web"] = true,
        ["Net"] = true,
        ["Frost Nova"] = true,
        ["Entangling Roots"] = true,
       -- this doesn't disable movement complete... ["Slowing Poison"] = true,
      --  ["Hamstring"] = true, -- Reduces movement speed (Warrior); dispel with immunities
       -- ["Wing Clip"] = true, -- Reduces movement speed (Hunter); dispel with immunities
	["Terrify"] = true,
	["Encasing Webs"] = true
    };
    return checkUnitEffects(GetLocalPlayer(), movement, false);
end

-- Physical/unclassified debuffs (generally undispellable except by immunities)
function script_checkDebuffs:hasPhysical()

    local physical = {
        ["Sunder Armor"] = true, -- Reduces armor; high raid priority, don’t dispel
        ["Deep Wounds"] = true, -- Bleed DoT; low raid priority, avoid in raids
        ["Demoralizing Shout"] = true, -- Reduces attack power; medium raid priority, don’t dispel
        ["Thunder Clap"] = true, -- Reduces attack speed; low raid priority, avoid unless Thunderfury
        ["Faerie Fire"] = true -- Reduces armor; high raid priority, don’t dispel
    };
    return checkUnitEffects(GetLocalPlayer(), physical, false);
end

-- Pet debuffs
function script_checkDebuffs:petDebuff()

    if (GetMyClass() ~= "HUNTER" or GetMyClass() ~= "WARLOCK") or GetLocalPlayer():GetLevel() < 10 then
        return false;
    end

    local pet = GetPet();
    if (pet == nil or pet:GetPointer() == 0) then
        return false;
    end

    local petDebuffs = {
        ["Web"] = true,
        ["Net"] = true,
        ["Frost Nova"] = true,
        ["Entangling Roots"] = true,
        ["Slowing Poison"] = true,
        ["Stun"] = true,
        ["Fear"] = true,
        ["Hamstring"] = true,
        ["Wing Clip"] = true,
        ["Polymorph"] = true,
	["Crystalline Slumber"] = true

    };
    return checkUnitEffects(pet, petDebuffs, false);
end

-- Undead Will of the Forsaken debuffs (usable by undead players)
function script_checkDebuffs:undeadForsaken()
    local forsaken = {
        ["Sleep"] = true,
        ["Fear"] = true,
        ["Mind Control"] = true,
        ["Polymorph"] = true -- Added for consistency
    };
    return checkUnitEffects(GetLocalPlayer(), forsaken, false);
end

-- Silence debuffs (prevents spellcasting)
function script_checkDebuffs:hasSilence()
    local silences = {
        ["Silence"] = true,
        ["Sonic Burst"] = true,
        ["Overwhelming Stench"] = true,
        ["Counterspell - Silenced"] = true, -- Silences after Counterspell; dispel in PvP
        ["Deafening Screech"] = true,
	["Terrify"] = true,
    };
    return checkUnitEffects(GetLocalPlayer(), silences, false);
end

-- Enemy buffs (raid-relevant buffs to dispel)
function script_checkDebuffs:enemyBuff()
    local localObj = GetLocalPlayer();
    if (not PlayerHasTarget() or script_grind.enemyObj == nil) then
        return false;
    end

    local enemyBuffs = {
        ["Power Word: Shield"] = true,
        ["Quick Flame Ward"] = true,
        ["Rejuvenation"] = true,
        ["Regrowth"] = true,
        ["Renew"] = true,
        ["Mana Shield"] = true,
        ["Divine Shield"] = true, -- Immunity; dispel with Mass Dispel
        ["Ice Block"] = true, -- Immunity; wait out
        ["Blessing of Protection"] = true -- Physical immunity; dispel with Purge/Mass Dispel
    };
    return checkUnitEffects(script_grind.enemyObj, enemyBuffs, true);
end

function script_checkDebuffs:hasBreakStealthDebuffs()
	local debuffs = {
	["Infected Bite"] = true
	
	}

return checkUnitEffects(GetLocalPlayer(), debuffs, false);
end
