if SERVER then
    AddCSLuaFile("alarm_config.lua")
	include("alarm_config.lua")
else
    include("alarm_config.lua")
end

util.PrecacheSound("npc/dog/dog_servo12.wav")
util.PrecacheSound("buttons/combine_button2.wav")
util.PrecacheSound("weapons/stunstick/alyx_stunner1.wav")
util.PrecacheSound("ambient/alarms/alarm1.wav")
util.PrecacheSound("buttons/combine_button1.wav")
util.PrecacheSound("ambient/energy/electric_loop.wav")
util.PrecacheSound("buttons/bell1.wav")
util.PrecacheSound("weapons/stunstick/spark1.wav")
util.PrecacheSound("weapons/stunstick/spark2.wav")
util.PrecacheSound("weapons/stunstick/spark3.wav")
util.PrecacheSound("buttons/blip1.wav")

MsgN("Door Alarm System v2 loaded.")