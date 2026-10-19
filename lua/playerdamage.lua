local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/beings/player/playerdamage.lua"]:955: attempt to index field 'hud' (a nil value)
local _set_health = PlayerDamage.set_health
function PlayerDamage:set_health(...)
    if not managers.hud then
        return
    end
    return _set_health(self, ...)
end

--[string "lib/units/beings/player/playerdamage.lua"]:2813: attempt to index field 'hud' (a nil value)
local __send_set_revives = PlayerDamage._send_set_revives
function PlayerDamage:_send_set_revives(...)
    if not managers.hud then
        return
    end
    return __send_set_revives(self, ...)
end

--[string "lib/units/beings/player/playerdamage.lua"]:680: attempt to index field 'hud' (a nil value)
local _replenish = PlayerDamage.replenish
function PlayerDamage:replenish()
    if not managers.hud then
        return
    end
    return _replenish(self)
end

--[string "lib/units/beings/player/playerdamage.lua"]:3399: attempt to index field 'hud' (a nil value)
local _clear_delayed_damage = PlayerDamage.clear_delayed_damage
function PlayerDamage:clear_delayed_damage()
    if not managers.hud then
        return
    end
    return _clear_delayed_damage(self)
end

local _get_real_health = PlayerDamage.get_real_health
function PlayerDamage:get_real_health()
    if not self._health then
        return 0
    end
    return _get_real_health(self)
end

local _get_real_armor = PlayerDamage.get_real_armor
function PlayerDamage:get_real_armor()
    if not self._armor then
        return 0
    end
    return _get_real_armor(self)
end
