SWEP.PrintName = "Alarm Hacker"
SWEP.Author = "n00bmobile"
SWEP.Contact = "n00bmobile.lua@gmail.com"
SWEP.Instructions = "Left-Click on an Alarm to hack it."
SWEP.Purpose = "Open a door protected by an Alarm without triggering it."

SWEP.Category = "n00bmobile"

SWEP.AdminSpawnable = true
SWEP.Spawnable = true

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true

SWEP.ViewModelFOV = 75
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_c4.mdl"
SWEP.WorldModel = "models/weapons/w_c4.mdl"

function SWEP:PrimaryAttack()
    if CLIENT then return end
	
	local ent = self.Owner:GetEyeTrace().Entity
	
	if not self.isHacking and ent:GetClass() == "door_alarm" and ent:GetParent():IsValid() and ent:GetNWString("alarm_status") == "Online" and ent:GetPos():Distance(self.Owner:GetPos()) < 75 then
	    local password = {"*", "*", "*", "*", "*", "*", "*"}
		
		ent.hackSound = CreateSound(ent, "ambient/energy/electric_loop.wav")
		ent.hackSound:Play()
	    
		ent:SetNWFloat("alarm_hacking_progress", 0.1)
		
		self:SetNWString("alarm_hacking", "*******")
		self.isHacking = ent
		
		timer.Create("alarm_hacking_"..self:EntIndex(), alarm_system.settings.decode, #password, function()
		    for k, v in pairs(password) do
				if v == "*" then
					ent.hackSound:ChangePitch(100 +(8 *k))
					ent:SetNWFloat("alarm_hacking_progress", k)
					
					password[k] = math.random(1, 9)
					
			        if k == #password then
						self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
						self:SetNextPrimaryFire(CurTime() +3.5)
						self:EmitSound("buttons/bell1.wav")
						
						timer.Simple(3, function()
						    if not self:IsValid() or not self.isHacking then return end
							
							ent:EmitSound("weapons/stunstick/alyx_stunner1.wav")
				            ent:SetNWString("alarm_status", "")
							ent:SetNWFloat("alarm_hacking_progress", 0)

						    --open door
						    ent:GetParent():keysUnLock()
                            ent:GetParent():Fire("Open", "", 1)
                            
							ent.hackSound:Stop()
							ent.hackSound = nil
							
							self:SetNWString("alarm_hacking", "")
							self:SendWeaponAnim(ACT_VM_IDLE)
						    self.isHacking = nil
						
				            local pos = ent:GetPos()
                            local effect = EffectData()
            
			                effect:SetOrigin(pos)
                            util.Effect("ManhackSparks", effect)
						end)
					else
					    if math.random(1, 2) == 1 or k == 1 then
			                local pos = ent:GetPos()
                            local effect = EffectData()
            
			                effect:SetOrigin(pos)
                            util.Effect("StunstickImpact", effect)
				    
				            ent:EmitSound("weapons/stunstick/spark"..math.random(1, 3)..".wav")
				        end
					
					    self:EmitSound("buttons/blip1.wav")
					end

					self:SetNWString("alarm_hacking", table.concat(password, ""))
			
					break
				end
			end
		end)
		
		timer.Start("alarm_hacking_"..self:EntIndex())
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Initialize()
	self:SetWeaponHoldType("slam")
end

if CLIENT then
	function SWEP:ViewModelDrawn(vm)
		local vm = self.Owner:GetViewModel()
		local matrix = vm:GetBoneMatrix(vm:LookupBone("v_weapon.c4"))
		
		local pos = matrix:GetTranslation()
		
		local ang = matrix:GetAngles()
		local ang1 = matrix:GetAngles()
		
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Right(), -90)
		
		cam.Start3D2D(pos +ang:Up() *-2.7, ang, 0.1)
			draw.RoundedBox(0, -13, 18, 15, 29, Color(0, 0, 0))
	    cam.End3D2D()
		
		if self:GetNWString("alarm_hacking") ~= "" then
	        cam.Start3D2D(pos +ang:Up() *-2.7, ang, 0.1)
			    draw.RoundedBox(0, -12, 18, 14, 29, Color(65, 65, 65))
		        draw.RoundedBox(0, -13, 18, 2, 29, Color(0, 0, 255))
	        cam.End3D2D()

		    ang1:RotateAroundAxis(ang1:Right(), 180)
		    ang1:RotateAroundAxis(ang1:Forward(), -90)
		
		    cam.Start3D2D(pos +ang1:Up() *2.7, ang1, 0.018)
			    draw.SimpleText("Password Cracker", "DermaDefault", 138, -75, Color(255, 255, 0))
	        cam.End3D2D()
		
		    cam.Start3D2D(pos +ang1:Up() *2.7, ang1, 0.026)
				if string.find(self:GetNWString("alarm_hacking"), "*") then
			        draw.SimpleText(string.Replace(self:GetNWString("alarm_hacking"), "*", tostring(math.random(1, 9))), "DermaLarge", 73, -34, Color(255, 255, 0))
				else
				    draw.SimpleText(self:GetNWString("alarm_hacking"), "DermaLarge", 73, -34, Color(255, 255, 0, 255 -math.sin(CurTime() *8) *255))
	            end
			cam.End3D2D()
		end
	end
else
	function SWEP:hackStop()
	    if self.isHacking:GetNWString("alarm_status") ~= "" then 
		    self.isHacking:alarmTrigger(self.Owner)
		end
		
		self.isHacking:SetNWFloat("alarm_hacking_progress", 0)
		self.isHacking.hackSound:Stop()
		self.isHacking = nil
		
		self:SetNWString("alarm_hacking", "")
		self:SendWeaponAnim(ACT_VM_IDLE)
	    
		timer.Remove("alarm_hacking_"..self:EntIndex())
	end

    function SWEP:Think()
	    if self.isHacking then
		    local ent = self.Owner:GetEyeTrace().Entity
			
			if ent ~= self.isHacking or ent:GetNWString("alarm_status") ~= "Online" or ent:GetPos():Distance(self.Owner:GetPos()) > 75 then
			    self:hackStop()
			end
		end
    end
	
	function SWEP:Holster()
	    if self.isHacking then
		    self:hackStop()
		end
		
	    return true
	end
end