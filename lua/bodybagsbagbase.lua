local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/equipment/bodybags_bag/bodybagsbagb..."]:166: attempt to index a nil value
local __set_dynamic = BodyBagsBagBase._set_dynamic
function BodyBagsBagBase:_set_dynamic(...)
    if not alive(self._unit) then
        return
    end
    return __set_dynamic(self, ...)
end

local _server_set_dynamic = BodyBagsBagBase.server_set_dynamic
function BodyBagsBagBase:server_set_dynamic(...)
    if not alive(self._unit) then
        return
    end
    return _server_set_dynamic(self, ...)
end
