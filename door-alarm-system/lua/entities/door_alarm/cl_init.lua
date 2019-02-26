include("shared.lua")

function ENT:Draw() 
    self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	local ang2 = self:GetAngles()
	
	ang:RotateAroundAxis(ang:Right(), 90)
	
	ang2:RotateAroundAxis(ang2:Up(), 90)
	ang2:RotateAroundAxis(ang2:Forward(), 90)
	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 125 then
	    local progress = self:GetNWFloat("alarm_hacking_progress")
		local status = self:GetNWString("alarm_status")
		
		--[BASE]--
		cam.Start3D2D(pos +ang:Up() *-5.8, ang, 0.04) --black background
		    draw.RoundedBox(0, -41, 6, 62, 122, Color(0, 0, 0))
	    cam.End3D2D()
	    
	    cam.Start3D2D(pos +ang:Up() *-5.8, ang2, 0.04) --text
		    if status == "Online" then
				draw.SimpleText(status, "DermaLarge", (-67 -(math.random(-1, 1) *progress)), (7 -(math.random(-1, 1) *progress)), Color(255, 255, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	        else
		        draw.SimpleText(status, "DermaLarge", -67, 10, Color(255, 0, 0, 255 -math.sin(CurTime() *8) *255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		    end
     	cam.End3D2D()
	
	    cam.Start3D2D(pos +ang:Up() *-5.8, ang2, 0.01) --moar text
		    if status == "Online" then
		        draw.SimpleText("and protecting you", "DermaLarge", (-67 -(math.random(-1, 1) *progress)) *4, (20 -(math.random(-1, 1) *progress)) *4, Color(255, 255, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
    	cam.End3D2D()
		
		--[HACKING]--
		cam.Start3D2D(pos +ang:Up() *-5.8, ang2, 0.04) --tearing
		    for i = 1, progress *25 do
			    surface.SetDrawColor(255, 255, 255)
	                surface.SetMaterial(Material("effects/security_noise2"))
	            surface.DrawTexturedRect(math.random(-128, -11), math.random(-21, 40), math.random(1, 5), 1)
			end
	    cam.End3D2D()
    end
end

net.Receive("alarmMenu", function()
    local alarm = net.ReadEntity()
	
	Derma_Query(
	    "This alarm is protecting a door.\nPlease, choose one of the options below.",
		"Alarm Menu",
		"Detach",
		function()
		    net.Start("alarmMenu")
			    net.WriteInt(1, 32)
				net.WriteEntity(alarm)
			net.SendToServer()
		end,
		"Toggle",
		function()
		    net.Start("alarmMenu")
			    net.WriteInt(2, 32)
				net.WriteEntity(alarm)
			net.SendToServer()
		end,
		"Fix",
		function()
			net.Start("alarmMenu")
			    net.WriteInt(3, 32)
				net.WriteEntity(alarm)
			net.SendToServer()
		end
	)
end)