ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Door Alarm"
ENT.Author = "n00bmobile"
ENT.Category = "n00bmobile"
ENT.Spawnable = true
ENT.AdminSpawnable = true

hook.Add("GravGunPickupAllowed", "alarm_disable_pickup", function(ply, ent)
	if ent:GetClass() == "door_alarm" and ent:GetParent():IsValid() then
		return false
	end
end)

hook.Add("PhysgunPickup", "alarm_disable_pickup", function(ply, ent)
    if ent:GetClass() == "door_alarm" and ent:GetParent():IsValid() then
		return false
	end
end)

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
end