include("shared.lua")

function ENT:Draw() 
    self:DrawModel()
	
	if not self:GetParent():IsValid() then
	    local pos = self:GetPos()
        local ang = self:GetAngles()

	    surface.SetFont("Trebuchet24")

	    local txt = self.boxName or self:GetClass()
	    local w, h = surface.GetTextSize(txt)
	
	    cam.Start3D2D(pos +ang:Up() *4.1, ang, 0.2) 
            draw.WordBox(2, -w *0.31, -10, txt, "Default", Color(0, 0, 0, 200), color_white)
        cam.End3D2D()
	end
end