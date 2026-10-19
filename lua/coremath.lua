local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

if core then
	core:module("CoreMath")
	core:import("CoreClass")
end

local _round = math.round
function math.round(n, ...)
    return _round(tonumber(n) or 0, ...)
end
