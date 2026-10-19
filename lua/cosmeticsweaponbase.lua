local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local __apply_cosmetics = NewRaycastWeaponBase._apply_cosmetics
function NewRaycastWeaponBase:_apply_cosmetics(...)
    if not alive(self._unit) then
        return
    end

    return __apply_cosmetics(self, ...)
end

local __update_materials  = NewRaycastWeaponBase._update_materials
function NewRaycastWeaponBase:_update_materials(...)
	local parts = self._parts
    if not parts then return end

	for part_id, part in pairs(parts or {}) do
		if type(part) == "table" and part.unit ~= nil and not alive(part.unit) then
            if part.package then
                managers.weapon_factory:unload_package(part.package)
            end
			parts[part_id] = nil
		end
	end

	return __update_materials(self, ...)
end
