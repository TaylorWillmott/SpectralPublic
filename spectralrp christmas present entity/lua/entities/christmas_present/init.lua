AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_init.lua')
include('shared.lua')

function ENT:Initialize()

	--self:SetModel("models/griim/christmas/present_colourable.mdl")
	self:SetModel("models/items/cs_gift.mdl")
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then phys:Wake()
	else self:PhysicsInit(SOLID_OBB) end
	
end

function ENT:Use(act, ply)
	if IsValid(ply) and ply:IsPlayer() then
		moneyReward = math.random(0,4)
		if moneyReward == 0 then
			rewardTier = math.random(0,10000)
			
			if rewardTier < 500 then 				-- Legendary
				reward = math.random(50000, 100000)
			elseif rewardTier < 2000 then 			-- Epic
				reward = math.random(25000, 50000)
			elseif rewardTier < 5000 then 			-- Rare
				reward = math.random(10000, 25000)
			else 									-- Common
				reward = math.random(5000, 10000)
			end
			
			oldPos = self:GetPos()
			oldAngles = self:GetAngles()
			
			self:Remove()
			
			sound.Play( "garrysmod/save_load1.wav", oldPos )
			
			reward = rewardTable[math.random( 1, #rewardTable )]
			
			if (spawnRPMoney( reward, oldPos ) == true) then
				ply:ChatPrint("You opened a present and got £"..reward.."!")
			else
				SpectralRP.errorMSG(ply, 10000)
			end
			
		else
			rewardTier = math.random(0,10000)
		
			if rewardTier < 500 then 			-- Legendary Rewards
				rarity = "a legendary"
				rewardTable = {
								{"tfa_csgo_awp", "models/weapons/tfa_csgo/w_awp.mdl"},
								{"tfa_csgo_awp", "models/weapons/tfa_csgo/w_awp.mdl"}
				}
			elseif rewardTier < 2000 then 		-- Epic Rewards
				rarity = "an epic"
				rewardTable = {
								{"tfa_csgo_m4a4", "models/weapons/tfa_csgo/w_m4a4.mdl"},
								{"tfa_csgo_m4a4", "models/weapons/tfa_csgo/w_m4a4.mdl"}
				}
			elseif rewardTier < 5000 then 		-- Rare Rewards
				rarity = "a rare"
				rewardTable = {
								{"tfa_csgo_deagle", "models/weapons/tfa_csgo/w_deagle.mdl"},
								{"tfa_csgo_deagle", "models/weapons/tfa_csgo/w_deagle.mdl"}
				}
			else 								-- Common Rewards
				rarity = "a common"
				rewardTable = {
								{"tfa_csgo_usp", "models/weapons/tfa_csgo/w_usp.mdl"},
								{"tfa_csgo_usp", "models/weapons/tfa_csgo/w_usp.mdl"}
							}
			end
			
			oldPos = self:GetPos()
			oldAngles = self:GetAngles()
			
			self:Remove()
			
			sound.Play( "garrysmod/save_load1.wav", oldPos )
			
			reward = rewardTable[math.random( 1, #rewardTable )]

			if ( spawnRPWep( reward[1], reward[2], oldAngles, oldPos ) == true ) then
				ply:ChatPrint("You opened a present and got "..rarity.." gift!")
			else
				SpectralRP.errorMSG(ply, 10000)
			end
			
		end
		
		if (self.randomSpawn = true) then hook.Run("presentClaimed") end
		
	end

end

function spawnRPWep(class, model, angles, pos)
	pos.z = pos.z + 10
	angles.r = angles.r + 90

	local weapon = ents.Create("spawned_weapon")
	if IsValid(money) then
		weapon:SetWeaponClass(class)
		weapon:SetModel(model)
		weapon:SetPos(pos)
		weapon:SetAngles(angles)
		weapon.nodupe = true
		weapon.ammoadd = 50
		weapon:Spawn()
	else
		print("ERROR: Christmas Event - Present failed to spawn reward entity.")
		return false
	end
	return true
end