local _is_part_valid = WeaponFactoryManager.is_part_valid
function WeaponFactoryManager:is_part_valid(part_id)
    if 
        type(part_id) == "string"
        and tweak_data.weapon
        and tweak_data.weapon.factory
        and tweak_data.weapon.factory.parts
    then
        return _is_part_valid(self, part_id)
    end
    return false
end
