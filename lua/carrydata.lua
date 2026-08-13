--[string "lib/units/props/carrydata.lua"]:1436: attempt to index field '_has_body_activation_clbk' (a nil value)
local _clbk_body_active_state = CarryData.clbk_body_active_state
function CarryData:clbk_body_active_state(...)
    if not self._has_body_activation_clbk then
        return
    end
    return _clbk_body_active_state(self, ...)
end
