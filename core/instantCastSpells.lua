instantCastSpells = {


}


-- get spell info API doesn't work this purpose.

-- the bot returns when casting, pausing for a moment
function instantCastSpells:isSpellInstantCast()

	local spellTable = {

	-- hunter
			-- Aspects
			[13165] = true, -- Aspect of the Hawk (Rank 1)
			[14318] = true, -- Aspect of the Hawk (Rank 2)
			[14319] = true, -- Aspect of the Hawk (Rank 3)
			[14320] = true, -- Aspect of the Hawk (Rank 4)
			[14321] = true, -- Aspect of the Hawk (Rank 5)
			[14322] = true, -- Aspect of the Hawk (Rank 6)
			[25296] = true, -- Aspect of the Hawk (Rank 7)

			[13163] = true, -- Aspect of the Monkey
			[13161] = true, -- Aspect of the Beast
			[20043] = true, -- Aspect of the Wild (Rank 1)
			[20190] = true, -- Aspect of the Wild (Rank 2)
			[13159] = true, -- Aspect of the Pack
			[5118]  = true, -- Aspect of the Cheetah

			-- Stings
			[1978]  = true, -- Serpent Sting (Rank 1)
			[13549] = true, -- Serpent Sting (Rank 2)
			[13550] = true, -- Serpent Sting (Rank 3)
			[13551] = true, -- Serpent Sting (Rank 4)
			[13552] = true, -- Serpent Sting (Rank 5)
			[13553] = true, -- Serpent Sting (Rank 6)
			[13554] = true, -- Serpent Sting (Rank 7)
			[13555] = true, -- Serpent Sting (Rank 8)

			[3034]  = true, -- Viper Sting
			[3043]  = true, -- Scorpid Sting

			-- Shots (instant)
			[3044]  = true, -- Arcane Shot (Rank 1)
			[14281] = true, -- Arcane Shot (Rank 2)
			[14282] = true, -- Arcane Shot (Rank 3)
			[14283] = true, -- Arcane Shot (Rank 4)
			[14284] = true, -- Arcane Shot (Rank 5)
			[14285] = true, -- Arcane Shot (Rank 6)
			[14286] = true, -- Arcane Shot (Rank 7)
			[14287] = true, -- Arcane Shot (Rank 8)

			[20736] = true, -- Distracting Shot (Rank 1)
			[14274] = true, -- Distracting Shot (Rank 2)
			[15629] = true, -- Distracting Shot (Rank 3)
			[15630] = true, -- Distracting Shot (Rank 4)
			[15631] = true, -- Distracting Shot (Rank 5)
			[15632] = true, -- Distracting Shot (Rank 6)

			[5116]  = true, -- Concussive Shot

			-- Melee abilities
			[2973]  = true, -- Raptor Strike (Rank 1)
			[14260] = true, -- Raptor Strike (Rank 2)
			[14261] = true, -- Raptor Strike (Rank 3)
			[14262] = true, -- Raptor Strike (Rank 4)
			[14263] = true, -- Raptor Strike (Rank 5)
			[14264] = true, -- Raptor Strike (Rank 6)
			[14265] = true, -- Raptor Strike (Rank 7)
			[14266] = true, -- Raptor Strike (Rank 8)

			[1495]  = true, -- Mongoose Bite (Rank 1)
			[14269] = true, -- Mongoose Bite (Rank 2)
			[14270] = true, -- Mongoose Bite (Rank 3)
			[14271] = true, -- Mongoose Bite (Rank 4)

			[781]   = true, -- Disengage (Rank 1)
			[14272] = true, -- Disengage (Rank 2)
			[14273] = true, -- Disengage (Rank 3)

			[883]   = true, -- Call Pet

	-- druid
			-- Shapeshift Forms
			[5487]  = true, -- Bear Form
			[9634]  = true, -- Dire Bear Form
			[768]   = true, -- Cat Form
			[783]   = true, -- Travel Form
			[1066]  = true, -- Aquatic Form
			[24858] = true, -- Moonkin Form
			[33891] = true, -- Tree of Life (not in 1.12, excluded)

			-- Mark of the Wild
			[1126]  = true, -- Mark of the Wild (Rank 1)
			[5232]  = true, -- Mark of the Wild (Rank 2)
			[6756]  = true, -- Mark of the Wild (Rank 3)
			[5234]  = true, -- Mark of the Wild (Rank 4)
			[8907]  = true, -- Mark of the Wild (Rank 5)
			[9884]  = true, -- Mark of the Wild (Rank 6)
			[9885]  = true, -- Mark of the Wild (Rank 7)

			-- Thorns
			[467]   = true, -- Thorns (Rank 1)
			[782]   = true, -- Thorns (Rank 2)
			[1075]  = true, -- Thorns (Rank 3)
			[8914]  = true, -- Thorns (Rank 4)
			[9756]  = true, -- Thorns (Rank 5)
			[9910]  = true, -- Thorns (Rank 6)

			-- Rejuvenation
			[774]   = true, -- Rejuvenation (Rank 1)
			[1058]  = true, -- Rejuvenation (Rank 2)
			[1430]  = true, -- Rejuvenation (Rank 3)
			[2090]  = true, -- Rejuvenation (Rank 4)
			[2091]  = true, -- Rejuvenation (Rank 5)
			[3627]  = true, -- Rejuvenation (Rank 6)
			[8910]  = true, -- Rejuvenation (Rank 7)
			[9839]  = true, -- Rejuvenation (Rank 8)
			[9840]  = true, -- Rejuvenation (Rank 9)
			[9841]  = true, -- Rejuvenation (Rank 10)

			[2893]  = true, -- Abolish Poison
			[2782]  = true, -- Remove Curse
			[22812] = true, -- Barkskin
			[16864] = true, -- Omen of Clarity
			[29166] = true, -- Innervate

			-- Nature’s Grasp
			[16689] = true, -- Nature's Grasp (Rank 1)
			[16810] = true, -- Nature's Grasp (Rank 2)
			[16811] = true, -- Nature's Grasp (Rank 3)
			[16812] = true, -- Nature's Grasp (Rank 4)
			[16813] = true, -- Nature's Grasp (Rank 5)
			[17329] = true, -- Nature's Grasp (Rank 6)

			-- Faerie Fire (instant)
			[770]   = true, -- Faerie Fire (Rank 1)
			[778]   = true, -- Faerie Fire (Rank 2)
			[9749]  = true, -- Faerie Fire (Rank 3)
			[9907]  = true, -- Faerie Fire (Rank 4)

			-- Faerie Fire (Feral)
			[16857] = true, -- Faerie Fire (Feral) (Rank 1)
			[17390] = true, -- Faerie Fire (Feral) (Rank 2)
			[17391] = true, -- Faerie Fire (Feral) (Rank 3)
			[17392] = true, -- Faerie Fire (Feral) (Rank 4)

			-- Moonfire (instant)
			[8921]  = true, -- Moonfire (Rank 1)
			[8924]  = true, -- Moonfire (Rank 2)
			[8925]  = true, -- Moonfire (Rank 3)
			[8926]  = true, -- Moonfire (Rank 4)
			[8927]  = true, -- Moonfire (Rank 5)
			[8928]  = true, -- Moonfire (Rank 6)
			[8929]  = true, -- Moonfire (Rank 7)
			[9833]  = true, -- Moonfire (Rank 8)
			[9834]  = true, -- Moonfire (Rank 9)
			[9835]  = true, -- Moonfire (Rank 10)

			-- Insect Swarm (instant)
			[5570]  = true, -- Insect Swarm (Rank 1)
			[24974] = true, -- Insect Swarm (Rank 2)
			[24975] = true, -- Insect Swarm (Rank 3)
			[24976] = true, -- Insect Swarm (Rank 4)
			[24977] = true, -- Insect Swarm (Rank 5)

			-- Demoralizing Roar
			[99]    = true, -- Demoralizing Roar (Rank 1)
			[1735]  = true, -- Demoralizing Roar (Rank 2)
			[9490]  = true, -- Demoralizing Roar (Rank 3)
			[9747]  = true, -- Demoralizing Roar (Rank 4)
			[9898]  = true, -- Demoralizing Roar (Rank 5)

			-- Growl (Bear)
			[6795]  = true, -- Growl

			-- Cower (Cat)
			[1742]  = true, -- Cower (Rank 1)
			[1753]  = true, -- Cower (Rank 2)
			[1754]  = true, -- Cower (Rank 3)
			[1755]  = true, -- Cower (Rank 4)
			[1756]  = true, -- Cower (Rank 5)

			-- Bash (Bear)
			[5211]  = true, -- Bash (Rank 1)
			[6798]  = true, -- Bash (Rank 2)
			[8983]  = true, -- Bash (Rank 3)

			-- Swipe (Bear)
			[779]   = true, -- Swipe (Rank 1)
			[780]   = true, -- Swipe (Rank 2)
			[769]   = true, -- Swipe (Rank 3)

			-- Maul (Bear)
			[6807]  = true, -- Maul (Rank 1)
			[6808]  = true, -- Maul (Rank 2)
			[6809]  = true, -- Maul (Rank 3)
			[8972]  = true, -- Maul (Rank 4)
			[9745]  = true, -- Maul (Rank 5)
			[9880]  = true, -- Maul (Rank 6)
			[9881]  = true, -- Maul (Rank 7)

			-- Claw (Cat)
			[1082]  = true, -- Claw (Rank 1)
			[3029]  = true, -- Claw (Rank 2)
			[5201]  = true, -- Claw (Rank 3)
			[9849]  = true, -- Claw (Rank 4)
			[9850]  = true, -- Claw (Rank 5)

			-- Rake (Cat)
			[1822]  = true, -- Rake (Rank 1)
			[1823]  = true, -- Rake (Rank 2)
			[1824]  = true, -- Rake (Rank 3)

			-- Rip (Cat)
			[1079]  = true, -- Rip (Rank 1)
			[9492]  = true, -- Rip (Rank 2)
			[9493]  = true, -- Rip (Rank 3)
			[9752]  = true, -- Rip (Rank 4)
			[9894]  = true, -- Rip (Rank 5)
			[9896]  = true, -- Rip (Rank 6)

			-- Tiger’s Fury (Cat)
			[5217]  = true, -- Tiger's Fury (Rank 1)
			[6793]  = true, -- Tiger's Fury (Rank 2)
			[9845]  = true, -- Tiger's Fury (Rank 3)
			[9846]  = true, -- Tiger's Fury (Rank 4)

			-- Dash (Cat)
			[1850]  = true, -- Dash (Rank 1)
			[9821]  = true, -- Dash (Rank 2)

			-- Prowl (Cat)
			[5215]  = true, -- Prowl (Rank 1)
			[6783]  = true, -- Prowl (Rank 2)
			[9913]  = true, -- Prowl (Rank 3)

			-- Talent: Nature’s Swiftness
			[17116] = true, -- Nature's Swiftness

			-- Talent: Frenzied Regeneration
			[22842] = true, -- Frenzied Regeneration (Rank 1)
			[22895] = true, -- Frenzied Regeneration (Rank 2)
			[22896] = true, -- Frenzied Regeneration (Rank 3)

	-- mage spells
			-- Armor Buffs
			[168]   = true, -- Frost Armor (Rank 1)
			[7300]  = true, -- Frost Armor (Rank 2)
			[7301]  = true, -- Frost Armor (Rank 3)

			[6117]  = true, -- Mage Armor (Rank 1)
			[22782] = true, -- Mage Armor (Rank 2)
			[22783] = true, -- Mage Armor (Rank 3)

			[6119]  = true, -- Ice Armor (Rank 1)
			[7320]  = true, -- Ice Armor (Rank 2)
			[10219] = true, -- Ice Armor (Rank 3)
			[10220] = true, -- Ice Armor (Rank 4)

			-- Arcane Intellect
			[1459]  = true, -- Arcane Intellect (Rank 1)
			[1460]  = true, -- Arcane Intellect (Rank 2)
			[1461]  = true, -- Arcane Intellect (Rank 3)
			[10156] = true, -- Arcane Intellect (Rank 4)
			[10157] = true, -- Arcane Intellect (Rank 5)

			-- Dampen Magic
			[604]   = true, -- Dampen Magic (Rank 1)
			[8450]  = true, -- Dampen Magic (Rank 2)
			[8451]  = true, -- Dampen Magic (Rank 3)
			[10173] = true, -- Dampen Magic (Rank 4)
			[10174] = true, -- Dampen Magic (Rank 5)

			-- Amplify Magic
			[1008]  = true, -- Amplify Magic (Rank 1)
			[8455]  = true, -- Amplify Magic (Rank 2)
			[10169] = true, -- Amplify Magic (Rank 3)
			[10170] = true, -- Amplify Magic (Rank 4)

			-- Fire Blast (instant damage)
			[2136]  = true, -- Fire Blast (Rank 1)
			[2137]  = true, -- Fire Blast (Rank 2)
			[2138]  = true, -- Fire Blast (Rank 3)
			[8412]  = true, -- Fire Blast (Rank 4)
			[8413]  = true, -- Fire Blast (Rank 5)
			[10197] = true, -- Fire Blast (Rank 6)
			[10199] = true, -- Fire Blast (Rank 7)

			-- Cone of Cold (instant)
			[120]   = true, -- Cone of Cold (Rank 1)
			[8492]  = true, -- Cone of Cold (Rank 2)
			[10159] = true, -- Cone of Cold (Rank 3)
			[10160] = true, -- Cone of Cold (Rank 4)
			[10161] = true, -- Cone of Cold (Rank 5)

			-- Frost Nova (instant)
			[122]   = true, -- Frost Nova (Rank 1)
			[865]   = true, -- Frost Nova (Rank 2)
			[6131]  = true, -- Frost Nova (Rank 3)
			[10230] = true, -- Frost Nova (Rank 4)

			-- Blink
			[1953]  = true, -- Blink

			-- Mana Shield
			[1463]  = true, -- Mana Shield (Rank 1)
			[8494]  = true, -- Mana Shield (Rank 2)
			[8495]  = true, -- Mana Shield (Rank 3)
			[10191] = true, -- Mana Shield (Rank 4)
			[10192] = true, -- Mana Shield (Rank 5)
			[10193] = true, -- Mana Shield (Rank 6)

			-- Ice Barrier (instant)
			[11426] = true, -- Ice Barrier (Rank 1)
			[13031] = true, -- Ice Barrier (Rank 2)
			[13032] = true, -- Ice Barrier (Rank 3)
			[13033] = true, -- Ice Barrier (Rank 4)

			[2139]  = true, -- Counterspell
			[475]   = true, -- Remove Lesser Curse
			[2855]  = true, -- Detect Magic
			[12043] = true, -- Presence of Mind
			[12042] = true, -- Arcane Power

			[11958] = true, -- Ice Block (Rank 1)
			[12472] = true, -- Cold Snap

			-- Fire Ward
			[543]   = true, -- Fire Ward (Rank 1)
			[8457]  = true, -- Fire Ward (Rank 2)
			[8458]  = true, -- Fire Ward (Rank 3)
			[10223] = true, -- Fire Ward (Rank 4)
			[10225] = true, -- Fire Ward (Rank 5)

			-- Frost Ward
			[6143]  = true, -- Frost Ward (Rank 1)
			[8461]  = true, -- Frost Ward (Rank 2)
			[8462]  = true, -- Frost Ward (Rank 3)
			[10177] = true, -- Frost Ward (Rank 4)
			[28609] = true, -- Frost Ward (Rank 5)

	-- rogue spells
			-- Stealth
			[1784]  = true, -- Stealth (Rank 1)
			[1785]  = true, -- Stealth (Rank 2)
			[1786]  = true, -- Stealth (Rank 3)
			[1787]  = true, -- Stealth (Rank 4)

			-- Backstab
			[53]    = true, -- Backstab (Rank 1)
			[2589]  = true, -- Backstab (Rank 2)
			[2590]  = true, -- Backstab (Rank 3)
			[2591]  = true, -- Backstab (Rank 4)
			[8721]  = true, -- Backstab (Rank 5)
			[11279] = true, -- Backstab (Rank 6)
			[11280] = true, -- Backstab (Rank 7)
			[11281] = true, -- Backstab (Rank 8)

			-- Sinister Strike
			[1752]  = true, -- Sinister Strike (Rank 1)
			[1757]  = true, -- Sinister Strike (Rank 2)
			[1758]  = true, -- Sinister Strike (Rank 3)
			[1759]  = true, -- Sinister Strike (Rank 4)
			[1760]  = true, -- Sinister Strike (Rank 5)
			[8621]  = true, -- Sinister Strike (Rank 6)
			[11293] = true, -- Sinister Strike (Rank 7)
			[11294] = true, -- Sinister Strike (Rank 8)

			-- Eviscerate
			[2098]  = true, -- Eviscerate (Rank 1)
			[6760]  = true, -- Eviscerate (Rank 2)
			[6761]  = true, -- Eviscerate (Rank 3)
			[6762]  = true, -- Eviscerate (Rank 4)
			[8623]  = true, -- Eviscerate (Rank 5)
			[8624]  = true, -- Eviscerate (Rank 6)
			[11299] = true, -- Eviscerate (Rank 7)
			[11300] = true, -- Eviscerate (Rank 8)

			-- Gouge
			[1776]  = true, -- Gouge (Rank 1)
			[1777]  = true, -- Gouge (Rank 2)
			[8629]  = true, -- Gouge (Rank 3)
			[11285] = true, -- Gouge (Rank 4)
			[11286] = true, -- Gouge (Rank 5)

			-- Kick
			[1766]  = true, -- Kick (Rank 1)
			[1767]  = true, -- Kick (Rank 2)
			[1768]  = true, -- Kick (Rank 3)
			[1769]  = true, -- Kick (Rank 4)

			-- Kidney Shot
			[408]   = true, -- Kidney Shot (Rank 1)
			[8643]  = true, -- Kidney Shot (Rank 2)

			-- Cheap Shot
			[1833]  = true, -- Cheap Shot

			-- Garrote
			[703]   = true, -- Garrote (Rank 1)
			[8631]  = true, -- Garrote (Rank 2)
			[8632]  = true, -- Garrote (Rank 3)
			[8633]  = true, -- Garrote (Rank 4)
			[11289] = true, -- Garrote (Rank 5)
			[11290] = true, -- Garrote (Rank 6)

			-- Rupture
			[1943]  = true, -- Rupture (Rank 1)
			[8639]  = true, -- Rupture (Rank 2)
			[8640]  = true, -- Rupture (Rank 3)
			[11273] = true, -- Rupture (Rank 4)
			[11274] = true, -- Rupture (Rank 5)
			[11275] = true, -- Rupture (Rank 6)

			-- Slice and Dice
			[5171]  = true, -- Slice and Dice (Rank 1)
			[6774]  = true, -- Slice and Dice (Rank 2)

			-- Sprint
			[2983]  = true, -- Sprint (Rank 1)
			[8696]  = true, -- Sprint (Rank 2)
			[11305] = true, -- Sprint (Rank 3)

			-- Evasion
			[5277]  = true, -- Evasion (Rank 1)
			[26669] = true, -- Evasion (Rank 2)

			-- Vanish
			[1856]  = true, -- Vanish (Rank 1)
			[1857]  = true, -- Vanish (Rank 2)

			-- Feint
			[1966]  = true, -- Feint (Rank 1)
			[6768]  = true, -- Feint (Rank 2)
			[8637]  = true, -- Feint (Rank 3)
			[11303] = true, -- Feint (Rank 4)
			[25302] = true, -- Feint (Rank 5)

			-- Pick Pocket
			[921]   = true, -- Pick Pocket

			-- Sap
			[6770]  = true, -- Sap (Rank 1)
			[2070]  = true, -- Sap (Rank 2)
			[11297] = true, -- Sap (Rank 3)

			-- Blind
			[2094]  = true, -- Blind

			-- Talent: Cold Blood
			[14177] = true, -- Cold Blood

			-- Talent: Preparation
			[14185] = true, -- Preparation

			-- Talent: Ghostly Strike
			[14278] = true, -- Ghostly Strike

			-- Talent: Hemorrhage
			[16511] = true, -- Hemorrhage (Rank 1)
			[17347] = true, -- Hemorrhage (Rank 2)
			[17348] = true, -- Hemorrhage (Rank 3)

			-- Talent: Adrenaline Rush
			[13750] = true, -- Adrenaline Rush

	-- warlock spells
			-- Curses (all instant)
			[702]   = true, -- Curse of Weakness (Rank 1)
			[1108]  = true, -- Curse of Weakness (Rank 2)
			[1109]  = true, -- Curse of Weakness (Rank 3)
			[6205]  = true, -- Curse of Weakness (Rank 4)
			[7646]  = true, -- Curse of Weakness (Rank 5)
			[11707] = true, -- Curse of Weakness (Rank 6)
			[11708] = true, -- Curse of Weakness (Rank 7)

			[980]   = true, -- Curse of Agony (Rank 1)
			[1014]  = true, -- Curse of Agony (Rank 2)
			[6217]  = true, -- Curse of Agony (Rank 3)
			[11711] = true, -- Curse of Agony (Rank 4)
			[11712] = true, -- Curse of Agony (Rank 5)
			[11713] = true, -- Curse of Agony (Rank 6)

			[603]   = true, -- Curse of Doom

			[1714]  = true, -- Curse of Tongues (Rank 1)
			[11719] = true, -- Curse of Tongues (Rank 2)

			[702]   = true, -- Curse of Weakness (Rank 1) (already listed)

			[1490]  = true, -- Curse of the Elements (Rank 1)
			[11721] = true, -- Curse of the Elements (Rank 2)
			[11722] = true, -- Curse of the Elements (Rank 3)

			[1715]  = true, -- Curse of Recklessness (Rank 1)
			[11717] = true, -- Curse of Recklessness (Rank 2)

			[18223] = true, -- Curse of Exhaustion (Talent)

			-- Immolate (cast time → EXCLUDED)

			-- Siphon Life (instant)
			[18265] = true, -- Siphon Life (Rank 1)
			[18879] = true, -- Siphon Life (Rank 2)
			[18880] = true, -- Siphon Life (Rank 3)
			[18881] = true, -- Siphon Life (Rank 4)

			-- Life Tap (instant)
			[1454]  = true, -- Life Tap (Rank 1)
			[1455]  = true, -- Life Tap (Rank 2)
			[1456]  = true, -- Life Tap (Rank 3)
			[11687] = true, -- Life Tap (Rank 4)
			[11688] = true, -- Life Tap (Rank 5)
			[11689] = true, -- Life Tap (Rank 6)

			-- Demon Armor / Demon Skin
			[687]   = true, -- Demon Skin (Rank 1)
			[696]   = true, -- Demon Skin (Rank 2)

			[706]   = true, -- Demon Armor (Rank 1)
			[1086]  = true, -- Demon Armor (Rank 2)
			[11733] = true, -- Demon Armor (Rank 3)
			[11734] = true, -- Demon Armor (Rank 4)
			[11735] = true, -- Demon Armor (Rank 5)

			-- Detect Invisibility
			[132]   = true, -- Detect Invisibility (Rank 1)
			[2970]  = true, -- Detect Invisibility (Rank 2)
			[11743] = true, -- Detect Invisibility (Rank 3)

			-- Unending Breath
			[5697]  = true, -- Unending Breath

			-- Howl of Terror (instant)
			[5484]  = true, -- Howl of Terror (Rank 1)
			[17928] = true, -- Howl of Terror (Rank 2)

			-- Death Coil (instant)
			[6789]  = true, -- Death Coil (Rank 1)
			[17925] = true, -- Death Coil (Rank 2)
			[17926] = true, -- Death Coil (Rank 3)

	-- paladin spells
			-- Auras (all instant)
			[465]   = true, -- Devotion Aura (Rank 1)
			[10290] = true, -- Devotion Aura (Rank 2)
			[643]   = true, -- Devotion Aura (Rank 3)
			[10291] = true, -- Devotion Aura (Rank 4)
			[1032]  = true, -- Devotion Aura (Rank 5)
			[10292] = true, -- Devotion Aura (Rank 6)
			[10293] = true, -- Devotion Aura (Rank 7)

			[7294]  = true, -- Retribution Aura (Rank 1)
			[10298] = true, -- Retribution Aura (Rank 2)
			[10299] = true, -- Retribution Aura (Rank 3)
			[10300] = true, -- Retribution Aura (Rank 4)
			[10301] = true, -- Retribution Aura (Rank 5)

			[19876] = true, -- Shadow Resistance Aura (Rank 1)
			[19895] = true, -- Shadow Resistance Aura (Rank 2)
			[19896] = true, -- Shadow Resistance Aura (Rank 3)

			[19888] = true, -- Frost Resistance Aura (Rank 1)
			[19897] = true, -- Frost Resistance Aura (Rank 2)
			[19898] = true, -- Frost Resistance Aura (Rank 3)

			[19891] = true, -- Fire Resistance Aura (Rank 1)
			[19899] = true, -- Fire Resistance Aura (Rank 2)
			[19900] = true, -- Fire Resistance Aura (Rank 3)

			-- Blessings (all instant)
			[19740] = true, -- Blessing of Might (Rank 1)
			[19834] = true, -- Blessing of Might (Rank 2)
			[19835] = true, -- Blessing of Might (Rank 3)
			[19836] = true, -- Blessing of Might (Rank 4)
			[19837] = true, -- Blessing of Might (Rank 5)
			[19838] = true, -- Blessing of Might (Rank 6)
			[25291] = true, -- Blessing of Might (Rank 7)

			[19742] = true, -- Blessing of Wisdom (Rank 1)
			[19850] = true, -- Blessing of Wisdom (Rank 2)
			[19852] = true, -- Blessing of Wisdom (Rank 3)
			[19853] = true, -- Blessing of Wisdom (Rank 4)
			[19854] = true, -- Blessing of Wisdom (Rank 5)

			[25782] = true, -- Greater Blessing of Might (Rank 1)
			[25916] = true, -- Greater Blessing of Might (Rank 2)

			[25894] = true, -- Greater Blessing of Wisdom (Rank 1)
			[25918] = true, -- Greater Blessing of Wisdom (Rank 2)

			[20217] = true, -- Blessing of Kings
			[25898] = true, -- Greater Blessing of Kings

			[20911] = true, -- Blessing of Sanctuary (Rank 1)
			[20912] = true, -- Blessing of Sanctuary (Rank 2)
			[20913] = true, -- Blessing of Sanctuary (Rank 3)
			[20914] = true, -- Blessing of Sanctuary (Rank 4)

			-- Seals (all instant)
			[21084] = true, -- Seal of Righteousness (Rank 1)
			[20287] = true, -- Seal of Righteousness (Rank 2)
			[20288] = true, -- Seal of Righteousness (Rank 3)
			[20289] = true, -- Seal of Righteousness (Rank 4)
			[20290] = true, -- Seal of Righteousness (Rank 5)
			[20291] = true, -- Seal of Righteousness (Rank 6)
			[20292] = true, -- Seal of Righteousness (Rank 7)
			[20293] = true, -- Seal of Righteousness (Rank 8)

			[20154] = true, -- Seal of Righteousness (duplicate spellID used internally)

			[20164] = true, -- Seal of Justice

			[20165] = true, -- Seal of Light (Rank 1)
			[20347] = true, -- Seal of Light (Rank 2)
			[20348] = true, -- Seal of Light (Rank 3)
			[20349] = true, -- Seal of Light (Rank 4)

			[20166] = true, -- Seal of Wisdom (Rank 1)
			[20356] = true, -- Seal of Wisdom (Rank 2)
			[20357] = true, -- Seal of Wisdom (Rank 3)

			[20162] = true, -- Seal of the Crusader (Rank 1)
			[20305] = true, -- Seal of the Crusader (Rank 2)
			[20306] = true, -- Seal of the Crusader (Rank 3)
			[20307] = true, -- Seal of the Crusader (Rank 4)
			[20308] = true, -- Seal of the Crusader (Rank 5)

			-- Judgement (instant)
			[20271] = true, -- Judgement

			-- Hands (all instant)
			[1022]  = true, -- Blessing of Protection (Rank 1)
			[5599]  = true, -- Blessing of Protection (Rank 2)
			[10278] = true, -- Blessing of Protection (Rank 3)

			[1044]  = true, -- Blessing of Freedom

			[6940]  = true, -- Blessing of Sacrifice (Rank 1)
			[20729] = true, -- Blessing of Sacrifice (Rank 2)

			-- Divine Shield / Divine Protection / Lay on Hands
			[642]   = true, -- Divine Shield (Rank 1)
			[1020]  = true, -- Divine Shield (Rank 2)

			[498]   = true, -- Divine Protection (Rank 1)
			[5573]  = true, -- Divine Protection (Rank 2)

			[633]   = true, -- Lay on Hands (Rank 1)
			[2800]  = true, -- Lay on Hands (Rank 2)
			[10310] = true, -- Lay on Hands (Rank 3)

			-- Purify / Cleanse
			[1152]  = true, -- Purify
			[4987]  = true, -- Cleanse

			-- Hammer of Justice (instant)
			[853]   = true, -- Hammer of Justice (Rank 1)
			[5588]  = true, -- Hammer of Justice (Rank 2)
			[5589]  = true, -- Hammer of Justice (Rank 3)
			[10308] = true, -- Hammer of Justice (Rank 4)

			-- Holy Shield (instant)
			[20925] = true, -- Holy Shield (Rank 1)
			[20927] = true, -- Holy Shield (Rank 2)
			[20928] = true, -- Holy Shield (Rank 3)

			-- Consecration (instant)
			[26573] = true, -- Consecration (Rank 1)
			[20116] = true, -- Consecration (Rank 2)
			[20922] = true, -- Consecration (Rank 3)
			[20923] = true, -- Consecration (Rank 4)
			[20924] = true, -- Consecration (Rank 5)

			-- Righteous Fury (instant)
			[25780] = true, -- Righteous Fury

			-- Seal of Command (instant)
			[20375] = true, -- Seal of Command

			-- Divine Favor (instant)
			[20216] = true, -- Divine Favor

			-- Repentance (instant)
			[20066] = true, -- Repentance

			-- Vengeance (passive → excluded)

			-- Sanctity Aura
			[20218] = true, -- Sanctity Aura

	-- priest spells
			-- Power Word: Fortitude
			[1243]  = true, -- Power Word: Fortitude (Rank 1)
			[1244]  = true, -- Power Word: Fortitude (Rank 2)
			[1245]  = true, -- Power Word: Fortitude (Rank 3)
			[2791]  = true, -- Power Word: Fortitude (Rank 4)
			[10937] = true, -- Power Word: Fortitude (Rank 5)
			[10938] = true, -- Power Word: Fortitude (Rank 6)

			-- Prayer of Fortitude
			[21562] = true, -- Prayer of Fortitude (Rank 1)
			[21564] = true, -- Prayer of Fortitude (Rank 2)

			-- Power Word: Shield
			[17]    = true, -- Power Word: Shield (Rank 1)
			[592]   = true, -- Power Word: Shield (Rank 2)
			[600]   = true, -- Power Word: Shield (Rank 3)
			[3747]  = true, -- Power Word: Shield (Rank 4)
			[6065]  = true, -- Power Word: Shield (Rank 5)
			[6066]  = true, -- Power Word: Shield (Rank 6)
			[10898] = true, -- Power Word: Shield (Rank 7)
			[10899] = true, -- Power Word: Shield (Rank 8)
			[10900] = true, -- Power Word: Shield (Rank 9)
			[10901] = true, -- Power Word: Shield (Rank 10)

			-- Renew
			[139]   = true, -- Renew (Rank 1)
			[6074]  = true, -- Renew (Rank 2)
			[6075]  = true, -- Renew (Rank 3)
			[6076]  = true, -- Renew (Rank 4)
			[6077]  = true, -- Renew (Rank 5)
			[6078]  = true, -- Renew (Rank 6)
			[10927] = true, -- Renew (Rank 7)
			[10928] = true, -- Renew (Rank 8)
			[10929] = true, -- Renew (Rank 9)
			[25315] = true, -- Renew (Rank 10)

			-- Shadow Word: Pain
			[589]   = true, -- Shadow Word: Pain (Rank 1)
			[594]   = true, -- Shadow Word: Pain (Rank 2)
			[970]   = true, -- Shadow Word: Pain (Rank 3)
			[992]   = true, -- Shadow Word: Pain (Rank 4)
			[2767]  = true, -- Shadow Word: Pain (Rank 5)
			[10892] = true, -- Shadow Word: Pain (Rank 6)
			[10893] = true, -- Shadow Word: Pain (Rank 7)
			[10894] = true, -- Shadow Word: Pain (Rank 8)

			-- Devouring Plague (Undead only)
			[2944]  = true, -- Devouring Plague (Rank 1)
			[19276] = true, -- Devouring Plague (Rank 2)
			[19277] = true, -- Devouring Plague (Rank 3)
			[19278] = true, -- Devouring Plague (Rank 4)
			[19279] = true, -- Devouring Plague (Rank 5)
			[19280] = true, -- Devouring Plague (Rank 6)

			-- Inner Fire
			[588]   = true, -- Inner Fire (Rank 1)
			[7128]  = true, -- Inner Fire (Rank 2)
			[602]   = true, -- Inner Fire (Rank 3)
			[1006]  = true, -- Inner Fire (Rank 4)
			[10951] = true, -- Inner Fire (Rank 5)
			[10952] = true, -- Inner Fire (Rank 6)

			-- Fear Ward (Dwarf only)
			[6346]  = true, -- Fear Ward

			-- Dispel Magic
			[527]   = true, -- Dispel Magic (Rank 1)
			[988]   = true, -- Dispel Magic (Rank 2)

			-- Cure Disease
			[528]   = true, -- Cure Disease

			-- Abolish Disease
			[552]   = true, -- Abolish Disease

			-- Fade
			[586]   = true, -- Fade (Rank 1)
			[9578]  = true, -- Fade (Rank 2)
			[9579]  = true, -- Fade (Rank 3)
			[9592]  = true, -- Fade (Rank 4)
			[10941] = true, -- Fade (Rank 5)
			[10942] = true, -- Fade (Rank 6)

			-- Psychic Scream
			[8122]  = true, -- Psychic Scream (Rank 1)
			[8124]  = true, -- Psychic Scream (Rank 2)
			[10888] = true, -- Psychic Scream (Rank 3)
			[10890] = true, -- Psychic Scream (Rank 4)

			-- Mind Vision
			[2096]  = true, -- Mind Vision (Rank 1)
			[10909] = true, -- Mind Vision (Rank 2)

			-- Mind Soothe
			[453]   = true, -- Mind Soothe (Rank 1)
			[8192]  = true, -- Mind Soothe (Rank 2)
			[10953] = true, -- Mind Soothe (Rank 3)

			-- Holy Nova (instant)
			[15237] = true, -- Holy Nova (Rank 1)
			[15430] = true, -- Holy Nova (Rank 2)
			[15431] = true, -- Holy Nova (Rank 3)
			[27799] = true, -- Holy Nova (Rank 4)
			[27800] = true, -- Holy Nova (Rank 5)
			[27801] = true, -- Holy Nova (Rank 6)

			-- Shadowguard (Troll only)
			[18137] = true, -- Shadowguard (Rank 1)
			[19308] = true, -- Shadowguard (Rank 2)
			[19309] = true, -- Shadowguard (Rank 3)
			[19310] = true, -- Shadowguard (Rank 4)
			[19311] = true, -- Shadowguard (Rank 5)
			[19312] = true, -- Shadowguard (Rank 6)

			-- Touch of Weakness (Undead only)
			[2652]  = true, -- Touch of Weakness (Rank 1)
			[19261] = true, -- Touch of Weakness (Rank 2)
			[19262] = true, -- Touch of Weakness (Rank 3)
			[19264] = true, -- Touch of Weakness (Rank 4)
			[19265] = true, -- Touch of Weakness (Rank 5)
			[19266] = true, -- Touch of Weakness (Rank 6)

			-- Feedback (Human only)
			[13896] = true, -- Feedback (Rank 1)
			[19271] = true, -- Feedback (Rank 2)
			[19273] = true, -- Feedback (Rank 3)
			[19274] = true, -- Feedback (Rank 4)
			[19275] = true, -- Feedback (Rank 5)

			-- Inner Focus (instant)
			[14751] = true, -- Inner Focus

			-- Power Infusion (instant)
			[10060] = true, -- Power Infusion

			-- Silence (instant)
			[15487] = true, -- Silence

			-- Spirit Tap (passive → excluded)

			-- Shadowform (instant)
			[15473] = true, -- Shadowform

	-- shaman spells
			-- Shocks (all instant)
			[8042]  = true, -- Earth Shock (Rank 1)
			[8044]  = true, -- Earth Shock (Rank 2)
			[8045]  = true, -- Earth Shock (Rank 3)
			[8046]  = true, -- Earth Shock (Rank 4)
			[10412] = true, -- Earth Shock (Rank 5)
			[10413] = true, -- Earth Shock (Rank 6)
			[10414] = true, -- Earth Shock (Rank 7)

			[8050]  = true, -- Flame Shock (Rank 1)
			[8052]  = true, -- Flame Shock (Rank 2)
			[8053]  = true, -- Flame Shock (Rank 3)
			[10447] = true, -- Flame Shock (Rank 4)
			[10448] = true, -- Flame Shock (Rank 5)
			[29228] = true, -- Flame Shock (Rank 6)

			[8056]  = true, -- Frost Shock (Rank 1)
			[8058]  = true, -- Frost Shock (Rank 2)
			[10472] = true, -- Frost Shock (Rank 3)
			[10473] = true, -- Frost Shock (Rank 4)

			-- Lightning Shield (instant)
			[324]   = true, -- Lightning Shield (Rank 1)
			[325]   = true, -- Lightning Shield (Rank 2)
			[905]   = true, -- Lightning Shield (Rank 3)
			[945]   = true, -- Lightning Shield (Rank 4)
			[8134]  = true, -- Lightning Shield (Rank 5)
			[10431] = true, -- Lightning Shield (Rank 6)
			[10432] = true, -- Lightning Shield (Rank 7)

			-- Weapon Buffs (all instant)
			[8024]  = true, -- Flametongue Weapon (Rank 1)
			[8027]  = true, -- Flametongue Weapon (Rank 2)
			[8030]  = true, -- Flametongue Weapon (Rank 3)
			[16339] = true, -- Flametongue Weapon (Rank 4)
			[16341] = true, -- Flametongue Weapon (Rank 5)
			[16342] = true, -- Flametongue Weapon (Rank 6)

			[8033]  = true, -- Frostbrand Weapon (Rank 1)
			[8038]  = true, -- Frostbrand Weapon (Rank 2)
			[10456] = true, -- Frostbrand Weapon (Rank 3)
			[16355] = true, -- Frostbrand Weapon (Rank 4)
			[16356] = true, -- Frostbrand Weapon (Rank 5)

			[8071]  = true, -- Rockbiter Weapon (Rank 1)
			[8154]  = true, -- Rockbiter Weapon (Rank 2)
			[8155]  = true, -- Rockbiter Weapon (Rank 3)
			[10486] = true, -- Rockbiter Weapon (Rank 4)
			[16314] = true, -- Rockbiter Weapon (Rank 5)
			[16315] = true, -- Rockbiter Weapon (Rank 6)
			[16316] = true, -- Rockbiter Weapon (Rank 7)

			[8232]  = true, -- Windfury Weapon (Rank 1)
			[8235]  = true, -- Windfury Weapon (Rank 2)
			[10486] = true, -- Windfury Weapon (Rank 3)
			[16362] = true, -- Windfury Weapon (Rank 4)

			-- Totems (ALL instant)
			-- Earth Totems
			[2484]  = true, -- Earthbind Totem
			[8075]  = true, -- Strength of Earth Totem (Rank 1)
			[8160]  = true, -- Strength of Earth Totem (Rank 2)
			[8161]  = true, -- Strength of Earth Totem (Rank 3)
			[10442] = true, -- Strength of Earth Totem (Rank 4)

			[5730]  = true, -- Stoneclaw Totem (Rank 1)
			[6390]  = true, -- Stoneclaw Totem (Rank 2)
			[6391]  = true, -- Stoneclaw Totem (Rank 3)
			[6392]  = true, -- Stoneclaw Totem (Rank 4)
			[10427] = true, -- Stoneclaw Totem (Rank 5)
			[10428] = true, -- Stoneclaw Totem (Rank 6)

			[8071]  = true, -- Stoneskin Totem (Rank 1)
			[8154]  = true, -- Stoneskin Totem (Rank 2)
			[8155]  = true, -- Stoneskin Totem (Rank 3)
			[10406] = true, -- Stoneskin Totem (Rank 4)
			[10407] = true, -- Stoneskin Totem (Rank 5)
			[10408] = true, -- Stoneskin Totem (Rank 6)

			[8143]  = true, -- Tremor Totem

			-- Fire Totems
			[3599]  = true, -- Searing Totem (Rank 1)
			[6363]  = true, -- Searing Totem (Rank 2)
			[6364]  = true, -- Searing Totem (Rank 3)
			[6365]  = true, -- Searing Totem (Rank 4)
			[10437] = true, -- Searing Totem (Rank 5)
			[10438] = true, -- Searing Totem (Rank 6)

			[8190]  = true, -- Magma Totem (Rank 1)
			[10585] = true, -- Magma Totem (Rank 2)
			[10586] = true, -- Magma Totem (Rank 3)
			[10587] = true, -- Magma Totem (Rank 4)

			[1535]  = true, -- Fire Nova Totem (Rank 1)
			[8498]  = true, -- Fire Nova Totem (Rank 2)
			[8499]  = true, -- Fire Nova Totem (Rank 3)
			[11314] = true, -- Fire Nova Totem (Rank 4)
			[11315] = true, -- Fire Nova Totem (Rank 5)

			[8181]  = true, -- Frost Resistance Totem (Rank 1)
			[10478] = true, -- Frost Resistance Totem (Rank 2)
			[10479] = true, -- Frost Resistance Totem (Rank 3)

			-- Air Totems
			[8177]  = true, -- Grounding Totem
			[10595] = true, -- Nature Resistance Totem (Rank 1)
			[10600] = true, -- Nature Resistance Totem (Rank 2)
			[10601] = true, -- Nature Resistance Totem (Rank 3)

			[8512]  = true, -- Windfury Totem (Rank 1)
			[10613] = true, -- Windfury Totem (Rank 2)
			[10614] = true, -- Windfury Totem (Rank 3)

			[6495]  = true, -- Sentry Totem

			[25908] = true, -- Tranquil Air Totem

			[8835]  = true, -- Grace of Air Totem (Rank 1)
			[10627] = true, -- Grace of Air Totem (Rank 2)

			-- Water Totems
			[5394]  = true, -- Healing Stream Totem (Rank 1)
			[6375]  = true, -- Healing Stream Totem (Rank 2)
			[6377]  = true, -- Healing Stream Totem (Rank 3)
			[10462] = true, -- Healing Stream Totem (Rank 4)
			[10463] = true, -- Healing Stream Totem (Rank 5)

			[5675]  = true, -- Mana Spring Totem (Rank 1)
			[10495] = true, -- Mana Spring Totem (Rank 2)
			[10496] = true, -- Mana Spring Totem (Rank 3)
			[10497] = true, -- Mana Spring Totem (Rank 4)

			[8184]  = true, -- Fire Resistance Totem (Rank 1)
			[10537] = true, -- Fire Resistance Totem (Rank 2)
			[10538] = true, -- Fire Resistance Totem (Rank 3)

			[8166]  = true, -- Poison Cleansing Totem
			[8170]  = true, -- Disease Cleansing Totem

			-- Purge (instant)
			[370]   = true, -- Purge (Rank 1)
			[8012]  = true, -- Purge (Rank 2)

			-- Cure Poison
			[526]   = true, -- Cure Poison

			-- Cure Disease
			[2870]  = true, -- Cure Disease

			-- Water Breathing
			[131]   = true, -- Water Breathing

			-- Water Walking
			[546]   = true, -- Water Walking

			-- Astral Recall
			[556]   = true, -- Astral Recall

			-- Elemental Mastery (instant)
			[16166] = true, -- Elemental Mastery

			-- Nature’s Swiftness (instant)
			[16188] = true, -- Nature's Swiftness

			-- Stormstrike (instant)
			[17364] = true, -- Stormstrike

	-- warrior spells
			-- Stances (all instant)
			[2457]  = true, -- Battle Stance
			[71]    = true, -- Defensive Stance
			[2458]  = true, -- Berserker Stance

			-- Shouts (all instant)
			[6673]  = true, -- Battle Shout (Rank 1)
			[5242]  = true, -- Battle Shout (Rank 2)
			[6192]  = true, -- Battle Shout (Rank 3)
			[11549] = true, -- Battle Shout (Rank 4)
			[11550] = true, -- Battle Shout (Rank 5)
			[11551] = true, -- Battle Shout (Rank 6)
			[25289] = true, -- Battle Shout (Rank 7)

			[1160]  = true, -- Demoralizing Shout (Rank 1)
			[6190]  = true, -- Demoralizing Shout (Rank 2)
			[11554] = true, -- Demoralizing Shout (Rank 3)
			[11555] = true, -- Demoralizing Shout (Rank 4)
			[11556] = true, -- Demoralizing Shout (Rank 5)

			-- Taunt / Threat
			[355]   = true, -- Taunt
			[1161]  = true, -- Challenging Shout

			-- Charge / Intercept / Intervene
			--[100]   = true, -- Charge (Rank 1)
			--[6178]  = true, -- Charge (Rank 2)
			--[11578] = true, -- Charge (Rank 3)

			[20252] = true, -- Intercept (Rank 1)
			[20616] = true, -- Intercept (Rank 2)
			[20617] = true, -- Intercept (Rank 3)

			-- Bloodrage
			[2687]  = true, -- Bloodrage

			-- Berserker Rage
			[18499] = true, -- Berserker Rage

			-- Bloodthirst (instant)
			[23881] = true, -- Bloodthirst (Rank 1)
			[23892] = true, -- Bloodthirst (Rank 2)
			[23893] = true, -- Bloodthirst (Rank 3)
			[23894] = true, -- Bloodthirst (Rank 4)

			-- Mortal Strike (instant)
			[12294] = true, -- Mortal Strike (Rank 1)
			[21551] = true, -- Mortal Strike (Rank 2)
			[21552] = true, -- Mortal Strike (Rank 3)
			[21553] = true, -- Mortal Strike (Rank 4)

			-- Whirlwind (instant)
			[1680]  = true, -- Whirlwind

			-- Execute (instant)
			[5308]  = true, -- Execute (Rank 1)
			[20658] = true, -- Execute (Rank 2)
			[20660] = true, -- Execute (Rank 3)
			[20661] = true, -- Execute (Rank 4)
			[20662] = true, -- Execute (Rank 5)

			-- Overpower (instant)
			[7384]  = true, -- Overpower (Rank 1)
			[7887]  = true, -- Overpower (Rank 2)
			[11584] = true, -- Overpower (Rank 3)
			[11585] = true, -- Overpower (Rank 4)

			-- Hamstring (instant)
			[1715]  = true, -- Hamstring (Rank 1)
			[7372]  = true, -- Hamstring (Rank 2)
			[7373]  = true, -- Hamstring (Rank 3)

			-- Rend (instant)
			[772]   = true, -- Rend (Rank 1)
			[6546]  = true, -- Rend (Rank 2)
			[6547]  = true, -- Rend (Rank 3)
			[6548]  = true, -- Rend (Rank 4)
			[11572] = true, -- Rend (Rank 5)
			[11573] = true, -- Rend (Rank 6)
			[11574] = true, -- Rend (Rank 7)

			-- Thunder Clap (instant)
			[6343]  = true, -- Thunder Clap (Rank 1)
			[8198]  = true, -- Thunder Clap (Rank 2)
			[8204]  = true, -- Thunder Clap (Rank 3)
			[8205]  = true, -- Thunder Clap (Rank 4)
			[11580] = true, -- Thunder Clap (Rank 5)
			[11581] = true, -- Thunder Clap (Rank 6)

			-- Cleave (instant)
			[845]   = true, -- Cleave (Rank 1)
			[7369]  = true, -- Cleave (Rank 2)
			[11608] = true, -- Cleave (Rank 3)
			[11609] = true, -- Cleave (Rank 4)
			[20569] = true, -- Cleave (Rank 5)

			-- Heroic Strike (instant)
			[78]    = true, -- Heroic Strike (Rank 1)
			[284]   = true, -- Heroic Strike (Rank 2)
			[285]   = true, -- Heroic Strike (Rank 3)
			[1608]  = true, -- Heroic Strike (Rank 4)
			[11564] = true, -- Heroic Strike (Rank 5)
			[11565] = true, -- Heroic Strike (Rank 6)
			[11566] = true, -- Heroic Strike (Rank 7)
			[11567] = true, -- Heroic Strike (Rank 8)

			-- Sunder Armor (instant)
			[7386]  = true, -- Sunder Armor (Rank 1)
			[7405]  = true, -- Sunder Armor (Rank 2)
			[8380]  = true, -- Sunder Armor (Rank 3)
			[11596] = true, -- Sunder Armor (Rank 4)
			[11597] = true, -- Sunder Armor (Rank 5)

			-- Shield Bash (instant)
			[72]    = true, -- Shield Bash (Rank 1)
			[1671]  = true, -- Shield Bash (Rank 2)
			[1672]  = true, -- Shield Bash (Rank 3)

			-- Shield Block (instant)
			[2565]  = true, -- Shield Block

			-- Shield Wall (instant)
			[871]   = true, -- Shield Wall

			-- Retaliation (instant)
			[20230] = true, -- Retaliation

			-- Recklessness (instant)
			[1719]  = true, -- Recklessness

			-- Intimidating Shout (instant)
			[5246]  = true, -- Intimidating Shout

			-- Disarm (instant)
			[676]   = true, -- Disarm

			-- Pummel (instant)
			[6552]  = true, -- Pummel (Rank 1)
			[6554]  = true, -- Pummel (Rank 2)

			-- Revenge (instant)
			[6572]  = true, -- Revenge (Rank 1)
			[6574]  = true, -- Revenge (Rank 2)
			[7379]  = true, -- Revenge (Rank 3)
			[11600] = true, -- Revenge (Rank 4)
			[11601] = true, -- Revenge (Rank 5)

			-- Mocking Blow (instant)
			[694]   = true, -- Mocking Blow (Rank 1)
			[7400]  = true, -- Mocking Blow (Rank 2)
			[7402]  = true, -- Mocking Blow (Rank 3)
			[20559] = true, -- Mocking Blow (Rank 4)
			[20560] = true, -- Mocking Blow (Rank 5)

			-- Piercing Howl (talent)
			[12323] = true, -- Piercing Howl

			-- Death Wish (talent)
			[12292] = true, -- Death Wish

			-- Sweeping Strikes (talent)
			[12328] = true, -- Sweeping Strikes

	}

	if spellTable[Player():GetCasting()] or spellTable[Player():GetChanneling()] then

		return true;
	end

return false;
end