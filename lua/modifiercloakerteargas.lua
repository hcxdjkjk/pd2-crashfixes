--[string "lib/modifiers/modifiercloakerteargas.lua"]:20: attempt to call method 'm_field_position' (a nil value)
function ModifierCloakerTearGas:OnEnemyDied(unit, damage_info)
  if not unit then return end
  local base_ext = unit:base()

	if base_ext and base_ext.has_tag and base_ext:has_tag("spooc") then
		local pos = unit:position()
		local ray = unit:raycast("ray", pos, pos + math.UP * -500, "slot_mask", managers.slot:get_mask("world_geometry"))
    local tracker
		if ray then
			mvector3.set(pos, ray.hit_position)
		elseif unit:movement() and unit:movement():nav_tracker() then
			tracker = unit:movement():nav_tracker()
    else
      tracker = nil

			if tracker then
				if tracker:lost() and tracker.field_m_position then
					tracker:field_m_position(pos)
				elseif tracker.m_position then
					tracker:m_position(pos)
        else
          
				end
			end
		end

		local grenade = World:spawn_unit(Idstring("units/pd2_dlc_drm/weapons/smoke_grenade_tear_gas/smoke_grenade_tear_gas_local"), pos, Rotation(math.random() * 360, 0, 0))

		grenade:base():set_properties({
			radius = self:value("diameter") * 0.5 * 100,
			damage = self:value("damage") * 0.1,
			duration = self:value("duration")
		})
		grenade:base():detonate()
	end
end
