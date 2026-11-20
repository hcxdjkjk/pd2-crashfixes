local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

core:module("CoreUnit")

local type = type

--[string "core/lib/utils/coreunit.lua"]:111: attempt to index local 'ext' (a number value)
function detach_unit_from_network(unit)
    if not alive(unit) then
        return
    end

    local ext
    local extensions = unit.extensions and unit:extensions()

    for _, ext_name in ipairs(extensions or {}) do
        ext = unit[ext_name](unit)
		if type(ext) == "table" and ext.on_pre_detached_from_network then
			ext:on_pre_detached_from_network()
		end
    end

    Network:detach_unit(unit)

    for _, ext_name in ipairs(extensions or {}) do
        ext = unit[ext_name](unit)
        if type(ext) == "table" and ext.on_post_detached_from_network then
            ext:on_post_detached_from_network()
        end
    end
end

local _safe_spawn_unit = safe_spawn_unit
function safe_spawn_unit(unit_name, ...)
    if not unit_name then
        return
    end
    local unit_type = type(unit_name)
    if unit_type ~= "string" and unit_type ~= "userdata" then
        return
    end
    local name_ids = unit_name:id()
    if not DB:has(IDS_UNIT, name_ids) then
        return
    end
	return _safe_spawn_unit(unit_name, ...)
end
