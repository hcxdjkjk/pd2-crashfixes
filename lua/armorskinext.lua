local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local __apply_cosmetics = ArmorSkinExt._apply_cosmetics
function ArmorSkinExt:_apply_cosmetics(...)
    if not alive(self._unit) then
        return
    end
    return __apply_cosmetics(self, ...)
end
