grind2Logs = {

	log = {},
	log2 = {},
	logNum = 1,

}

function grind2Logs:window()

	if NewWindow("Bot Logs", 100, 100) then
	EndWindow();
		grind2Logs:showLog();

	end
end

function grind2Logs:sendLog(what, why)

	if why == nil then

		why = "No Reason";
	end
	if what == nil then
		what = "No Reason";
	end

	self.log[self.logNum] = what;
	self.log2[self.logNum] = why;
	self.logNum = self.logNum + 1;

end

function grind2Logs:showLog()
	
		for i = 0, self.logNum do
			local a = tostring(self.log[i]);
			local b = tostring(self.log2[i]);
			if a ~= "nil" and b ~= "nil" then
				Text(""..a.." - "..b)
			end
		end
end