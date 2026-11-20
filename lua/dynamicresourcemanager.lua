local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local _unload = DynamicResourceManager.unload
local _load = DynamicResourceManager.load
local get_key = DynamicResourceManager._get_resource_key

function DynamicResourceManager:unload(resource_type, resource_name, package_name, ...)
    local key = get_key(resource_type, resource_name, package_name)
    local entry = self._dyn_resources[key]

    if entry and entry.ref_c == 1 and not entry.ready and entry.callbacks and next(entry.callbacks) then
        entry.ref_c = 2
        entry.callbacks[#entry.callbacks + 1] = function()
            if self._dyn_resources[key] == entry then
                _unload(self, resource_type, resource_name, package_name, false)
            end
        end
    end

    return _unload(self, resource_type, resource_name, package_name, ...)
end

function DynamicResourceManager:load(resource_type, resource_name, package_name, ...)
    local to_unload = self._to_unload

    if to_unload then
        local key = get_key(resource_type, resource_name, package_name)
        local stale = to_unload[key]

        if stale and not stale.ready then
            to_unload[key] = nil

            if not next(to_unload) then
                self._to_unload = nil
            end
        end
    end

    return _load(self, resource_type, resource_name, package_name, ...)
end