core:module("CoreUnit")
core:import("CoreEngineAccess")
core:import("CoreCode")

--[string "core/lib/utils/coreunit.lua"]:111: attempt to index local 'ext' (a number value)
local _detach_unit_from_network = detach_unit_from_network
function detach_unit_from_network(unit)
    if not (unit and type(unit) == "userdata") then
        return
    end
    if not (unit.extensions and type(unit:extensions()) == "table") then
        return
    end
    return _detach_unit_from_network(unit)
end

local _safe_spawn_unit = safe_spawn_unit
function safe_spawn_unit(unit_name, ...)
	if not (type(unit_name) == "string" or type(unit_name) == "userdata") then
		return nil
	end
	return _safe_spawn_unit(unit_name, ...)
end
