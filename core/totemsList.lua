totemsList = {

		totems = {

			["Healing Stream Totem"] = true,
			["Healing Stream Totem II"] = true,
			["Healing Stream Totem III"] = true,
			["Healing Stream Totem IV"] = true,
			["Healing Stream Totem V"] = true,

			["Searing Totem"] = true,
			["Searing Totem II"] = true,
			["Searing Totem III"] = true,
			["Searing Totem IV"] = true,
			["Searing Totem V"] = true,

			["Magma Totem"] = true,
			["Magma Totem II"] = true,
			["Magma Totem III"] = true,
			["Magma Totem IV"] = true,

			["Fire Nova Totem"] = true,
			["Fire Nova Totem II"] = true,
			["Fire Nova Totem III"] = true,
			["Fire Nova Totem IV"] = true,
			["Fire Nova Totem V"] = true,

			["Stoneclaw Totem"] = true,
			["Stoneclaw Totem II"] = true,
			["Stoneclaw Totem III"] = true,
			["Stoneclaw Totem IV"] = true,
			["Stoneclaw Totem V"] = true,

			["Stoneskin Totem"] = true,
			["Stoneskin Totem II"] = true,
			["Stoneskin Totem III"] = true,
			["Stoneskin Totem IV"] = true,
			["Stoneskin Totem V"] = true,

			["Strength of Earth Totem"] = true,
			["Strength of Earth Totem II"] = true,
			["Strength of Earth Totem III"] = true,
			["Strength of Earth Totem IV"] = true,
			["Strength of Earth Totem V"] = true,

			["Windfury Totem"] = true,
			["Windfury Totem II"] = true,
			["Windfury Totem III"] = true,

			["Grace of Air Totem"] = true,
			["Grace of Air Totem II"] = true,

			["Windwall Totem"] = true,
			["Windwall Totem II"] = true,
			["Windwall Totem III"] = true,

			["Grounding Totem"] = true,

			["Tremor Totem"] = true,

			["Poison Cleansing Totem"] = true,
			["Disease Cleansing Totem"] = true,

			["Mana Spring Totem"] = true,
			["Mana Spring Totem II"] = true,
			["Mana Spring Totem III"] = true,
			["Mana Spring Totem IV"] = true,

			["Mana Tide Totem"] = true,

			["Fire Resistance Totem"] = true,
			["Fire Resistance Totem II"] = true,
			["Fire Resistance Totem III"] = true,

			["Frost Resistance Totem"] = true,
			["Frost Resistance Totem II"] = true,
			["Frost Resistance Totem III"] = true,

			["Nature Resistance Totem"] = true,
			["Nature Resistance Totem II"] = true,
			["Nature Resistance Totem III"] = true,

			["Tidal Totem"] = true,
			["Corrupted Healing Totem"] = true,
			["Corrupted Stoneskin Totem"] = true,
			["Corrupted Windfury Totem"] = true,
			["Corrupted Fire Nova Totem"] = true,
			["Corrupted Stoneclaw Totem"] = true,
			["Corrupted Strength Totem"] = true,
			["Corrupted Mana Spring Totem"] = true,

			["Earthbind Totem"] = true,
			["Earthgrab Totem"] = true,

			["Healing Ward"] = true,
			["Healing Ward II"] = true,
			["Healing Ward III"] = true,
			["Healing Ward IV"] = true,
			["Healing Ward V"] = true,

			["Poison Cleansing Totem"] = true,
			["Disease Cleansing Totem"] = true,

			["Hex of Weakness Totem"] = true,
			["Hex of Jammal'an Totem"] = true,
			["Hex of Agony Totem"] = true,
			["Hex of Slumber Totem"] = true,

			["Corrupted Healing Totem"] = true,
			["Corrupted Fire Nova Totem"] = true,
			["Corrupted Stoneskin Totem"] = true,
			["Corrupted Windfury Totem"] = true,

			["Lightning Totem"] = true,
			["Stormcaller's Totem"] = true,
			["Totem of Wrath"] = true,

			["Ensnaring Totem"] = true,
			["Binding Totem"] = true,
			["Frost Nova Totem"] = true,

			["Ward of Laze"] = true,
			["Ward of Zum'rah"] = true,
			["Ward of the Dead"] = true,
			["Ward of the Eye"] = true,

			["Twilight Fire Nova Totem"] = true,
			["Twilight Healing Totem"] = true,

			["Enfeebling Totem"] = true,
			["Withering Totem"] = true,
			["Hexing Totem"] = true,

			["Lightning Shield Totem"] = true,
			["Static Totem"] = true,
			["Stormcall Totem"] = true,

			["Windstorm Totem"] = true,
			["Dust Storm Totem"] = true,

			["Fel Fire Totem"] = true,
			["Fel Lash Totem"] = true,

			["Shadowflame Totem"] = true,
			["Shadow Burst Totem"] = true,
			["Bone Totem"] = true,

			["Totem of Spirits"] = true,
			["Totem of Life"] = true,
			["Totem of Akil'zon"] = true,
			["Totem of the Plains"] = true,

			["Bloodlust Totem"] = true,
			["Spirit Channeling Totem"] = true,
			["Soul Tap Totem"] = true,

			["Immolation Totem"] = true,
			["Freezing Totem"] = true,
			["Crippling Totem"] = true,
			["Entangling Totem"] = true,
			["Blinding Totem"] = true,

			["Moonflare Totem"] = true,

			}


}

function totemsList:isTargetTotem(i)
	
			-- need to remmber to sort the totems for shaman
	if (self.totems[i:GetUnitName()] or i:GetCreatureType() == "Totem") and i:CanAttack() and not i:IsDead() then
		return true;
	end

return false;
end
