local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/moneymanager.lua"]:1243: attempt to concatenate local 'mask_id' (a nil value)
local _on_sell_mask = MoneyManager.on_sell_mask
function MoneyManager:on_sell_mask(mask_id, ...)
    if not mask_id then
        mask_id = "dallas"
    end
    return _on_sell_mask(self, mask_id, ...)
end

local _get_mask_sell_value = MoneyManager.get_mask_sell_value
function MoneyManager:get_mask_sell_value(mask_id, ...)
    if not mask_id then
        mask_id = "dallas"
    end
    return _get_mask_sell_value(self, mask_id, ...)
end
