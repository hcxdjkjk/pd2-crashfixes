local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/contourext.lua"]:1044: attempt to index field 'occlusion' (a nil value)
local _pre_destroy = ContourExt.pre_destroy
function ContourExt:pre_destroy(...)
    if not managers.occlusion then
        return
    end
    return _pre_destroy(self, ...)
end
