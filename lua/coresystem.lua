local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local world_mt                          = getmetatable(World)
local effect_manager_mt                 = getmetatable(World:effect_manager())
local packagemanager_mt                 = getmetatable(PackageManager)
local massunitmanager_mt                = getmetatable(MassUnitManager)

local _world_spawn_unit                 = world_mt.spawn_unit
local _world_delete_unit                = world_mt.delete_unit
local _world_delete_camera              = world_mt.delete_camera
local _world_delete_light               = world_mt.delete_light
local _effectmanager_spawn              = effect_manager_mt.spawn
local _packagemanager_has               = packagemanager_mt.has
local _massunitmanager_spawn_unit       = massunitmanager_mt.spawn_unit

packagemanager_mt.has = function(self, ids, name, ...)
    if type_name(ids) ~= "Idstring" then
        return
    end
    if type_name(name) ~= "Idstring" then
        return
    end
    return _packagemanager_has(self, ids, name, ...)
end

world_mt.spawn_unit = function(self, unit_name, ...)
	if type(unit_name) ~= "userdata" then
		return nil
	end
    if not PackageManager:has(IDS_UNIT, unit_name:id()) then
        return
    end
	return _world_spawn_unit(self, unit_name, ...)
end

world_mt.delete_unit = function (self, unit_name, ...)
    if type(unit_name) ~= "userdata" then
        return nil
    end
    return _world_delete_unit(self, unit_name, ...)
end

world_mt.delete_light = function (self, unit_name, ...)
    if type(unit_name) ~= "userdata" then
        return
    end
    if string.lower(type_name(unit_name)) ~= "light" then
        return
    end
    return _world_delete_light(self, unit_name, ...)
end

world_mt.delete_camera = function (self, unit_name, ...)
    if type(unit_name) ~= "userdata" then
        return
    end
    if string.lower(type_name(unit_name)) ~= "camera" then
        return
    end
    return _world_delete_camera(self, unit_name, ...)
end

effect_manager_mt.spawn = function(self, effect_table, ...)
    if type(effect_table) ~= "table" then
        return nil
    end
    return _effectmanager_spawn(self, effect_table, ...)
end

massunitmanager_mt.spawn_unit = function (self, unit_name, ...)
    if type(unit_name) ~= "userdata" then
        return nil
    end
    return _massunitmanager_spawn_unit(self, unit_name, ...)
end
