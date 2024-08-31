_questDBSetup = {}

function _questDBSetup:menu()
		-- faction, quest name, quest giver name
		local a, b, c = 0, "", "";
		-- quest giver pos
		local d, e, f = 0, 0, 0;
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
		Text("Faction 0 - Alliance. Faction 1 - Horde");
		a = InputText("Faction", a);
		Text("Quest Name In Quest Log");
		b = InputText("Quest Name", b);
		Text("Quest Giver Name");
		c = InputText("Quest Giver Name", c);
		Text("Quest Giver Pos X");
		d = InputText("Quest Giver Pos X", d);
		Text("Quest Giver Pos Y");
		e = InputText("Quest Giver Pos Y", e);
		Text("Quest Giver Pos Z");
		f = InputText("Quest Giver Pos Z", f);
		Text("Quest MapID");
		g = InputText("MapID", g);
		h = InputText("MinLevel", h);
		i = InputText("MaxLevel", i);
		j = InputText("Grind Pos X", j);
		k = InputText("Grind Pos Y", k);
		l = InputText("Grind Pos Z", l);
		m = InputText("Type", m);
		n = InputText("Kill Number", n);
		o = InputText("Gather Number", o);
		p = InputText("Return Pos X", p);
		q = InputText("Return Pos Y", q);
		r = InputText("Return Pos Z", r);
		s = InputText("Return Name", s);
		t = InputText("Kill Target 1", t);
		u = InputText("Kill Target 2", u);
		v = InputText("Gather Target 1", v);
		w = InputText("Gather Target 2", w);
		x = InputText("Is Completed", x);
end