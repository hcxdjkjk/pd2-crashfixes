--[string "lib/managers/menu/crimespreemissionsmenucompo..."]:791: attempt to compare nil with number
local __get_mission_category = CrimeSpreeMissionButton._get_mission_category
function CrimeSpreeMissionButton:_get_mission_category(mission)
    if mission and type(mission.add) == "number" then
        return __get_mission_category(self, mission)
    end
    return "short"
end
