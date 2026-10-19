local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/enemies/cop/logics/coplogicbase.lua"]:1551: attempt to index local 'data' (a nil value)
local _inc_dodge_count = TeamAIDamage.inc_dodge_count
function TeamAIDamage:inc_dodge_count(...)
    local unit = alive(self._unit) and self._unit.brain and self._unit:brain()
    if not (unit and unit._logic_data) then
        return
    end
    return _inc_dodge_count(self, ...)
end
