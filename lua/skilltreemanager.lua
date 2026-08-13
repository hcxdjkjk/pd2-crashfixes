--[string "lib/managers/skilltreemanager.lua"]:1692: attempt to index local 'value' (a nil value)
local _get_specialization_value = SkillTreeManager.get_specialization_value
function SkillTreeManager:get_specialization_value(...)
    if not self._global.specializations then
        return 0
    end
    return _get_specialization_value(self, ...)
end
