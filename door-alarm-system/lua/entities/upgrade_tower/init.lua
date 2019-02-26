AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.applyUpgrade = function(sat, alarm)
    local pos = alarm:GetPos()
	local ang = alarm:GetAngles()
	
	sat:SetPos(pos +ang:Forward() *8.2 +ang:Right() *-4.5 +ang:Up() *1.1)
	sat:SetAngles(ang)
	sat:SetParent(alarm)
	sat:SetModelScale(0.14)
	sat:SetModel("models/props_rooftop/satellitedish02.mdl")
	sat:PhysicsInit(SOLID_NONE)
end