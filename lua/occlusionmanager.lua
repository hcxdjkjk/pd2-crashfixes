local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/occlusionmanager.lua"]:53: attempt to perform arithmetic on a boolean value
--[string "lib/managers/occlusionmanager.lua"]:66: attempt to index local 'obj' (a number value)
local _add_occlusion = _OcclusionManager.add_occlusion
function _OcclusionManager:add_occlusion(unit)
    if not alive(unit) then 
        return 
    end

    local objects = unit:get_objects_by_type(self._model_ids)
    for k, v in pairs(objects) do
        if type(v) ~= "userdata" then
            log("["..tostring(k).."] "..tostring(v).." is not userdata")
            return
        end
    end
    return _add_occlusion(self, unit)
end
