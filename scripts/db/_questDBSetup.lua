_questDBSetup = {}

function _questDBSetup:menu()


	if (Button("List Quests")) then
		for i=0, _questDB.numQuests -1 do
			a = _questDB.questList[i]['questName'];
			b = _questDB.questList[i]['completed'];
			DEFAULT_CHAT_FRAME:AddMessage(""..a..", | Complete - "..b.."");
		end
	end

local a = "";
local b, c = 0, "", "";
local d, e, f = "", 0, 0;
-- mapID, minlevel, maxlevel
		local g, h, i = 0, 0, 0;
		--grind pos
		local j, k, l = 0, 0, 0;
		-- type, kill number, gather number
		local m, n, o = 0, 0, 0;
		-- return pos
		local p, q, r = 0, 0, 0;
		-- return target name, kill target 1, kill target 2
		local s, t, u = "", "", "";
		-- gather target 1, gather target 2, is completed
		local v, w, x = "", "", "";
		local y, aa, bb, cc = 0, 0, 0, 0;



		if _quest.currentQuest ~= nil then
		Text("_quest.currentQuest - ".._quest.currentQuest);
		else
		Text("_quest.currentQuest - NIL");
		end
		if _questDB.curListQuest ~= nil then
		Text("_questDB.curListQuest - ".._questDB.curListQuest);
		end
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
			--e = z['pos']['x'];
			--f = z['pos']['y'];
			--g = z['pos']['z'];
			h = z['mapID'];
			--i = z['minLevel'];
			--j = z['maxLevel'];
			--k = z['grindPos']['grindX']
			--l = z['grindPos']['grindY']
			--m = z['grindPos']['grindZ']
			n = z['type'];
			o = z['numKill'];
			p = z['numKill2'];
			q = z['numGather'];
			r = z['numGather2'];
			--s = z['returnPos']['returnX'];
			--t = z['returnPos']['returnY'];
			--u = z['returnPos']['returnZ'];
			v = z['returnTarget'];
			w = z['targetName'];
			x = z['targetName2'];
			y = z['gatherName'];
			aa = z['gatherName2'];
			bb = z['rewardNum'];
			cc = z['desc'];
			
		end
	end
	end
		
		 Text("Debug stuff");
SameLine();
		--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherName, gatherName2, rewardNum, desc)

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
		--Text("Grind Pos X");
		--Text(""..k.."");
		--Separator();
		--Text("Grind Pos Y");
		--Text(""..l.."");
		--Separator();
		--Text("Grind Pos Z");
		--Text(""..m.."");
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
		--Text(""..s.."");
		--Separator();
		--Text(""..t.."");
		--Separator();
		--Text(""..u.."");
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