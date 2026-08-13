--[string "lib/managers/playermanager.lua"]:468: attempt to index field '_ammo_efficiency' (a nil value)
local __on_enter_ammo_efficiency_event = PlayerManager._on_enter_ammo_efficiency_event
function PlayerManager:_on_enter_ammo_efficiency_event()
	if self._ammo_efficiency then
		return __on_enter_ammo_efficiency_event(self)
	end
end
