local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local type = type

local _round = math.round
function math.round(n, ...)
    if type(n) ~= "number" then
        n = 0
    end
    return _round(n, ...)
end

--[string "core/lib/utils/coremath.lua"]:251: attempt to perform arithmetic on local 'b' (a nil value)
local _lerp = math.lerp
function math.lerp(a, b, ...)
	if a == nil then
		a = type(b) == "number" and 0 or Vector3()
	end
	if b == nil then
		b = type(a) == "number" and 0 or Vector3()
	end
	return _lerp(a, b, ...)
end