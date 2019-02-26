AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.applyUpgrade = function(ar, alarm)
	ar:Remove()
end