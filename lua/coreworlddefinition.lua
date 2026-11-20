local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

core:module("CoreWorldDefinition")
core:import("CoreUnit")
core:import("CoreMath")
core:import("CoreEditorUtils")
core:import("CoreEngineAccess")

local is_editor = Application:editor()

--[string "core/lib/utils/dev/editor/coreworlddefinition..."]:910: attempt to index a number value
local __create_portal = WorldDefinition._create_portal
function WorldDefinition:_create_portal(data, offset)
    if type(data) ~= "table" then
        return
    end
    if type(data.portals) ~= "table" then
        return
    end
    return __create_portal(self, data, offset)
end

--[string "core/lib/utils/dev/editor/coreworlddefinition..."]:1301: attempt to index a number value
local __setup_projection_light = WorldDefinition._setup_projection_light
function WorldDefinition:_setup_projection_light(unit, data)
	if type(data) ~= "table" then 
        return 
    end
    if type(data.projection_textures) ~= "table" then
    	data.projection_textures = nil
    end
    return __setup_projection_light(self, unit, data)
end

local _use_me = WorldDefinition.use_me
function WorldDefinition:use_me(unit, ...)
    if type(unit) ~= "userdata" then
        return
    end
    local unit_data = unit.unit_data and unit:unit_data()
    if not unit_data then
        return
    end
    if not unit.damage then
        return
    end
	return _use_me(self, unit, ...)
end

--[string "lib/setups/gamesetup.lua"]:744: attempt to index field 'worlddefinition' (a nil value)
local __unload_package = WorldDefinition._unload_package
function WorldDefinition:_unload_package(package)
    if type(package) ~= "string" then
        return
    end
    if not PackageManager:package_exists(package) then
        return
    end
	return __unload_package(self, package)
end

--[string "core/lib/utils/dev/editor/coreworlddefinition..."]:884: attempt to index a nil value
local _make_unit = WorldDefinition.make_unit
function WorldDefinition:make_unit(data, offset)
    local name = data.name

    if self._replace_names[name] then
        name = self._replace_names[name]
    end

    if not name then
        return
    end

    if not is_editor and not Network:is_server() then
        local unit_data = PackageManager:unit_data(name:id())
        local network_sync = unit_data and unit_data.network_sync and unit_data:network_sync()
        if not network_sync then
            return
        end
    end

    return _make_unit(self, data, offset)
end
