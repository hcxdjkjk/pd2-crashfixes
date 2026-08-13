--[string "lib/units/weapons/newraycastweaponbase.lua"]:2431: attempt to index local 'user_unit' (a nil value)
local _on_equip = NewRaycastWeaponBase.on_equip
function NewRaycastWeaponBase:on_equip(user_unit)
	if type(user_unit) == "userdata" then
		return _on_equip(self,user_unit)	
	end
end
