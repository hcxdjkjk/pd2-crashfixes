local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/preplanningmanager.lua"]:1052: attempt to index a nil value
local _get_element_name_by_type_index = PrePlanningManager.get_element_name_by_type_index
function PrePlanningManager:get_element_name_by_type_index(type, index)
    local elem = self._mission_elements_by_type[type]
    if not (elem and elem[index] and elem[index]:editor_name()) then
        log(string.format("%s: crash prevented in get_element_name_by_type_index", id))
        return managers.localization:text("menu_")
    end
    
    return _get_element_name_by_type_index(self, type, index)
end