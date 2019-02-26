AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_init.lua')
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/Gibs/HGIBS.mdl")
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(SOLID_VPHYSICS)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	    phys:Wake()
	end
end

function ENT:Use(act, ply)
	if IsValid(caller) and caller:IsPlayer() then
		if IsValid(self.murderer) and self.murderer:IsPlayer() then
			if IsValid(self.victim) and self.victim:IsPlayer() then
				murderer:wanted(caller, "Murdering "..self.victim:GetName()..".")
			else
				murderer:wanted(caller, "Murdering somebody.")
			end
		else
			ply:PrintMessage(HUD_PRINTTALK, "The murderer is no longer around.")
			self:Remove()
		end
	end
end