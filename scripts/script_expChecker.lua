script_expChecker = {
    messageRest = "Waiting For Target...",
    initialXP = nil,
    startTime = nil,
    lastXPPerHour = 0,
    lastTimeToLevel = "N/A",
    lastLevel = nil,
    lastXP = nil,
}

-- Calculate XP per hour and time to level
function script_expChecker:calculateXPPerHour()
    --if (script_grind.pause and _quest.pause) then
    --    return self.lastXPPerHour, self.lastTimeToLevel
  --  end

    local currentXP = UnitXP("player")
    local currentTime = GetTimeEX() / 1000
    local currentLevel = GetLocalPlayer():GetLevel()

    -- Initialize on first call or level change (like Titan Panel's session start)
    if self.lastLevel == nil or self.lastLevel ~= currentLevel then
        self.initialXP = currentXP
        self.startTime = currentTime
        self.lastXPPerHour = 0
        self.lastTimeToLevel = "N/A"
        self.lastLevel = currentLevel
        return 0, "N/A"
    end

    local xpGained = currentXP - self.initialXP
    local timeElapsed = currentTime - self.startTime

    -- 1-second delay for stability, similar to Titan Panel's approach
    if timeElapsed < 1 or xpGained <= 0 then
        return self.lastXPPerHour, self.lastTimeToLevel
    end

    local xpPerHour = math.floor((xpGained / timeElapsed) * 3600)
    -- Format XP per hour to nearest thousand (e.g., 5520 -> "5k", 35121 -> "35k")
    local formattedXPPerHour = math.floor(xpPerHour / 1000) .. "k"
    self.lastXPPerHour = formattedXPPerHour

    -- Calculate time to level
    local remainingXP = UnitXPMax("player") - currentXP
    local timeToLevel
    if xpPerHour > 0 then
        local hours = remainingXP / xpPerHour
        if hours >= 1 then
            local h = math.floor(hours)
            local m = math.floor((hours - h) * 60)
            timeToLevel = string.format("%dh %dm", h, m)
        else
            local minutes = math.floor(hours * 60)
            timeToLevel = string.format("%d min", minutes)
        end
    else
        timeToLevel = "N/A"
    end
    self.lastTimeToLevel = timeToLevel

    return formattedXPPerHour, timeToLevel
end
-- Check exp function
function script_expChecker:targetLevels()
    if GetXPExhaustion() ~= nil then
        local restR = GetXPExhaustion()
    elseif GetXPExhaustion() == nil then
        local restR = 0
    end
    
    local restX = UnitXP("player")
    local restM = UnitXPMax("player")
    local localLevel = GetLocalPlayer():GetLevel()
    
    local baseXP = (GetLocalPlayer():GetLevel() * 5) + 45
    local baseRestXP = ((GetLocalPlayer():GetLevel() * 5) + 45) * 2
    
    local neededXP = restM - restX
    killsNeeded = math.floor(neededXP / baseXP)
    restedKillsNeeded = math.floor(neededXP / baseRestXP)

    local level = GetLocalPlayer():GetLevel()
    
    if level <= 7 then
        zeroDiff = 5
    elseif level >= 8 and level <= 9 then
        zeroDiff = 6
    elseif level >= 10 and level <= 11 then
        zeroDiff = 7
    elseif level >= 12 and level <= 15 then
        zeroDiff = 8
    elseif level >= 16 and level <= 19 then
        zeroDiff = 9
    elseif level >= 20 and level <= 29 then
        zeroDiff = 10
    elseif level >= 30 and level <= 39 then
        zeroDiff = 11
    elseif level >= 40 and level <= 44 then
        zeroDiff = 12
    elseif level >= 45 and level <= 49 then
        zeroDiff = 13
    elseif level >= 50 and level <= 54 then
        zeroDiff = 14
    elseif level >= 55 and level <= 59 then
        zeroDiff = 15
    elseif level >= 60 then
        zeroDiff = 16
    end

    if GetLocalPlayer():GetLevel() < 60 then 
        if script_grind.enemyObj ~= nil or _quest.enemyTarget ~= nil then

            targetObj = script_grind.enemyObj
		if _quest.enemyTarget ~= nil then
			targetObj = _quest.enemyTarget;
		end

            if GetXPExhaustion() ~= nil and targetObj ~= 0 and targetObj ~= nil then
                if GetLocalPlayer():GetLevel() == targetObj:GetLevel() then
                    if GetLocalPlayer():GetLevel() > 0 then
                        self.messageRest = ""..restedKillsNeeded.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 1 then
                    local XP = math.floor(baseRestXP * (1 - 1/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 2 then
                    local XP = math.floor(baseRestXP * (1 - 2/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 3 then
                    local XP = math.floor(baseRestXP * (1 - 3/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 4 then
                    local XP = math.floor(baseRestXP * (1 - 4/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 5 then
                    local XP = math.floor(baseRestXP * (1 - 5/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 6 then
                    local XP = math.floor(baseRestXP * (1 - 6/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 7 then
                    local XP = math.floor(baseRestXP * (1 - 7/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -1 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -2 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -3 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -4 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -5 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -6 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -7 then
                    local XP = math.floor(baseRestXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed rested kills at target level "..targetObj:GetLevel()
                    end
                end
            elseif GetXPExhaustion() == nil or restR == 0 and targetObj ~= nil and targetObj ~= 0 then
 		targetObj = script_grind.enemyObj
			if _quest.enemyTarget ~= nil then
				targetObj = _quest.enemyTarget;
			end
		if targetObj ~= 0 and targetObj ~= nil and targetObj:GetLevel() ~= nil then

                if GetLocalPlayer():GetLevel() == targetObj:GetLevel() then
                    if GetLocalPlayer():GetLevel() > 1 then
                        self.messageRest = ""..killsNeeded.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 1 then
                    local XP = math.floor(baseXP * (1 - 1/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 2 then
                    local XP = math.floor(baseXP * (1 - 2/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 3 then
                    local XP = math.floor(baseXP * (1 - 3/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 4 then
                    local XP = math.floor(baseXP * (1 - 4/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 5 then
                    local XP = math.floor(baseXP * (1 - 5/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 6 then
                    local XP = math.floor(baseXP * (1 - 6/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == 7 then
                    local XP = math.floor(baseXP * (1 - 7/zeroDiff))
                    if XP > 1 then
                        local lowXP = math.floor(neededXP / XP)
                        self.messageRest = ""..lowXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -1 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -2 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -3 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -4 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -5 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -6 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end
                elseif GetLocalPlayer():GetLevel() - targetObj:GetLevel() == -7 then
                    local XP = math.floor(baseXP * (1 + 0.05 * (targetObj:GetLevel() - GetLocalPlayer():GetLevel())))
                    if XP > 1 then
                        local highXP = math.floor(neededXP / XP)
                        self.messageRest = ""..highXP.." needed kills at target level "..targetObj:GetLevel()
                    end

		end
                end
            end
        end
    end
end

function script_expChecker:menu()
    if script_grind.useExpChecker and GetLocalPlayer():GetLevel() < 60 then
        local r, g, b = 0, 0, 0
        local y, x, width = 120, 25, 370
        local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition())
        if onScreen then
            y, x = tY-25, tX+75
        end

        if GetXPExhaustion() ~= nil then
            local restR = GetXPExhaustion()
        else
            local restR = 0
        end

        local restX = UnitXP("player")
        local restM = UnitXPMax("player")
        local localLevel = GetLocalPlayer():GetLevel()

        if GetXPExhaustion() ~= nil then
            local rest = math.ceil(20*GetXPExhaustion()/UnitXPMax("player"))
        end

        local baseXP = GetLocalPlayer():GetLevel() * 5 + 45
        local baseRestXP = (GetLocalPlayer():GetLevel() * 5 + 45) * 2
        local neededXP = restM - restX
        killsNeeded = math.floor(neededXP / baseXP)
        restedKillsNeeded = math.floor(neededXP / baseRestXP)

	if IsInCombat() then
        if GetXPExhaustion() ~= nil and script_grind.useExpChecker then
            DrawText('Rested kills needed - '..restedKillsNeeded, x-740, y, r+255, g+255, b+255)
            DrawText(' Killing level '..localLevel..' targets', x-750, y+20, r+255, g+255, b+255)
        elseif GetXPExhaustion() == nil or restR == 0 then
            if killsNeeded <= 1 then
                killsNeeded = 1
            end
            DrawText('Kills needed - '..killsNeeded, x-740, y, r+255, g+255, b+255)
            DrawText(' Killing level '..localLevel..' targets', x-750, y+20, r+255, g+255, b+255)
        end

        if GetXPExhaustion() ~= nil and script_grind.useExpChecker then
            DrawText('Rested Exp: '..GetXPExhaustion()..' - '..math.ceil(20*GetXPExhaustion()/UnitXPMax("player"))..' bubbles', x-740, y+60, r+255, g+255, b+255)
        end

        if script_grind.useExpChecker and GetXPExhaustion() ~= nil then
            DrawText(script_expChecker.messageRest or '', x-740, y+40, r+255, g+255, b+255)
        elseif script_grind.useExpChecker and GetXPExhaustion() == nil then
            DrawText(script_expChecker.messageRest or '', x-740, y+40, r+255, g+255, b+255)
        end
	end
        if script_grind.useExpChecker and GetXPExhaustion() == nil then
            local xpPerHour, timeToLevel = script_expChecker:calculateXPPerHour()
            DrawText('XP per hour: '..xpPerHour.." : ", x-740, y+60, r+255, g+255, b+255)
            DrawText('Time to level: '..timeToLevel, x-600, y+60, r+255, g+255, b+255)
        end
	if script_grind.useExpChecker and GetXPExhaustion() ~= nil then
            local xpPerHour, timeToLevel = script_expChecker:calculateXPPerHour()
            DrawText('XP per hour: '..xpPerHour.." : ", x-740, y+80, r+255, g+255, b+255)
            DrawText('Time to level: '..timeToLevel, x-600, y+80, r+255, g+255, b+255)
        end
    end
end