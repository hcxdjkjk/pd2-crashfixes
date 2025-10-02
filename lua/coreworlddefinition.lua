-- [string "core/lib/utils/dev/editor/coreworlddefinition..."]:910: attempt to index a number value
if WorldDefinition then
    function WorldDefinition:_create_portal(data, offset)
        if not data or type(data) ~= "table" then
            return
        end

        if not Application:editor() and type(data.portals) == "table" then
            for _, portal in ipairs(data.portals) do
                local t = {}
                for _, point in ipairs(portal.points or {}) do
                    table.insert(t, (point.position or Vector3()) + (offset or Vector3()))
                end
                local top = portal.top
                local bottom = portal.bottom
                if top == 0 and bottom == 0 then
                    top, bottom = nil
                end
                managers.portal:add_portal(t, bottom, top)
            end
        end

        local unit_groups = data.unit_groups
        if type(unit_groups) ~= "table" then
            return
        end

        unit_groups._meta = nil

        for name, group_data in pairs(unit_groups) do
            if type(group_data) == "table" then
                local group = managers.portal:add_unit_group(name)
                local shapes = group_data.shapes or group_data
                if type(shapes) == "table" then
                    for _, shape in ipairs(shapes) do
                        group:add_shape(shape)
                    end
                end
                if group_data.ids then
                    group:set_ids(group_data.ids)
                end
            end
        end
    end

    -- [string "core/lib/utils/dev/editor/coreworlddefinition..."]:1301: attempt to index a number value
    function WorldDefinition:_setup_projection_light(unit, data)
        if not data.projection_light then return end
        if not data.projection_textures then return end

		if unit and unit:unit_data() then
       		unit:unit_data().projection_textures = data.projection_textures
        	unit:unit_data().projection_light = data.projection_light
        end

        local light = unit:get_object(Idstring(data.projection_light))
        local texture_name = nil

        if unit:unit_data().projection_textures then
            texture_name = unit:unit_data().projection_textures[data.projection_light]
            if not DB:has(Idstring("texture"), Idstring(texture_name)) then
                return
            end
        else
            texture_name = (self._cube_lights_path or self:world_dir()) .. "cube_lights/" .. unit:unit_data().unit_id
            if not DB:has(Idstring("texture"), Idstring(texture_name)) then
                return
            end
        end

        local omni = string.find(light:properties(), "omni") and true or false
        light:set_projection_texture(Idstring(texture_name), omni, true)
    end

end
