AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.applyUpgrade = function(ar, alarm)
	alarm:SetMaxHealth(alarm:GetMaxHealth() +alarm_system.settings.health.armor)
	alarm:SetHealth(alarm:GetMaxHealth())
	
	ar:Remove() --no visual representation so let's remove it...
end