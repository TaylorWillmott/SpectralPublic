---- NPC Spawns ----

Properties.NPCSpawns[1] = {
	["name"] = "Hotel Receptionist",
	["model"] = "models/mossman.mdl",
	["pos"] = Vector( -846, -969, -131 ),
	["angle"] = Angle( 0, -90, 0 ),
	["whitelist"] = {1,2,3,4},
}

Properties.NPCSpawns[2] = {
	["name"] = "Apartment Manager",
	["model"] = "models/odessa.mdl",
	["pos"] = Vector( -33.501385, -6676.968750, -131.968750 ),
	["angle"] = Angle( 0, 90, 0 ),
	["whitelist"] = {5,6,7,8},
}

--[[Properties.NPCSpawns[2] = { 
	["name"] = "Bob's Brother",
	["model"] = "models/odessa.mdl",
	["pos"] = Vector( -2155 -1073 -131 ), 
	["angle"] = Angle( 0, 90, 0 ), 
	--["blacklist"] = {1,2},
}]]--

---- Derma Config ----

Properties.BackGroundColor = Color(34,49,63,200)--Background color is used on first opening or when there are no view positions on that property
Properties.BackGroundFont = "DermaLarge"--Font used in same situations
Properties.BackGroundTextColor = Color(255,255,255,255)
Properties.PropertyNameFont = "DermaLarge"--Used for property name.
Properties.PropertyNameTextColor = Color(255,255,255,255)
Properties.PropertyNameBackground = Color(34,49,63,200)
Properties.PropertyNameOutline = Color(255,255,255,255)
Properties.PropertyManNameFont = "DermaLarge"--Used for property manager's name
Properties.PropertyManNameTextColor = Color(255,255,255,255)
Properties.PropertyManNameBackground = Color(34,49,63,200)
Properties.PropertyManNameOutline = Color(255,255,255,255)
Properties.ButtonBackground = Color(34,49,63,200)--Used for sell/buy and < > buttons
Properties.ButtonOutline = Color(255,255,255,255)
Properties.ButtonTextFont = "DermaLarge"
Properties.ButtonTextColor = Color(255,255,255,255)
Properties.ButtonBackgroundOnMouse = Color(149,165,166,200)--When mouse is on button
Properties.ListOutline = Color(255,255,255,255)--DPanelList with properties and scrollbar outline
Properties.ListVBarBackground = Color(34,49,63,200)--Scroll Bar
Properties.PropertyButtonFont = "Trebuchet24"--Property button in DPanelList
Properties.PropertyButtonTextColor = Color(255,255,255,255)
Properties.PropertyButtonBackground = Color(34,49,63,200)
Properties.PropertyButtonOutline = Color(255,255,255,255)

---- Property Assignments ----

--[[ Example Property (Seperated onto multiply lines for clarity.

Properties.PropertyDoors[1] = { ["price"] = 200, -- Price of this property.
								["name"] = "Tides Hotel Room 1", -- Name of the property.
								["poses"] = {{pos = Vector(-4404.562012, -5097.754395, 311.723480), ang = Angle(21.507622, 41.077198, 0.000000)}, -- Coords for camera views of the property.
											 {pos = Vector(-4089.926270, -5097.647949, 319.979675), ang = Angle(13.520012 ,132.429581 ,0.000000)},
											 {pos = Vector(-4401.061523, -4689.803223, 315.190979), ang = Angle(26.940025, -40.575134, 0.000000)}}
							  }
Properties.DoorLookUp[1] = {2261, 2292} -- IDs of the doors included in this property.

]]--


Properties.PropertyDoors[1] = { ["price"] = 25000,
								["name"] = "Penthouse",
								["poses"] = {{pos = Vector(-1022.968750, -1271.968750, 416.03125), ang = Angle(20.460, 47.077, 0.000)},
											 {pos = Vector(-871.031250, -1271.968750, 544.03125), ang = Angle(12.672, 132.781, 0.000)},
											 {pos = Vector(-735.031250, -1104.031250, 544.03125), ang = Angle(25.080, -123.563, 0.000)},
											 {pos = Vector(-1377.840332, -1417.195557, 471.375122), ang = Angle(6.895, 17.195, 0.000)}}
											 }
Properties.DoorLookUp[1] = {1403, 1404, 1405, 1406, 1407, 1408, 1515, 2079}

Properties.PropertyDoors[2] = { ["price"] = 10000,
								["name"] = "Room 3",
								["poses"] = {{pos = Vector(-1017.795532, -1265.015137, 288.03125), ang = Angle(29.468, 53.352, 0.000)},
											 {pos = Vector(-860.968750, -1055.968750, 288.03125), ang = Angle(31.976, 44.772, 0.000)},
											 {pos = Vector(-1377.840332, -1417.195557, 288.03125), ang = Angle(6.895, 17.195, 0.000)}}
											 }
Properties.DoorLookUp[2] = {1390, 1395, 1400, 1545}

Properties.PropertyDoors[3] = { ["price"] = 10000,
								["name"] = "Room 2",
								["poses"] = {{pos = Vector(-1017.795532, -1265.015137, 160.03125), ang = Angle(29.468, 53.352, 0.000)},
											 {pos = Vector(-860.968750, -1055.968750, 160.03125), ang = Angle(31.976, 44.772, 0.000)},
											 {pos = Vector(-1022.968750, -1567.968750, 160.03125), ang = Angle(18.348, 52.788, 0.000)},
											 {pos = Vector(-1377.840332, -1417.195557, 160.03125), ang = Angle(6.895, 17.195, 0.000)}}
											 }
Properties.DoorLookUp[3] = {1386, 1387, 1401, 1932, 2082}

Properties.PropertyDoors[4] = { ["price"] = 10000,
								["name"] = "Room 1",
								["poses"] = {{pos = Vector(-1017.795532, -1265.015137, 32.03125), ang = Angle(29.468, 53.352, 0.000)},
											 {pos = Vector(-860.968750, -1055.968750, 32.03125), ang = Angle(31.976, 44.772, 0.000)},
											 {pos = Vector(-1022.968750, -1567.968750, 32.03125), ang = Angle(18.348, 52.788, 0.000)},
											 {pos = Vector(-1377.840332, -1417.195557, 32.03125), ang = Angle(6.895, 17.195, 0.000)}}
											 }
Properties.DoorLookUp[4] = {1379, 1380, 1402, 2081, 2083}





