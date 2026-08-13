local EMPTY_TABLE = {}
local EMPTY_STRING = ""

local _table_insert = table.insert
local _table_remove = table.remove
local _table_maxn = table.maxn
local _table_empty = table.empty
local _pairs = pairs
local _ipairs = ipairs
local _unpack = _G.unpack or unpack

table.insert = function (t, ...)
	if type(t) ~= "table" then return end
	return _table_insert(t, ...)
end
table.remove = function (t, ...)
	if type(t) ~= "table" then return end
	return _table_remove(t, ...)
end
table.maxn = function (t)
    if type(t) ~= "table" then return 0 end
    return _table_maxn(t)
end
table.empty = function (t)
    if type(t) ~= "table" then return true end
    return _table_empty(t)
end
if _pairs then
    _G.pairs = function (t)
		if type(t) ~= "table" then 
            t = EMPTY_TABLE
        end
		return _pairs(t)
    end
    pairs = _G.pairs
end
if _ipairs then
	_G.ipairs = function (t)
        if type(t) ~= "table" then
            t = EMPTY_TABLE
        end
		return _ipairs(t)
	end
	ipairs = _G.ipairs
end
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

local _string_len = string.len
local _string_gmatch = string.gmatch
local _string_sub = string.sub
local _string_find = string.find
local _string_lower = string.lower
local _string_gsub = string.gsub

string.find = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
	return _string_find(s, ...)
end
string.gmatch = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_gmatch(s, ...)
end
string.sub = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
	return _string_sub(s, ...)
end
string.len = function (s)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_len(s)
end
string.lower = function (s)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_lower(s)
end
string.gsub = function (s, ...)
    if type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_gsub(s, ...)
end

local _math_floor = math.floor
local _math_min = math.min
local _math_max = math.max
local _math_round = math.round

math.floor = function (n)
    if type(n) ~= "number" then n = 0 end
	return _math_floor(n)
end
math.round = function (n, ...)
    if type(n) ~= "number" then n = 0 end
    return _math_round(n, ...)
end
math.min = function (...)
    local args = {...}
    for i = 1, select("#", ...) do
        if type(args[i]) ~= "number" then
            args[i] = 0
        end
    end
    return _math_min(unpack(args)) 
end
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
