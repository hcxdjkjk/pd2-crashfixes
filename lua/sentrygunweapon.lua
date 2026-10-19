local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/weapons/sentrygunweapon.lua"]:296: attempt to index field '_muzzle_effect_table' (a nil value)
local _fire = SentryGunWeapon.fire
function SentryGunWeapon:fire(...)
    self._interleaving_fire = tonumber(self._interleaving_fire) or 1
    if not self._muzzle_effect_table then
        self._muzzle_effect_table = {
		    {
			    force_synch = false,
			    effect = self._muzzle_effect or Idstring("effects/particles/test/muzzleflash_maingun"),
			    parent = self._effect_align[1]
		    },
		    {
			    force_synch = false,
			    effect = self._muzzle_effect or Idstring("effects/particles/test/muzzleflash_maingun"),
			    parent = self._effect_align[2]
		    }
	    }
    end
    return _fire(self, ...)
end

--[string "lib/units/weapons/sentrygunweapon.lua"]:331: attempt to index field '_setup' (a nil value)
local __fire_raycast = SentryGunWeapon._fire_raycast
function SentryGunWeapon:_fire_raycast(...)
    if not self._setup and self._unit then
        self._setup = {
            ignore_units = {
	    		self._unit
    		}
        }
    end
    return __fire_raycast(self, ...)
end
