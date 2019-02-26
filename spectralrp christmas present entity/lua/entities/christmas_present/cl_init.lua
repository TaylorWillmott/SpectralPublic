include("shared.lua")

function ENT:Draw()
    --CreateMaterial("PresentMaterial", "VertexLitGeneric", {
    --    ["$basetexture"] = "models/debug/debugwhite",
    --}):SetVector("$color2", Vector(1.0,0.5,0.19))

    --self:SetSubMaterial(0,"!PresentMaterial")
	
	self:DrawModel()
end