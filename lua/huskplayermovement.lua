local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/beings/player/huskplayermovement.lua"]:504: attempt to index local 'self' (a boolean value)
local _update = HuskPlayerMovement.update
function HuskPlayerMovement:update(...)
    if type(self) ~= "table" then
        return
    end
    return _update(self, ...)
end
