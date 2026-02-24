-- maybe the grinder and quester can be cobbled together with a pather to go from area to area instead of forcing it all into one single enviornment

-- if I'm a night elf hunter then after I complete the starter quests I need to walk to dolanaar.

-- switch to this script and move to dolanaar - pause the quester....

-- would need to make a table of pathing points that are "roads" and run the table and navigate through the points

-- then can unpause the quester... maybe even do some vendor checks and mail??? - get minimap text for each zone to check?

-- but the idea is when the quester runs out of viable quests to do maybe it can run the grinder until a better level is reached

-- when level is reached, switch back here and run the path to darnassus?

-- believe PersistLoadingScreen() does not work properly, or maybe I'm using it wrong... no documention on it..
-- would probably get stuck on other side of portal...

-- would work better for other races, of course. can probably get a tauren to read item ID of the lifts and walk on/off them into TB

-- might even be prudent to seperate the scripts into sections like 1-6 and 6-10 and so on


-- need to check by race and/or zone

-- i need to specify breaks in the quester for this to work. tick a variable to true, or whatever, when a set of quests are complete?
if PlayerLevel() >= 6 and some quest is complete and not self.dolanaarReached?? then
													-- if not pather script says dolanaar reached
	run to dolanaar

elseif PlayerLevel() < 6 and some quest is complete then

	run grinder until level reached...
	pause quester

elseif PlayerLevel() < 6 then

	run quester
end


-- i need to make a script designating roads... this will help the quester significantly... and flight paths

