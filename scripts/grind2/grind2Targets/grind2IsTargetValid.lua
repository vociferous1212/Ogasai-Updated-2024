grind2IsTargetValid = {

    minLevel = GetLocalPlayer():GetLevel() - 4,
    maxLevel = GetLocalPlayer():GetLevel() + 2,

    skipElites = true,
    skipHumanoid = false,
    skipBeast = false,
    skipUnknown = false,
    skipAberration = false,
    skipDemon = false,
    skipDragonkin = false,
    skipElemental = false,
    skipGiant = false,
    skipMechanical = false,
    skipUndead = false,


}


--[[

	is target valid will check for target type and check for distance from hotspot

	allow to be passed and called with assignATarget

	check for humanoid beast dragonkin etc

	return false if conditions are not met

]]

function grind2IsTargetValid:target(i)

        if (not grind2SafePull:targetHasAdds(i) or grind2SafePull.skipSafePull)
        
            and (
            i:GetLevel() >= self.minLevel and i:GetLevel() <= self.maxLevel)
            and (not (self.skipHumanoid and i:GetCreatureType() == "Humanoid")
            and not (self.skipBeast and i:GetCreatureType() == "Beast")
            and not (self.skipAberration and i:GetCreatureType() == "Abberation")
            and not (self.skipDemon and i:GetCreatureType() == "Demon")
            and not (self.skipDragonkin and i:GetCreatureType() == "Dragonkin")
            and not (self.skipElemental and i:GetCreatureType() == "Elemental")
            and not (self.skipGiant and i:GetCreatureType() == "Giant")
            and not (self.skipMechanical and i:GetCreatureType() == "Mechanical")
            and not (self.skipUndead and i:GetCreatureType() == "Undead")
            and not (self.skipUnknown and i:GetCreatureType() == "Not Specified")
            and not (self.skipElites and (i:GetClassification() == 1 or i:GetClassification() == 2))
            )

            and (not grind2Blacklisting:isTargetBlacklisted(i:GetGUID())
            or (grind2Blacklisting:isTargetBlacklisted(i:GetGUID()) and i:GetHealthPercentage() <= 92)
            or (grind2Blacklisting:isTargetBlacklisted(i:GetGUID()) and grind2IsTargetingMe:target(i) and i:GetDistance() <= 5)
            )
            or (grind2IsTargetingMe:target(i) or grind2IsTargetingPet:target(i) or grind2IsTargetingGroup:target(i))
            or (i:IsTappedByMe() and not i:IsDead())
            or ( (i:HasDebuff("Polymorph") or i:HasDebuff("Fear") ) and script_grind:enemiesAttackingUs() < 2
            )

        then
           -- if isTargetInRange() then
            return true;
        end

return false;
end