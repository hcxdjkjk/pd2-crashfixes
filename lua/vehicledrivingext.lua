local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/vehicles/vehicledrivingext.lua"]:633: cannot use undeclared global 'peer'
function VehicleDrivingExt:sync_give_vehicle_loot_to_player(carry_id, multiplier, peer_id)
	if not self:remove_loot(carry_id, multiplier) then
		return
	end

    local peer = managers.network:get_peer_safe(peer_id)

	if not self._is_server then
		if not peer then
			return
		end
	end

	if peer_id == managers.network:get_local_peer_safe():id() then
		managers.player:set_carry(carry_id, multiplier, true, false, 1)
	end

    if peer then
	    managers.player:register_carry(peer, carry_id)
    end
end