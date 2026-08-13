--[string "lib/units/weapons/sentrygunweapon.lua"]:296: attempt to index field '_muzzle_effect_table' (a nil value)
local _fire = SentryGunWeapon.fire
function SentryGunWeapon:fire(...)
    self._interleaving_fire = type(self._interleaving_fire) == "number" and self._interleaving_fire or 1
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
