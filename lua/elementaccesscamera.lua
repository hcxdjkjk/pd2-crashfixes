--[string "lib/managers/mission/elementaccesscamera.lua"]:41: attempt to call method 'set_access_camera_mission_element' (a nil value)
local __load_unit = ElementAccessCamera._load_unit
function ElementAccessCamera:_load_unit(unit)
    if not (
        unit 
        and (unit.base and unit:base())
        and unit:base().set_access_camera_mission_element
    ) then
        return
    end

    return __load_unit(self, unit)
end
