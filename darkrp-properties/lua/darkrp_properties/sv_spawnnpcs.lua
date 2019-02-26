function spawnPropertiesNPCs()
	for k,v in pairs(Properties.NPCSpawns) do
		print("[Properties] Spawning NPC "..tostring(k).." '"..v["name"].."'.\n")
		local npc = ents.Create("npc_properties")
		npc:SetPos( v.pos + Vector(0, 0, 10) ) 
		npc:SetAngles(v.angle)
		npc:SetModel(v.model)
		npc:Spawn()
		npc:DropToFloor()
		npc.ID = k
		if npc:IsValid() then
			print("[Properties] NPC '"..v["name"].."' was spawned successfully at "..tostring(npc:GetPos())..".\n")
		else
			print("[Properties] Something went wrong. NPC is not valid.")
		end
	end
end

hook.Add( "InitPostEntity", "propertiesNPCS", function()
	for k,v in pairs(Properties.NPCSpawns) do
		print("[Properties] Spawning NPC "..tostring(k).." '"..v["name"].."'.\n")
		local npc = ents.Create("npc_properties")
		npc:SetPos( v["pos"] + Vector(0, 0, 10) ) 
		npc:SetAngles(v["angle"])
		npc:SetModel(v["model"])
		npc:Spawn()
		npc:DropToFloor()
		npc.ID = k
		if npc:IsValid() then
			print("[Properties] NPC '"..v["name"].."' was spawned successfully at "..tostring(npc:GetPos())..".\n")
		else
			print("[Properties] Something went wrong. NPC is not valid.")
		end
	end
	end)

--[[Taken from TCB Car Dealer Spawn Code

function Properties.spawnNPCs()
	for k,v in pairs(Properties.NPCSpawns) do
		print("[Properties] Spawning NPC "..tostring(k).." '"..v["name"].."'.\n")
		local npc = ents.Create("npc_properties")
		npc:SetPos(v.pos + Vector(0, 0, 10))
		npc:SetAngles(v.angle)
		npc:SetModel(v.model)
		npc:SetHullType(HULL_HUMAN)
		npc:SetHullSizeNormal()
		npc:SetNPCState(NPC_STATE_SCRIPT)
		npc:SetSolid(SOLID_BBOX)
		npc:CapabilitiesAdd(bit.bor(CAP_ANIMATEDFACE, CAP_TURN_HEAD))
		npc:SetUseType(SIMPLE_USE)
		npc:Spawn()
		npc:DropToFloor()
		npc.id = k
		if npc:IsValid() then
			print("[Properties] NPC "..v["name"].." was spawned successfully at"..tostring(npc:GetPos())..".\n")
		else
			print("[Properties] Something went wrong. NPC is not valid.")
		end
	end
end

hook.Add("InitPostEntity", "Properties.spawnNPCs", Properties.spawnNPCs)]]
