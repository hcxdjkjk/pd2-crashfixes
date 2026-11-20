local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

if FullSpeedSwarm and FullSpeedSwarm.settings and FullSpeedSwarm.settings.slower_but_safer == true then
    return
end

core:module("CoreCode")

local type = type

local _alive = alive
function alive(obj)
    if not obj then
        return false
    end
    local obj_type = type(obj)
    if obj_type ~= "userdata" and obj_type ~= "table" then
        return false
    end
    if not (obj.alive and type(obj.alive) == "function") then
        return false
    end
    return _alive(obj)
end
