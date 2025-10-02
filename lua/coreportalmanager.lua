core:module("CorePortalManager")
core:import("CoreShapeManager")

-- [string "core/lib/managers/coreportalmanager.lua"]:652: attempt to index a number value
function PortalUnitGroup:_change_units_visibility(diff)
	for i = #self._units, 1, -1 do
		local unit = self._units[i]
		if not self._verify_character(unit) then
			table.remove(self._units, i)
		else
			self:_change_visibility(unit, diff)
		end
	end
end

function PortalUnitGroup:_change_visibility(unit, diff)
	if not self._verify_character(unit) then return end
	if not unit:unit_data() then return end
	if not unit:unit_data()._visibility_counter then
		managers.portal:pseudo_reset()
	end
	if type(diff) ~= "number" then
		diff = 0
	end
	unit:unit_data()._visibility_counter = unit:unit_data()._visibility_counter + diff
	if unit:unit_data()._visibility_counter > 0 then
		unit:set_visible(true)
		managers.portal:remove_from_hide_list(unit)
	else
		managers.portal:add_to_hide_list(unit)
	end
end
