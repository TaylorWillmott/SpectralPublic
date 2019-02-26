print( "SpectralRP Base has loaded.\n" )

local base = {
	
	base = true,
	
	govJobs = { 
				TEAM_MAYOR	= "Mayor",
				TEAM_SECRET	= "Secret Service",
				TEAM_SWATL	= "SWAT Leader",
				TEAM_SWATB	= "SWAT Bomb Disposal",
				TEAM_SWATM	= "SWAT Medic",
				TEAM_SWATD	= "SWAT Breacher",
				TEAM_SWATS	= "SWAT Sniper",
				TEAM_SWAT	= "SWAT",
				TEAM_CHIEF	= "Police Chief",
				TEAM_POLICE	= "Police",
				},
	
	wanted = function(criminal, cop, reason)
		if team.GetName(criminal:Team()) == "Staff On Duty" then return end
		
		local cjob = team.GetName(criminal:Team())
		for id, job in pairs(SpectralRP.govJobs) do
			if job == cjob then return end
		end
		
		criminal:setDarkRPVar("wanted", true)
		criminal:setDarkRPVar("wantedReason", reason)

		timer.Create(criminal:SteamID64() .. " wantedtimer", GAMEMODE.Config.wantedtime, 1, function()
			if not IsValid(criminal) then return end
			criminal:unWanted()
		end)

		local centerMessage = DarkRP.getPhrase("wanted_by_police", criminal:GetName(), reason, cop)
		local printMessage = DarkRP.getPhrase("wanted_by_police_print", cop, criminal:GetName(), reason)

		for _, ply in ipairs(player.GetAll()) do
			ply:PrintMessage(HUD_PRINTCENTER, centerMessage)
			ply:PrintMessage(HUD_PRINTCONSOLE, printMessage)
		end

		DarkRP.log(string.Replace(printMessage, "\n", " "), Color(0, 150, 255))
	end,
	
	errorMSG = function(ply, comp)
		if IsValid(ply) and ply:IsPlayer() then
			if comp and (comp > 0) then
				ply:ChatPrint("It seems an error occurred! Please take £"..comp.." as an apology and let the TheRandomnessGuy (Jim Pickens) know what happened so he can fix it!")
				ply:AddMoney(comp)
				print("SpectralRP Base - An error just occurred for "..ply:GetName().."! They were compensated £"..comp..".")
			else
				ply:ChatPrint("It seems an error occurred! Please let the TheRandomnessGuy (Jim Pickens) know what happened so he can fix it!")
				print("SpectralRP Base - An error just occurred for "..ply:GetName().."!")
			end
		end
	end,
	
};

SpectralRP = base
