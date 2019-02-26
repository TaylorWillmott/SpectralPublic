if false then -- This tool is deprecated, use the SWEP version instead. If you want to enable this for whatever reason, just change false to true or delete the if statement entirely.
	TOOL.Category = "Properties"
	TOOL.Name = "Property Assistant"

	if SERVER then
		hook.Add("DoorIDRequest", "PropertiesDoorID", DoorIDFinder)
		function DoorIDFinder(door)
			if (IsValid(door) and string.find(door:GetClass(), "door") ~= nil) then
					return door:doorIndex()
			else
				return nil
			end
		end
	end
	
	if CLIENT then
		TOOL.Information = {
			{ name = "left" },
			{ name = "right" },
			{ name = "reload" },
		}
			
		language.Add( "tool.property.name", "Property Assistant" )
		language.Add( "tool.property.desc", "Finds Door IDs and gives formatted strings for camera views and NPC locations." )
		language.Add( "tool.property.left", "Finds the DoorID of the door you are looking at and sends it to chat and your clipboard." )
		language.Add( "tool.property.right", "Generates a formatted string to use your current camera position as a Properties camera pose and sends it to the console and your clipboard." )
		language.Add( "tool.property.reload", "Generates a formatted string to use your current position as a Properties NPC spawn and sends it to the console and your clipboard." )
	end
	
	function TOOL:Reload()
		--if SERVER then return end
		--if (CLIENT and IsFirstTimePredicted() and not self.Reloading) then
			--self.Reloading = true
		if IsFirstTimePredicted() then
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
			
			--self:GetOwner():SetAnimation(PLAYER_ATTACK1)
			--self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
		end
	end
	 
	function TOOL:Think()
		--if ( CLIENT and self.Reloading and IsValid(self:GetOwner()) and not self:GetOwner():KeyDown(IN_RELOAD) ) then
		--	self.Reloading = false
		--end
	end

	function TOOL:LeftClick( trace )
		if SERVER then return end
		door = trace.Entity
		print(tostring(door))
		if IsValid(door) then
			index = hook.Run("DoorIDRequest", door)
		end
		if index ~= nil then
			self:GetOwner():ChatPrint(tostring(index))
			SetClipboardText(tostring(index))
			return true
		end
		return false
	end

	function TOOL:RightClick( trace )
		--if SERVER then return end
		if !IsFirstTimePredicted() then return end
		
		local angle = player.GetByID(1):EyeAngles()
		local pos = player.GetByID(1):EyePos()

		local angleTbl = string.Explode(" ", tostring(angle))
		local posTbl = string.Explode(" ", tostring(pos))

		local angleText = "Angle("..string.Implode(", ", angleTbl)..")"
		local posText = "Vector("..string.Implode(", ", posTbl)..")"
		local formatted = "{pos = "..posText..", ang = "..angleText.."},"
		
		print(formatted)
		SetClipboardText(tostring(formatted))
		self:GetOwner():ChatPrint("Camera position was formatted and sent to the console and your clipboard.")
	end
end