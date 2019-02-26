--[[ Credit to n00bmobile (https://github.com/n00bmobile) for the original addon ]]--
alarm_system = {
    settings = {
	    price = 0.5, --> Price for each health point.
		decode = 5, --> The time it takes to decode one number.
		health = {
		    base = 200, --> How much health the alarm spawns with.
			add = 400, --> How much health should the armor upgrade add.
			armor = 0.5 --> Damage is multiplied by this value when armor is present. 
		}
	}
}