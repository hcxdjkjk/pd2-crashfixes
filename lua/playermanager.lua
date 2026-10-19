local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/playermanager.lua"]:468: attempt to index field '_ammo_efficiency' (a nil value)
local __on_enter_ammo_efficiency_event = PlayerManager._on_enter_ammo_efficiency_event
function PlayerManager:_on_enter_ammo_efficiency_event()
	if not self._ammo_efficiency then
        return
    end
    return __on_enter_ammo_efficiency_event(self)
end

--[string "lib/managers/playermanager.lua"]:2104: attempt to index field '_global' (a nil value)
local _upgrade_value = PlayerManager.upgrade_value
function PlayerManager:upgrade_value(...)
    if not self._global then
        return 0
    end
    return _upgrade_value(self, ...)
end

local _add_special = PlayerManager.add_special
function PlayerManager:add_special(...)
    if not managers.hud then
        return
    end
    return _add_special(self, ...)
end

--[string "lib/managers/playermanager.lua"]:1163: attempt to index a nil value
local _spawned_player = PlayerManager.spawned_player
function PlayerManager:spawned_player(id, unit)
    if type(unit) ~= "userdata" then
        return
    end
    if id == 1 and not (unit.inventory and unit:inventory()) then
        return
    end
    return _spawned_player(self, id, unit)
end

--[string "lib/managers/playermanager.lua"]:5348: attempt to index a nil value
local _set_synced_grenades = PlayerManager.set_synced_grenades
function PlayerManager:set_synced_grenades(peer_id, grenade, amount, register_peer_id)
    if not tweak_data.blackmarket.projectiles[grenade] then
        return
    end
    return _set_synced_grenades(self, peer_id, grenade, (tonumber(amount) or 0), register_peer_id)
end
