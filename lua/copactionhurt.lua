--[string "lib/units/enemies/cop/actions/full_body/copac..."]:196: attempt to call method 'base' (a nil value)
local _init = CopActionHurt.init
function CopActionHurt:init(action_desc, common_data)
    local unit = common_data.unit

    if not (
        unit and alive(unit) and (unit.base and unit:base())
    ) then return end

    return _init(self, action_desc, common_data)
end
