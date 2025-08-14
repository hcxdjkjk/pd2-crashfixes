-- [string "core/lib/managers/coreportalmanager.lua"]:652: attempt to index a number value
if PortalUnitGroup then
    function PortalUnitGroup:_change_units_visibility(diff)
        for i = #self._units, 1, -1 do
            local unit = self._units[i]
            if type(unit) ~= "userdata" or not alive(unit) then
                table.remove(self._units, i)
            else
                self:_change_visibility(unit, diff)
            end
        end
    end
    function PortalUnitGroup:_change_visibility(unit, diff)
        if type(unit) ~= "userdata" or not alive(unit) then
            return
        end
        if not unit:unit_data()._visibility_counter then
            managers.portal:pseudo_reset()
        end
        unit:unit_data()._visibility_counter = unit:unit_data()._visibility_counter + diff
        if unit:unit_data()._visibility_counter > 0 then
            unit:set_visible(true)
            managers.portal:remove_from_hide_list(unit)
        else
            managers.portal:add_to_hide_list(unit)
        end
    end
end