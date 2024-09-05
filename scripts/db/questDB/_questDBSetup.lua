_questDBSetup = {}

function _questDBSetup:menu()

	Text("GetMyFaction "..GetMyFaction());
	if (Button("List Quests By My GetMapID()")) then
		for i=0, _questDB.numQuests -1 do
			if GetMapID() == _questDB.questList[i]['mapID'] then
			a = _questDB.questList[i]['questName'];
			b = _questDB.questList[i]['completed'];
			c = _questDB.questList[i]['minLevel'];
			d = _questDB.questList[i]['maxLevel'];
			DEFAULT_CHAT_FRAME:AddMessage(""..a..", | Complete - "..b..", | minLevel - "..c..", | maxLevel - "..d);
			end
		end
	end
local a = ""; local b, c = 0, "", ""; local d, e, f = "", 0, 0; local g, h, i = 0, 0, 0; local j, k, l = 0, 0, 0; local m, n, o = 0, 0, 0; local p, q, r = 0, 0, 0; local s, t, u = "", "", ""; local v, w, x = "", "", ""; local y, aa, bb, cc = 0, 0, 0, 0;
if _quest.currentQuest ~= nil then Text("Current quester quest to run"); Text("_quest.currentQuest - ".._quest.currentQuest); else Text("Current quester quest to run"); Text("_quest.currentQuest - NIL"); end if _quest.currentDesc ~= nil then Text("_quest.currentDesc - ".._quest.currentDesc); else Text("_quest.currentDesc - NIL"); end Text(""); Text("Current questDB quest being checked"); if _questDB.curListQuest ~= nil then Text("_questDB.curListQuest - ".._questDB.curListQuest); if _questDB.curDesc ~= nil then Text("_questDB.curDesc - ".._questDB.curDesc); else Text("_questDB.curDesc - NIL"); end end
			Text("");
		if _quest.isQuestComplete then
		Text("_quest.isQuestComplete - true");
		else
		Text("_quest.isQuestComplete - false");
		end

	if _questDB.curListQuest ~= nil and _questDB.numQuests ~= 0 and _questDB.numQuests ~= nil then
	for i=0, _questDB.numQuests -1 do
		if _questDB.questList[i]['questName'] == _questDB.curListQuest then

			z = _questDB.questList[i]
			a = z['completed'];
			b = z['faction'];
			c = z['questName'];
			d = z['giverName'];
		
			h = z['mapID'];
		
			n = z['type'];
			o = z['numKill'];
			p = z['numKill2'];
			q = z['numGather'];
			r = z['numGather2'];

			v = z['returnTarget'];
			w = z['targetName'];
			x = z['targetName2'];
			y = z['gatherID'];
			aa = z['gatherID2'];
			bb = z['rewardNum'];
			cc = z['desc'];
			
		end
	end
	end
		Text("");
		
		 Text("Debug stuff");
		Separator();
		Text("Completed Status");
		Text(""..a.."");
		Separator();
		Text("Faction 0 - Alliance. Faction 1 - Horde");
		Text(""..b.."");
		Separator();
		Text("Quest Name In Quest Log");
		Text(""..c.."");
		Separator();
		Text("Quest Giver Name");
		Text(""..d.."");
		--Separator();
		--Text("Quest Giver Pos X");
		--Text(""..e.."");
		--Separator();
		--Text("Quest Giver Pos Y");
		--Text(""..f.."");
		--Separator();
		--Text("Quest Giver Pos Z");
		--Text(""..g.."");
		Separator();
		Text("Quest MapID");
		Text(""..h.."");
		Separator();
		Text("minLevel")
		Text(""..i.."");
		Separator();
		Text("maxLevel");
		Text(""..j.."");
		Separator();
	
		Separator();
		Text("Type");
		Text(""..n.."");
		Separator();
		Text("Kill Number");
		Text(""..o.."");
		Separator();
		Text("Gather Number");
		Text(""..p.."");
		Separator();
		Text(""..q.."");
		Separator();
		Text(""..r.."");
		Separator();
	
		Separator();
		Text(""..v.."");
		Separator();
		Text(""..w.."");
		Separator();
		Text(""..x.."");
		Separator();
		Text(""..y.."");
		Separator();
		Text(""..aa.."");
		Separator();
		Text(""..bb.."");
		Separator();
		if cc ~= nil then
		Text(""..cc.."");
		end
	
end