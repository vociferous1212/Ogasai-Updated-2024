_questDBSetup = {}

function _questDBSetup:menu()
local a = "";
local b, c = 0, "", "";
local d, e, f = "", 0, 0;

	if _questDB.curListQuest ~= nil and _questDB.numQuests ~= 0 and _questDB.numQuests ~= nil then
	for i=0, _questDB.numQuests -1 do
		if _questDB.questList[i]['questName'] == _questDB.curListQuest then
			z = _questDB.questList[i]
			a = z['completed'];
			b = z['faction'];
			c = z['questName'];
			d = z['giverName'];
		end
	end
	end
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
		 Text("Debug stuff");
SameLine();
		if (Button("Add To DB")) then 
			--ToFile(
			--db:add(
		end
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
		Text("Quest Giver Pos X");
		e = InputText("Quest Giver Pos X", d);
		Text("Quest Giver Pos Y");
		f = InputText("Quest Giver Pos Y", e);
		Text("Quest Giver Pos Z");
		g = InputText("Quest Giver Pos Z", f);
			Text("Quest MapID");
		h = InputText("MapID", g);
		i = InputText("MinLevel", h);
		j = InputText("MaxLevel", i);
		k = InputText("Grind Pos X", j);
		l = InputText("Grind Pos Y", k);
		m = InputText("Grind Pos Z", l);
		n = InputText("Type", m);
		o = InputText("Kill Number", n);
		p = InputText("Gather Number", o);
		q = InputText("Return Pos X", p);
		r = InputText("Return Pos Y", q);
		s = InputText("Return Pos Z", r);
		t = InputText("Return Name", s);
		u = InputText("Kill Target 1", t);
		v = InputText("Kill Target 2", u);
		w = InputText("Gather Target 1", v);
		x = InputText("Gather Target 2", w);
end