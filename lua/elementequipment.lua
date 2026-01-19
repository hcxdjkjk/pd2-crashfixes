-- [string "lib/managers/mission/elementequipment.lua"]:23: attempt to index local 'instigator' (a nil value)
local _on_executed = ElementEquipment.on_executed

function ElementEquipment:on_executed(instigator)
    if instigator and self._values.equipment and self._values.amount then
        _on_executed(self, instigator)
    end
end
