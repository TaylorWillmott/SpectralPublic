if SERVER then
 
	AddCSLuaFile ()

	SWEP.AutoSwitchTo = false
	SWEP.AutoSwitchFrom = false
 
else 
 
	SWEP.PrintName = "Property Assistant"
 
	SWEP.Slot = 4
	SWEP.SlotPos = 1
 
	SWEP.DrawAmmo = false
 
	SWEP.DrawCrosshair = true

	SWEP.Author = "Originally by ds2198, edited by Threebow and TheRandomnessGuy"
	SWEP.Contact = "N/A"
	SWEP.Purpose = "Finds Door IDs and gives formatted strings for camera views and NPC locations."
	SWEP.Instructions = [[Primary - Finds the DoorID of the door you are looking at and sends it to chat and your clipboard.

Secondary - Generates a formatted string to use your current camera position as a Properties camera pose and sends it to the console and your clipboard.

Reload - Generates a formatted string to use your current position as a Properties NPC spawn and sends it to the console and your clipboard.]]

end
 
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
 
SWEP.ViewModel = Model("models/weapons/v_hands.mdl")
SWEP.WorldModel = Model("models/weapons/w_toolgun.mdl")

SWEP.Primary.ClipSize = -1
 
SWEP.Primary.DefaultClip = -1
 
SWEP.Primary.Automatic = false

SWEP.Primary.Ammo = "none"
 
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"


function SWEP:PrimaryAttack()
	if !IsFirstTimePredicted() then return end
	
	door = self:GetOwner():GetEyeTrace().Entity
	if SERVER then
		if (IsValid(door) and string.find(door:GetClass(), "door") ~= nil) then
				local index = door:doorIndex()
				self:GetOwner():ChatPrint(index)
				self:GetOwner():SetClipboardText(tostring(index))
		end
	end
end


function SWEP:SecondaryAttack()
	if !IsFirstTimePredicted() then return end
	
	local angle = player.GetByID(1):EyeAngles()
	local pos = player.GetByID(1):EyePos()

	local angleTbl = string.Explode(" ", tostring(angle))
	local posTbl = string.Explode(" ", tostring(pos))

	local angleText = "Angle("..string.Implode(", ", angleTbl)..")"
	local posText = "Vector("..string.Implode(", ", posTbl)..")"
	local formatted = "{pos = "..posText..", ang = "..angleText.."},"
	
	print(formatted)
	if CLIENT then SetClipboardText(tostring(formatted))
	else self:GetOwner():ChatPrint("Camera position was formatted and sent to the console and your clipboard.") end
	
	self:GetOwner():SetAnimation(PLAYER_ATTACK1)
    --self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
end


function SWEP:Reload()
	if (CLIENT and IsFirstTimePredicted() and not self.Reloading) then
        self.Reloading = true
		
		local angle = player.GetByID(1):GetAngles()
		local pos = player.GetByID(1):GetPos()

		local angleTbl = string.Explode(" ", tostring(angle))
		local posTbl = string.Explode(" ", tostring(pos))

		local angleText = "Angle( "..string.Implode(", ", angleTbl)..")"
		local posText = "Vector( "..string.Implode(", ", posTbl)..")"
		local formatted = '["pos"] = '..posText..',\n["angle"] = '..angleText..","
		
		print(formatted)
		SetClipboardText(tostring(formatted))
		self:GetOwner():ChatPrint("Player position was formatted and sent to the console and your clipboard.")
		
		self:GetOwner():SetAnimation(PLAYER_ATTACK1)
	end
end


function SWEP:Think()
	if ( self.Reloading ) then
		if ( IsValid(self:GetOwner()) and not self:GetOwner():KeyDown(IN_RELOAD) ) then
			self.Reloading = false
		end
	end
end