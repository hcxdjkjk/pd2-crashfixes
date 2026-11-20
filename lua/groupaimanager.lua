local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/groupaimanager.lua"]:73: attempt to call method 'get_persisting_data' (a nil value)
local _set_state = GroupAIManager.set_state
function GroupAIManager:set_state(...)
    if self._state ~= nil and not self._state.get_persisting_data then
        self._state = nil
    end
    return _set_state(self, ...)
end
