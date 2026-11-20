local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/weapons/sentrygunweapon.lua"]:296: attempt to index field '_muzzle_effect_table' (a nil value)
local _fire = SentryGunWeapon.fire
function SentryGunWeapon:fire(...)
    if not self._muzzle_effect_table then
        return
    end
    return _fire(self, ...)
end

--[string "lib/units/weapons/sentrygunweapon.lua"]:331: attempt to index field '_setup' (a nil value)
local __fire_raycast = SentryGunWeapon._fire_raycast
function SentryGunWeapon:_fire_raycast(...)
    if not self._setup then
        return
    end
    return __fire_raycast(self, ...)
end
