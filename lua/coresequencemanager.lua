local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

core:module("CoreSequenceManager")
core:import("CoreEngineAccess")
core:import("CoreLinkedStackMap")
core:import("CoreTable")
core:import("CoreUnit")
core:import("CoreClass")

local _run_parsed_func = BaseElement.run_parsed_func
function BaseElement:run_parsed_func(env, func)
    if type(func) ~= "function" then
        return
    end
    return _run_parsed_func(self, env, func)
end

function BaseElement:get_static(name, value, set_function, node)
    if value ~= nil then
        local __func = loadstring("return " .. tostring(value))

        --[string "core/lib/managers/coresequencemanager.lua"]:1965: attempt to call upvalue '__func' (a number value)
        if type(__func) == "function" then
            if set_function then
                return function(env, ...)
                    if type(env) == "table" then
                        setfenv(__func, env)
                        set_function(self, env, __func(), ...)
                    end
                end
            else
                return function(env, ...)
                    if type(env) == "table" then
                        setfenv(__func, env)
                        return __func(env, ...)
                    end
                end
            end
        end
    end

    return nil
end

--[string "core/lib/managers/coresequencemanager.lua"]:5024: attempt to index local 'obj' (a number value)
local _set_object = ObjectElement.set_object
function ObjectElement:set_object(dest_unit, object_list, ...)
    if type(object_list) ~= "table" then
        return
    end
    local fixed_object_list = {}
    local count = 0
    for i=1, table.maxn(object_list) do
        local obj = object_list[i]
        if type(obj) == "userdata" then
            count = count + 1
            fixed_object_list[count] = obj
        end
    end
    return _set_object(self, dest_unit, fixed_object_list, ...)
end

local __serialize_to_script = SequenceManager._serialize_to_script
function SequenceManager:_serialize_to_script(...)
    local result = __serialize_to_script(self, ...)
    if type(result) ~= "table" then
        return {}
    end
    return result
end

local _activate_callback = SpawnUnitElement.activate_callback
function SpawnUnitElement:activate_callback(env)
    if Network:multiplayer() and Network:is_client() then
        local name = self:run_parsed_func(env, self._name)
        if name and not MassUnitManager:can_spawn_unit(Idstring(name)) and not PackageManager:unit_data(name:id()) then
            return
        end
    end
    return _activate_callback(self, env)
end
