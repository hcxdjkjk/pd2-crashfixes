local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local _is_part_valid = WeaponFactoryManager.is_part_valid
function WeaponFactoryManager:is_part_valid(part_id)
    local tw = tweak_data.weapon
    local twf = tw and tw.factory
    if type(part_id) ~= "string" then
        return false
    end
    if not (twf and twf.parts) then
        return false
    end

    return _is_part_valid(self, part_id)
end

local _clbk_part_unit_loaded = WeaponFactoryManager.clbk_part_unit_loaded
function WeaponFactoryManager:clbk_part_unit_loaded(task_data, ...)
    if type(task_data) ~= "table" then
        return
    end
    if not self._async_load_tasks then
        return
    end

	if task_data.spawn and self._async_load_tasks[task_data] then
		for _, part in pairs(task_data.parts) do
			if part.link_to_unit ~= nil and not alive(part.link_to_unit) then
				self._async_load_tasks[task_data] = nil
				return
			end
		end
	end

    return _clbk_part_unit_loaded(self, task_data, ...)
end

local _disassemble = WeaponFactoryManager.disassemble
function WeaponFactoryManager:disassemble(parts, ...)
	local result = _disassemble(self, parts, ...)

	for part_id in pairs(parts or {}) do
		parts[part_id] = nil
	end

	return result
end

local _get_weapon_id_by_factory_id = WeaponFactoryManager.get_weapon_id_by_factory_id
function WeaponFactoryManager:get_weapon_id_by_factory_id(factory_id)
    if not factory_id or not tweak_data.weapon.factory[factory_id] then
        return
    end
    return _get_weapon_id_by_factory_id(self, factory_id)
end

local _get_factory_id_by_weapon_id = WeaponFactoryManager.get_factory_id_by_weapon_id
function WeaponFactoryManager:get_factory_id_by_weapon_id(weapon_id)
    if not weapon_id or not tweak_data.weapon[weapon_id] then
        return
    end
    return _get_factory_id_by_weapon_id(self, weapon_id)
end
