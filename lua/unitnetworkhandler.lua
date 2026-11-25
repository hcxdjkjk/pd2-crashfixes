local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local _suppression = UnitNetworkHandler.suppression
function UnitNetworkHandler:suppression(unit, ...)
    if not alive(unit) then
        return
    end
    
    local base_ext = unit:base()
    if not (base_ext and base_ext.char_tweak) then
        log(string.format("%s: crash prevented in suppression", id))
        return
    end

    return _suppression(self, unit, ...)
end