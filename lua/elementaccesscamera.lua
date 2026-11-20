local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/mission/elementaccesscamera.lua"]:41: attempt to call method 'set_access_camera_mission_element' (a nil value)
local __load_unit = ElementAccessCamera._load_unit
function ElementAccessCamera:_load_unit(unit)
    if not unit then
        return
    end
    local base = unit.base and unit:base()
    if not base then
        return
    end
    if not base.set_access_camera_mission_element then
        return
    end
    return __load_unit(self, unit)
end
