local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

core:module("CoreSequenceManager")
core:import("CoreEngineAccess")
core:import("CoreLinkedStackMap")
core:import("CoreTable")
core:import("CoreUnit")
core:import("CoreClass")

function BaseElement:print_attribute_error() end

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
function ObjectElement:set_object(dest_unit, object_list, func_name, value)
    object_list = object_list or {}
    local fixed_object_list = {}
    for k, v in pairs(object_list) do
        if type(v) == "userdata" then
            fixed_object_list[k] = v
        end
    end
    return _set_object(self, dest_unit, fixed_object_list, func_name, value)
end

local __serialize_to_script = SequenceManager._serialize_to_script
function SequenceManager:_serialize_to_script(...)
    local result = __serialize_to_script(self, ...)
    if type(result) ~= "table" then
        return {}
    end
    return result
end
