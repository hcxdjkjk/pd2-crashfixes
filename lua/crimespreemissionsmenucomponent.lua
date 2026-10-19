local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/menu/crimespreemissionsmenucompo..."]:791: attempt to compare nil with number
local __get_mission_category = CrimeSpreeMissionButton._get_mission_category
function CrimeSpreeMissionButton:_get_mission_category(mission)
    if not mission or type(mission.add) ~= "number" then
        return "short"
    end
    return __get_mission_category(self, mission)
end
