grind2Paranoia = {

	timer = 0,

	paranoidTime = 60

}

function grind2Paranoia:checkAndDoParanoia()

	if grind2Paranoia:checkForPlayersNearby(range) then
	
		-- start the timer?

		-- someone around? run bot at normal speed

		-- someone around for too long, run bot slower
		if currentTime > self.paranoidTime * 1000 then

			grind2Paranoia:setSpeedSlow()

		end

		-- someone around for too long, pause
		if currentTime > (self.paranoidTime * 2) * 1000 then

		end

		-- someone around for waaaay too long, logout...
		if currentTime > (self.paranoidTime * 3) * 1000 then

		end

	return true;
	end


return false;
end

function grind2Paranoia:checkForPlayersNearby(range)

end

function grind2Paranoia:setSpeedNormal()

end

function grind2Paranoia:setSpeedFast()

	keep combat script atleast 200ms

end

function grind2Paranoia:setSpeedSlow()

end

keep a timer just to free up resources. checking every few seconds would work


change bot speeds / reaction times if people are close, otherwise run bot pretty fast

	slow down increimentally until bot is stopped by players in range

		bot reaction speed at least 500ms

	really slow down new target time

		2500 - 5000ms

	really slow down wait after target killed time

		3000 - 6000ms

logout if someone is around for too long


pause bot if someone is around for too long

	--don't actually pause, just return
	stealth / shadowmeld
