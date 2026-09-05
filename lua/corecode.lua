core:module("CoreCode")

local _alive = alive

function alive(obj)
    if obj and (type(obj) == "userdata" or type(obj) == "table") and type(obj.alive) == "function" then
        return _alive(obj)
    end
    return false
end
