if SERVER then
	print("Evidence File has loaded")

	include("entities/srp_evidence/shared.lua")
	include("entities/srp_evidence/init.lua")
	AddCSLuaFile("entities/srp_evidence/shared.lua")
	AddCSLuaFile("entities/srp_evidence/cl_init.lua")

	CreateConVar("srp_evidence_enabled", 0, FCVAR_NONE, "Enable/disable custom evidence system.")

	hook.Add( "PlayerDeath", "srp_evidence_playerdeath", function ( victim, cause, attacker )
		if GetConVar("srp_evidence_enabled"):GetBool() then
			if SERVER then print("SpectralRP Evidence System - PlayerDeath hook is running.") end
			if ( IsValid(attacker) and attacker:IsPlayer() ) then
				local evidence = ents.Create("srp_evidence")
				if IsValid(evidence) then
					evidence:SetPos( victim:GetPos() )
					evidence.murderer = attacker
					evidence.victim = victim
					--evidence:DropToFloor()
					evidence:Spawn()
				end
			end
		end
	end)

	print("SpectralRP Evidence System has loaded.")
	
else
	include("entities/srp_evidence/shared.lua")
	include("entities/srp_evidence/cl_init.lua")
end