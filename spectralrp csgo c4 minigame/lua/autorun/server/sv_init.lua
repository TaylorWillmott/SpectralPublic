hook.Add("C4Planted", "SpectralC4Plant", function() -- Called when a C4 is planted (duh).
	RunConsoleCommand("ulx", "csay", ("Someone has planted a C4 Explosive!"))
end)


hook.Add("C4Detonated", "SpectralC4Detonate", function() --Called at end of C4 entity's ENT:Explode() function.
	print("DEBUG: Terrorists win. Beginning payout to terrorist roles.\n")
	
	local bombCost = 100000
	local ePlayers = 0
	
	for job, name in pairs(SpectralRP.govJobs) do
		ePlayers = ePlayers + #team.GetPlayers(job)
	end
	
	if ePlayers > 4 then
		local reward = ePlayers * 1000
		RunConsoleCommand("ulx", "csay", ("The C4 has detonated. The terrorists win and receive a bonus of £"..reward.." each."))
		print("SpectralRP C4 Minigame - Terrorists win. Giving £"..reward.." to each winning player.\n")
		
		for _, ply in pairs(player.GetHumans()) do -- Check all player's teams to see if they are Ts.
			local pjob = team.GetName( ply:Team() )
			if pjob == "Terrorist Leader" then
				ply:AddMoney(reward)
			elseif pjob == "Terrorist" then
				ply:AddMoney(reward + bombCost)
			end
		end
		
	else -- C4 detonates but there are not enough enemies to trigger the reward.
		print("SpectralRP C4 Minigame - Terrorists win but not enough enemies for reward.\n")
		if ePlayers > 2 then
			for k, ply in pairs(player.GetHumans()) do
				local pjob = team.GetName( ply:Team() )
				if pjob == "Terrorist Leader" then
					ply:AddMoney(bombCost)
					ply:ChatPrint("You have been refunded the cost of your C4.")
					print("SpectralRP C4 Minigame - Refunding C4 cost to Terrorist Leader ('"..ply:GetName().."').\n")
					break
				end
			end
		end
		RunConsoleCommand("ulx", "csay", ("The C4 has detonated. The terrorists win but do not receive a reward as there are too few enemies."))
	end
end)


hook.Add("C4Defused", "SpectralC4Defuse", function() 
	print("SpectralRP C4 Minigame - Government wins. Beginning payout to government roles.\n")
	
	reward = 1000 + (#team.GetPlayers(TEAM_TERRORIST) * 1000)
	RunConsoleCommand("ulx", "csay", ("The C4 has been defused. The government wins and receives a bonus of £"..reward.." each."))
	print("SpectralRP C4 Minigame - Government wins. Giving £"..tostring(reward).." to each winning player.\n")
	
	for _, ply in pairs( player.GetHumans() ) do
		local pjob = team.GetName( ply:Team() )
		for id, job in pairs(SpectralRP.govJobs) do
			if job == pjob then
				ply:AddMoney(reward)
				break
			end
		end
	end
end)