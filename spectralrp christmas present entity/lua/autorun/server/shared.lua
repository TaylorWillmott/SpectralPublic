include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
print("Christmas Event - Present Entity Loaded")

locations = {
			Vector(0, 0, 0),
			Vector(0, 0, 0),
			Vector(0, 0, 0),
			}

CreateConVar( "srp_random_presents", 0, FCVAR_NONE,
			  "Toggle whether presents should spawn randomly around the map.")

CreateConVar( "srp_present_delay", 300, FCVAR_NONE,
			  "Set how long after a present is opened the next one should spawn in seconds.")

hook.add("presentClaimed", "presentClaimed_startTimer", function()
	if GetConVar("srp_random_presents"):GetBool() == true then
		timer.Simple( GetConVar("srp_present_delay"):GetInt(), function()
			local location = locations[math.random(1,#locations)]
			present = ents.create("christmas_present")
			if IsValid(present) then
				present:SetPos(location)
				present.randomSpawn = true
				present:Spawn()
			else
				print("Christmas Event: An error occurred in present spawning script.")
			end
		end)
	end
end)

print("Christmas Event - Random Present Spawn Script Loaded")