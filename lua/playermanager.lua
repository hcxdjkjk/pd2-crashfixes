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
