local EMPTY_TABLE = {}
local EMPTY_STRING = ""

local _table_insert = table.insert
table.insert = function (t, ...)
	if type(t) ~= "table" then return end
	return _table_insert(t, ...)
end

local _table_remove = table.remove
table.remove = function (t, pos)
    if type(t) ~= "table" then
        return
    end
    if pos and type(pos) ~= "number" then
        return _table_remove(t, nil)
    end
    return _table_remove(t, pos)
end

local _table_maxn = table.maxn
table.maxn = function (t)
    if type(t) ~= "table" then return 0 end
    return _table_maxn(t)
end

local _table_empty = table.empty
table.empty = function (t)
    if type(t) ~= "table" then return true end
    return _table_empty(t)
end

local _pairs = pairs
if _pairs then
    _G.pairs = function (t)
		if type(t) ~= "table" then 
            t = EMPTY_TABLE
        end
		return _pairs(t)
    end
    pairs = _G.pairs
end

local _ipairs = ipairs
if _ipairs then
	_G.ipairs = function (t)
        if type(t) ~= "table" then
            t = EMPTY_TABLE
        end
		return _ipairs(t)
	end
	ipairs = _G.ipairs
end

local _unpack = _G.unpack or unpack
if _unpack then
    local safe_unpack = function (t, ...)
        if type(t) ~= "table" then
            t = EMPTY_TABLE
        end
        return _unpack(t, ...)
    end
    _G.unpack = safe_unpack
    unpack = safe_unpack
end

local _string_find = string.find
string.find = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
	return _string_find(s, ...)
end

local _string_gmatch = string.gmatch
string.gmatch = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_gmatch(s, ...)
end

local _string_sub = string.sub
string.sub = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
	return _string_sub(s, ...)
end

local _string_len = string.len
string.len = function (s)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_len(s)
end

local _string_lower = string.lower
string.lower = function (s)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_lower(s)
end

local _string_gsub = string.gsub
string.gsub = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_gsub(s, ...)
end

local _math_floor = math.floor
math.floor = function (n)
    if type(n) ~= "number" then n = 0 end
	return _math_floor(n)
end

local _math_round = math.round
math.round = function (n, ...)
    if type(n) ~= "number" then n = 0 end
    return _math_round(n, ...)
end

local _math_abs = math.abs
math.abs = function (n)
    if type(n) ~= "number" then
        n = 0
    end
    return _math_abs(n)
end

local _math_min = math.min
math.min = function (...)
    local args = {...}
    for i = 1, select("#", ...) do
        if type(args[i]) ~= "number" then
            args[i] = 0
        end
    end
    return _math_min(unpack(args)) 
end

local _math_max = math.max
math.max = function (...)
    local args = {...}
    for i = 1, select("#", ...) do
        if type(args[i]) ~= "number" then
            args[i] = 0
        end
    end
    return _math_max(unpack(args)) 
end

local _mv_cp = mvector3.copy
mvector3.copy = function (vector3)
    if type(vector3) ~= "userdata" then
        vector3 = Vector3(0, 0, 0)
    end
    return _mv_cp(vector3)
end

local _mv_lerp = mvector3.lerp
mvector3.lerp = function (a,b,c,...)
    if type(a) ~= "userdata" then
        a = Vector3()
    end
    if type(b) ~= "userdata" then
        b = Vector3()
    end
    if type(c) ~= "userdata" then
        c = Vector3()
    end
    return _mv_lerp(a,b,c,...)
end

local _mv_x = mvector3.x
mvector3.x = function (vector3)
    if type(vector3) ~= "userdata" then
        vector3 = Vector3()
    end
    return _mv_x(vector3)
end

local _mv_y = mvector3.y
mvector3.y = function (vector3)
    if type(vector3) ~= "userdata" then
        vector3 = Vector3()
    end
    return _mv_y(vector3)
end

local _mv_z = mvector3.z
mvector3.z = function (vector3)
    if type(vector3) ~= "userdata" then
        vector3 = Vector3()
    end
    return _mv_z(vector3)
end
