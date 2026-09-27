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

--teammate_progress()  lib/managers/hudmanagerpd2.lua:1864
local _teammate_progress = HUDManager.teammate_progress
function HUDManager:teammate_progress(peer_id, type_index, enabled, tweak_data_id, timer, success)
    return _teammate_progress(self, peer_id, tonumber(type_index), (enabled == true), tweak_data_id, (tonumber(timer) or 0), (success == true))
end

local __set_teammate_weapon_selected = HUDManager._set_teammate_weapon_selected
function HUDManager:_set_teammate_weapon_selected(i, ...)
    if not (self and self._teammate_panels and self._teammate_panels[i] and self._teammate_panels[i].set_weapon_selected) then
        return
    end
    return __set_teammate_weapon_selected(self, i, ...)
end
