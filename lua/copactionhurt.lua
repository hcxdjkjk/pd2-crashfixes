local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/enemies/cop/actions/full_body/copac..."]:196: attempt to call method 'base' (a nil value)
local _init = CopActionHurt.init
function CopActionHurt:init(action_desc, common_data)
    local unit = common_data.unit
    if not alive(unit) then
        return
    end
    local base = unit.base and unit:base()
    if not base then
        return
    end
    return _init(self, action_desc, common_data)
end
