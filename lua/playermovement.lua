local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/beings/player/playermovement.lua"]:1168: attempt to index field '_attention_handler' (a nil value)
--[string "lib/units/beings/player/playermovement.lua"]:1170: attempt to index field '_current_state' (a nil value)
local _pre_destroy = PlayerMovement.pre_destroy
function PlayerMovement:pre_destroy(...)
    if not (self._current_state and self._current_state.pre_destroy) then
        self._current_state = {
            pre_destroy = function() end
        }
    end
    if not (self._attention_handler and self._attention_handler.set_attention) then
        self._attention_handler = {
            set_attention = function() end
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
--[string "lib/units/beings/player/playermovement.lua"]:1201: attempt to call method 'destroy' (a nil value)
local _destroy = PlayerMovement.destroy
function PlayerMovement:destroy(...)
    if not (self._current_state and self._current_state.destroy) then
        self._current_state = {
            destroy = function () end
        }
    end
    if not (managers.hud and managers.hud.set_suspicion) then
        managers.hud = {
            set_suspicion = function() end
        }
    end
    return _destroy(self, ...)
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
			convert_access_flag = function() end
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
