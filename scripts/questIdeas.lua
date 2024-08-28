table requires -
quest giver name
quest giver position
quest giver faction
quest giver mapID
quest giver quest names
quest level ranges acceptable to bot in
quest area to 'grind' or pick items


we can call different functions within a run() function
call the table then move to questgiver
call the table then get the quest from questgiver
call the table then move to quest area
run wow-api to check for quest completion (kills / items needed)
call the table to move back to target
call the table to check next quest



--------------------------------

look up quest

	need to make some sort of table or port a database

	--I can make my own but many servers do not allow quest query functions to be ran on their servers....
	--so may be best to sort of 'hard code' the quests needed to complete to achieve a somewhat functioning bot BASED ON GetMapID() and GetFaction()
	-- leave the names of quests in a viewable table to click on in the UI (drop down menu) and 'remove' them from the bot questing cycle
	-- only show quests that are above x level in the UI table


get quest needed to go to questgiver

	need to make some sort of table or port a database

	-- lookup table based on GetMapID() and GetFaction() and compare with 'wanted' quests in the UI table (drop down menu)
	-- if we have completed a quest then the way for the bot to understand that is the remove it from the drop down UI menu
	-- we can mitigate how many quests are being shown by sorting the table by level. example... don't show level 10 quests at level 15...
	-- alternatively we can show each quest area (in levels of 10 based on faction) in their each own drop down clickable menu...

move to questgiver

	-- need to know name of target and position

	if current questgiver ~= nil then
	move to target
	if close to target then 
	stop moving

	-- need to know what quests we are obtaining or accepting
	target questgiver
	accept quest


move to grind area

	-- go to specific position to grind based on what quest we are on
	if current quest text == what I need for this area then
	move to area

	-- run object manager to 'grind' these targets
	target using object manager by name?
	grind in that area based on target names or GUID whatever being used
	if items needed then use gatherer style object manager and collect based on name or GUID or whatever being used

check inventory / quest status
		
	-- for killing style quests we can track them with an in-game api
	keep checking quest status or items needed

	-- using check invetory using itemlink%
	either inventory links or by quest api

move to quest giver

	-- need to know name of target and position

	if current questgiver ~= nil then
	move to target
	if close to target then 
	stop moving

	-- need to know what quests we are obtaining or accepting
	target questgiver
	return quest


look up next quest

	need a database or something to know what quests to get