--[string "lib/units/enemies/cop/copdamage.lua"]:921: attempt to index field 'attacker_unit' (a nil value)
local _damage_bullet = CopDamage.damage_bullet
function CopDamage:damage_bullet(attack_data)
    if not attack_data.attacker_unit then
        return
    end
    
    return _damage_bullet(self, attack_data)
end
