_questDBSetup = {}

function _questDBSetup:menu()

	Text("GetMyFaction "..GetMyFaction());
	if (Button("List Quests By My GetMapID() and GetLevel()")) then
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

local a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, aa, bb, cc, dd, ee, ff, gg = "", 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", "", "", "", 0, 0, 0, "", "", 0;

	if _questDB.curListQuest ~= nil and _questDB.numQuests ~= 0 and _questDB.numQuests ~= nil then
	for i=0, _questDB.numQuests -1 do
		if _questDB.questList[i]['questName'] == _questDB.curListQuest then

	z = _questDB.questList[i]

	--a = z['completed']; b = z['faction']; c = z['questName']; d = z['giverName'];

	--e = z['pos']['posX']; f = z['pos']['posY']; g = z['pos']['posZ'];
	
	--h = z['mapID']; i = z['minLevel']; j = z['maxLevel'];

	--k = z['grindPos']['grindX']; l = z['grindPos']['grindY']; m = z['grindPos']['grindZ'];

	--n = z['type']; o = z['numKill']; p = z['numKill2']; q = z['numKill2']; r = z['numGather'];
	
	--s = z['numGather2'];
	
	--t = z['returnPos']['returnX']; u = z['returnPos']['returnY']; v = z['returnPos']['returnZ'];

	--w = z['returnTarget']; x = z['targetName'];

	--y = z['targetName2']; aa = z['targetName3']; bb = z['gatherID']; cc = z['gatherID2'];

	--dd = z['rewardNum']; ee = z['desc']; ff = z['useItem']; gg = z['gossipOption'];


	end
	end
	end
		Text("");
		
		 Text("Debug stuff");

		Separator();
		Text("Completed Status"); Text(""..a..""); Separator();

		Text("Faction 0 - Alliance. Faction 1 - Horde"); Text(""..b..""); Separator();

		Text("Quest Name In Quest Log"); Text(""..c..""); Separator();

		Text("Quest Giver Name"); Text(""..d..""); Separator();

		--Text("QuestGiver Pos X"); if e ~= nil then Text(""..e..""); end Separator();

		--Text("Quest Giver Pos Y"); if f ~= nil then Text(""..f..""); end Separator();
		
		--Text("Quest Giver Pos Z"); if g ~= nil then Text(""..g..""); end Separator();

		Text("Quest MapID"); Text(""..h..""); Separator();

		Text("minLevel") Text(""..i..""); Separator();
		
		Text("maxLevel"); Text(""..j..""); Separator();
	
		--Text("Grind Pos X"); Text(""..k..""); Separator();
		
		--Text("Grind Pos Y"); Text(""..l..""); Separator();

		--Text("Grind Pos Z"); Text(""..m..""); Separator();
	
		Text("Type"); Text(""..n..""); Separator();
		
		Text("Kill Number1"); Text(""..o..""); Separator();

		Text("Kill Number2"); Text(""..p..""); Separator();

		Text("Kill Number3"); Text(""..q..""); Separator();

		Text("Gather Number"); Text(""..r..""); Separator();
		
		Text("Gather Number2"); Text(""..s..""); Separator();

		--Text("Return Target X"); if t ~= nil then Text(""..t..""); end Separator();

		--Text("Return Target Y"); if u ~= nil then Text(""..u..""); end Separator();

		--Text("Return Target Z"); if v ~= nil then Text(""..v..""); end Separator();
	
		Text("Return Target Name"); Text(""..w..""); Separator();

		Text("Target Name"); Text(""..x..""); Separator();

		Text("Target Name2"); Text(""..y..""); Separator();

		Text("TargetName3"); Text(""..aa..""); Separator();
		
		Text("Gather ID"); Text(""..bb..""); Separator();

		Text("Gather ID2"); Text(""..cc..""); Separator();
	
		Text("Description"); Text(""..dd..""); Separator();

		Text("Reward Number"); Text(""..ee..""); Separator();

		Text("Use Item"); Text(""..ff..""); Separator();
		
		Text("GossipOption"); Text(""..gg..""); Separator();
	
end