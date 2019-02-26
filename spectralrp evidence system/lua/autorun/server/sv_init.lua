include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

print("SpectralRP Evidence System - Main sv_init.lua has been loaded.")

CreateConVar("srp_evidence_enabled", 0, FCVAR_NONE, "Enable/disable custom evidence system.")

hook.Add( "PlayerDeath", "srp_evidence_playerdeath", function ( victim, cause, attacker )
	if GetConVar("srp_evidence_enabled"):GetBool() then
		if SERVER then print("evidenceScript: PlayerDeath hook is running.") end
		if ( IsValid(attacker) and attacker:IsPlayer() ) then
			local evidence = ents.Create("srp_evidence")
			if !IsValid(evidence) then return end
			evidence:SetPos( victim:GetPos() )
			evidence.murderer = attacker
			evidence.victim = victim
			--evidence:DropToFloor()
			evidence:Spawn()
		end
	end
end)

print("SpectralRP Evidence System - Main sv_init.lua has finished running.")
