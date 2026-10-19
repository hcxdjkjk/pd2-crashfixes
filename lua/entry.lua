local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local EMPTY_TABLE = {}
local EMPTY_STRING = ""

local _table_insert = table.insert
table.insert = function (t, ...)
	if type(t) ~= "table" then return end
	return _table_insert(t, ...)
end

local _table_remove = table.remove
if _table_remove then
    table.remove = function (t, pos)
        if type(t) ~= "table" then
            return
        end
        if pos == nil then 
            return _table_remove(t) 
        end
        pos = tonumber(pos)
        if not pos then 
            return 
        end
        return _table_remove(t, pos)
    end
end

local _table_maxn = table.maxn
table.maxn = function (t)
    if type(t) ~= "table" then return 0 end
    return _table_maxn(t)
end

local _pairs = pairs
pairs = function (t)
    if type(t) ~= "table" then t = EMPTY_TABLE end
    return _pairs(t)
end

local _ipairs = ipairs
ipairs = function (t)
    if type(t) ~= "table" then t = EMPTY_TABLE end
    return _ipairs(t)
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
    if type(s) == "number" then
        s = tostring(s)
    elseif type(s) ~= "string" then
        s = EMPTY_STRING
    end
	return _string_find(s, ...)
end

local _string_gmatch = string.gmatch
string.gmatch = function (s, ...)
    if type(s) == "number" then
        s = tostring(s)
    elseif type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_gmatch(s, ...)
end

local _string_sub = string.sub
string.sub = function (s, ...)
    if type(s) == "number" then
        s = tostring(s)
    elseif type(s) ~= "string" then
        s = EMPTY_STRING
    end
	return _string_sub(s, ...)
end

local _string_len = string.len
string.len = function (s)
    if type(s) == "number" then
        s = tostring(s)
    elseif type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_len(s)
end

local _string_lower = string.lower
string.lower = function (s)
    if type(s) == "number" then
        s = tostring(s)
    elseif type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_lower(s)
end

local _string_gsub = string.gsub
string.gsub = function (s, ...)
    if type(s) == "number" then
        s = tostring(s)
    elseif type(s) ~= "string" then
        s = EMPTY_STRING
    end
    return _string_gsub(s, ...)
end

local _math_floor = math.floor
if _math_floor then
    math.floor = function (n)
    	return _math_floor(tonumber(n) or 0)
    end
end

local _math_abs = math.abs
if _math_abs then
    math.abs = function (n)
        return _math_abs(tonumber(n) or 0)
    end
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

if mvector3 then
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

    local _mv_set = mvector3.set
    mvector3.set = function (old, new)
        if type(old) ~= "userdata" then
            old = Vector3()
        end
        if type(new) ~= "userdata" then
            new = Vector3()
        end
        return _mv_set(old, new)
    end

end

local _bit_band = bit.band
bit.band = function(a, b, ...)
	if type(a) ~= 'number' or type(b) ~= 'number' then
		return 0
	end
	return _bit_band(a, b, ...)
end

local _string_byte = string.byte
string.byte = function(s, i, j)
	if type(s) ~= "string" then
		return nil
	end
	return _string_byte(s, i, j)
end
