print( "SpectralRP Base has loaded.\n" )

local base = {
	
	base = true,
	
	-- If you want Government Job detection to work properly, you'll need to edit this to match your jobs.lua configuration.
	-- If not, remove all the entries for consistent behavior and better performance (essentially, replace it with 'govJobs = {},').
	-- Do NOT delete/comment out the list entirely. If it is not present, other code that relies on it may break.
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
		-- Prevents on-duty staff from being wanted (only by this version of the command; /wanted will still work).
		-- Change "Staff On Duty" to match your staff role's name or comment out the line if you don't want/need this functionality.
		if team.GetName(criminal:Team()) == "Staff On Duty" then return end
		-- If you have multiple Staff (or other) jobs you wish to protect from this function, copy this if statement for each one. For example:
		-- if team.GetName(criminal:Team()) == "Your Job Name Here" then return end
		
		-- Prevents players with government jobs from being wanted (by this version of the command).
		-- Comment this out if you don't want them to be protected or if you have emptied the govJobs list above.
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
	
	-- This function handles errors in my addons (and any others chat choose to use it) and compensation automatically.
	-- If you wish to use this for yourself, simply add 'SpectralRP.errorMSG(PLAYER, COMPENSATION)' to your code where an error has occurred.
	-- PLAYER must be a valid player object and COMPENSATION is an optional integer.
	-- The messages can be changed to whatever you feel would best fit your server but keep in mind only the ChatPrint lines will be shown to the player; the print lines are instead displayed in the server console.
	errorMSG = function(ply, comp)
		if IsValid(ply) and ply:IsPlayer() then
			if comp and (comp > 0) then
				ply:ChatPrint("It seems an error occurred! Please take £"..comp.." as an apology and let a member of staff know what happened!")
				ply:AddMoney(comp)
				print("SpectralRP Base - An error just occurred for "..ply:GetName().."! They were compensated £"..comp..".")
			else
				ply:ChatPrint("It seems an error occurred! Please let a member of staff know what happened!")
				print("SpectralRP Base - An error just occurred for "..ply:GetName().."!")
			end
		end
	end,
	
	spawnRPMoney = function(amount, pos)
		local money = ents.Create("spawned_money")
		if IsValid(money) then
			money:SetPos(pos)
			money:Setamount(amount)
			money:Spawn()
		else
			print("ERROR: SpectralRP Base - Failed to initialize 'spawned_money' entity.")
			return false
		end
		return true
	end,
	
	-- Since most servers won't want the snowScript on most of the time I've left it commented out by default.
	-- If you want to enable it, simply uncomment the function below as well as the marked  CreateConVar and hook.Add lines at the bottom of this file.
	
	--UNCOMMENT THIS FOR ENABLING snowScript
	--snowScript = function()
	--	if GetConVar("srp_constant_snow"):GetBool() then
	--		print("snowScript: Hook Running\n")
	--		if AtmosGlobal.GetStorming( AtmosGlobal ) then AtmosGlobal.StopStorm( AtmosGlobal ) end
	--		AtmosGlobal.StartSnow( AtmosGlobal )
	--	end
	--end
	
};

SpectralRP = base

-- ConVars --
--CreateConVar("srp_constant_snow", 0, FCVAR_NONE, "Enable/disable constant snow.") -- UNCOMMENT THIS FOR ENABLING snowScript

-- Hooks --
--hook.Add( "PlayerSpawn","snowCheck", SpectralRP.snowScript ) -- UNCOMMENT THIS FOR ENABLING snowScript