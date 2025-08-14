-- func()  lib/managers/dynamicresourcemanager.lua:151 
function DynamicResourceManager:load(resource_type, resource_name, package_name, complete_clbk)
	local key = self._get_resource_key(resource_type, resource_name, package_name)
	local entry = self._to_unload and self._to_unload[key]

	if entry then
		entry.keep_using = nil
		entry.callbacks = {}
		self._dyn_resources[key] = entry
		self._to_unload[key] = nil

		if not next(self._to_unload) then
			self._to_unload = nil
		end
	end

	entry = entry or self._dyn_resources[key]

	if entry then
		entry.ref_c = entry.ref_c + 1

		if entry.ready then
			if complete_clbk then
				complete_clbk(true, resource_type, resource_name)
			end

			return
		elseif complete_clbk then
			table.insert(entry.callbacks, complete_clbk)

			return
		else
			entry.ready = true
		end
	else
		entry = {
			ref_c = 1,
			resource_type = resource_type,
			resource_name = resource_name,
			package_name = package_name,
			callbacks = {}
		}

		if complete_clbk then
			table.insert(entry.callbacks, complete_clbk)
		else
			entry.ready = true
		end

		self._dyn_resources[key] = entry
	end

	if complete_clbk and Application:editor() then
		PackageManager:package(package_name):load_temp_resource(resource_type, resource_name, nil)
		self:clbk_resource_loaded(true, resource_type, resource_name, package_name)
	else
		local pkg = PackageManager:package(package_name)
        if not pkg then
            if complete_clbk then complete_clbk(false, resource_type, resource_name) return end
        end

        PackageManager:package(package_name):load_temp_resource(resource_type, resource_name, complete_clbk and callback(self, self, "clbk_resource_loaded") or nil, true)
	end
end