--[string "lib/network/handlers/unitnetworkhandler.lua"]:264: attempt to call method 'sync_action_change_pose' (a nil value)
function UnitNetworkHandler:action_change_pose(unit, pose_code, pos)
	if not self._verify_character(unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then return end
	if (unit and unit:movement() and unit:movement().sync_action_change_pose) and (pose_code and type(pose_code) == "number") and (pos and type(pos) == "userdata") then
		unit:movement():sync_action_change_pose(pose_code, pos)
	end
end

function UnitNetworkHandler:sync_melee_start(unit, hand, sender)
	if not self._verify_character_and_sender(unit, sender) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then return end
	if (unit and unit:movement() and unit:movement().sync_melee_start) and (hand and type(hand) == "number") then
		unit:movement():sync_melee_start(hand)
	end
end

--[string "lib/network/handlers/unitnetworkhandler.lua"]:3503: attempt to index local 'unit' (a nil value)
function UnitNetworkHandler:sync_drill_upgrades(unit, autorepair_level_1, autorepair_level_2, drill_speed_level, silent, reduced_alert, sender_rpc)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_character_and_sender(unit, sender_rpc) then return end
	local base_ext = unit and alive(unit) and unit:base()
	if base_ext and base_ext.set_skill_upgrades then
		base_ext:set_skill_upgrades(Drill.create_upgrades(autorepair_level_1, autorepair_level_2, drill_speed_level, silent, reduced_alert))
	end
end
