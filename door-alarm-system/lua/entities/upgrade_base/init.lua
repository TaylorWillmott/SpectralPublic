AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_junk/cardboard_box004a.mdl")
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(SOLID_VPHYSICS)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	    phys:Wake()
	end
end

function ENT:StartTouch(ent)
    local alarm = ent
	
	if ent.actAlarm then
	    alarm = ent.actAlarm
	end
	
	if alarm:GetClass() == "door_alarm" then
	    if not table.HasValue(alarm.alarmUpgrades, self:GetClass()) then
            self:EmitSound("npc/dog/dog_servo12.wav")
		    self.applyUpgrade(self, alarm)
		
		    table.insert(alarm.alarmUpgrades, self:GetClass())
		end
	end
end