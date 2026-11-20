local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/enemies/cop/copdamage.lua"]:921: attempt to index field 'attacker_unit' (a nil value)
local _damage_bullet = CopDamage.damage_bullet
function CopDamage:damage_bullet(attack_data)
    if not attack_data.attacker_unit then
        return
    end
    
    return _damage_bullet(self, attack_data)
end

--[string "lib/units/enemies/cop/copdamage.lua"]:4275: attempt to index a nil value
local __sync_dismember = CopDamage._sync_dismember
function CopDamage:_sync_dismember(attacker_unit)
    if not attacker_unit then
        return
    end
    local peer = managers.network:get_peer_by_unit_safe(attacker_unit)
    if not (peer and peer:melee_id()) then
        return false
    end
    return __sync_dismember(self, attacker_unit)
end
