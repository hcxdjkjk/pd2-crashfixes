--[string "lib/units/equipment/shield/shieldbase.lua"]:524: attempt to index local 'unit' (a nil value)
local __can_stun_unit = ShieldFlashBase._can_stun_unit
function ShieldFlashBase:_can_stun_unit(parent_key, unit)
    if type(unit) ~= "userdata" then
        return
    end
    return __can_stun_unit(self, parent_key, unit)
end
