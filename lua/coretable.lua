local _clone = clone
function clone(o)
    if type(o) ~= "table" then
        return o
    end
    return _clone(o)
end

local _deep_clone = deep_clone
function deep_clone(o)
    if type(o) ~= "table" then
        return o
    end
    return _deep_clone(o)
end

local _get_vector_index = table.get_vector_index
function table.get_vector_index(v, e)
    if type(v) ~= "table" then
        v = {}
    end
    return _get_vector_index(v, e)
end
