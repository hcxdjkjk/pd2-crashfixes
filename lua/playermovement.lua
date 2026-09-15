--[string "lib/units/beings/player/playermovement.lua"]:1168: attempt to index field '_attention_handler' (a nil value)
--[string "lib/units/beings/player/playermovement.lua"]:1170: attempt to index field '_current_state' (a nil value)
local _pre_destroy = PlayerMovement.pre_destroy
function PlayerMovement:pre_destroy(...)
    if not self._current_state then
        self._current_state = {
            pre_destroy = function () return nil end
        }
    end
    if not self._attention_handler then
        self._attention_handler = {
            set_attention = function () return nil end
        }
    end
    return _pre_destroy(self, ...)
end

--[string "lib/units/beings/player/playermovement.lua"]:1023: attempt to index field '_current_state' (a nil value)
local _object_interaction_blocked = PlayerMovement.object_interaction_blocked
function PlayerMovement:object_interaction_blocked()
    if not self._current_state then
        return
    end
    return _object_interaction_blocked(self)
end

--[string "lib/units/beings/player/playermovement.lua"]:1189: attempt to index field '_current_state' (a nil value)
function PlayerMovement:destroy(unit)
	if self._link_data then
		self._link_data.parent:base():remove_destroy_listener("PlayerMovement" .. tostring(self._unit:key()))
	end
    
    if self._current_state and self._current_state.destroy then
    	self._current_state:destroy(unit)
    end

    if managers.hud then
    	managers.hud:set_suspicion(false)
    end

	SoundDevice:set_rtpc("suspicion", 0)
	SoundDevice:set_rtpc("stamina", 100)

	if alive(self._orientation_unit) then
		World:delete_unit(self._orientation_unit)
	end
end

--[string "lib/units/beings/player/playermovement.lua"]:1215: attempt to index field 'hud' (a nil value)
local __max_stamina = PlayerMovement._max_stamina
function PlayerMovement:_max_stamina()
    if not managers.hud then
        return 0
    end
    return __max_stamina(self)
end

--[string "lib/units/beings/player/playermovement.lua"]:90: attempt to index field 'navigation' (a nil value)
local _init = PlayerMovement.init
function PlayerMovement:init(...)
    if not managers.navigation then
        managers.navigation = {
			convert_access_flag = function() return nil end
		}
    end 
    return _init(self,...)
end

--[string "lib/units/beings/player/playermovement.lua"]:325: attempt to compare nil with number
local _update_stamina = PlayerMovement.update_stamina
function PlayerMovement:update_stamina(...)
    self._stamina = tonumber(self._stamina) or 0
    return _update_stamina(self, ...)
end
