function ManageSpawnedUnits:load(data)
    if not data then return end

	if self._link_after_load then
		self._loaded = true

		for _, params in ipairs(self._link_after_load) do
			self:spawn_and_link_unit(unpack(params))
		end

		self._link_after_load = nil
		self._loaded = nil
	end

	local save_data = data.ManageSpawnedUnits or data.managed_spawned_units
	if not save_data then return end

	if save_data.local_units then
		self._loaded = true

		for unit_id, synced_entry in pairs(save_data.local_units or {}) do
            if synced_entry and synced_entry.unit_name then
    			local name_ids = Idstring(synced_entry.unit_name) --fixed by Max from GosUslugi
                if not DB:has(IDS_UNIT, name_ids) then return end
                if not PackageManager:has(IDS_UNIT, name_ids) then return end

    			if synced_entry.joint_table then
    				self:spawn_and_link_unit(synced_entry.joint_table, unit_id, synced_entry.unit_name)
    			else
    				self:spawn_unit(unit_id, synced_entry.align_obj_name, synced_entry.unit_name)
    			end
            end
		end

		self._loaded = nil
	end
end
