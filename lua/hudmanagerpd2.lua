--[string "lib/managers/hudmanagerpd2.lua"]:756: attempt to index a nil value
local __create_assault_corner = HUDManager._create_assault_corner
function HUDManager:_create_assault_corner()
	if 
        managers.hud
        and (tweak_data and tweak_data.levels) 
        and (Global.game_settings and Global.game_settings.level_id) 
    then
		return __create_assault_corner(self)
	end
end

--[string "lib/managers/hudmanagerpd2.lua"]:1359: attempt to index a nil value
local __create_heist_timer = HUDManager._create_heist_timer
function HUDManager:_create_heist_timer(hud)
	if 
        (hud or managers.hud)
        and (tweak_data and tweak_data.levels) 
        and (Global.game_settings and Global.game_settings.level_id) 
    then
		return __create_heist_timer(self, hud)
	end
end
