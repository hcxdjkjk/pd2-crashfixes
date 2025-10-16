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

function UnitNetworkHandler:set_look_dir(unit, yaw_in, pitch_in, sender)
	if not self._verify_character_and_sender(unit, sender) then return end
	if (unit and unit:movement() and unit:movement().sync_look_dir) and ((yaw_in and type(yaw_in) == "number") and (pitch_in and type(pitch_in) == "number")) then
		local dir = Vector3()
		local yaw = 360 * yaw_in / 255
		local pitch = math.lerp(-85, 85, pitch_in / 127)
		mrotation.y(Rotation(yaw, pitch, 0), dir)
		unit:movement():sync_look_dir(dir, yaw, pitch)
	end
end

function UnitNetworkHandler:set_equipped_weapon(unit, item_index, blueprint_string, cosmetics_string, sender)
	if not self._verify_character_and_sender(unit, sender) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then return end
	unit:inventory():synch_equipped_weapon(item_index, blueprint_string, "nil-1-0", self._verify_sender(sender))
end

--[string "lib/network/handlers/unitnetworkhandler.lua"]:82: attempt to call method 'sync_auto_recovery' (a nil value)
--or like that i don't remember xd
function UnitNetworkHandler:first_aid_kit_sync(unit, min_distance)
   	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_character(unit) then return end
   	if (unit and unit:base() and unit:base().sync_auto_recovery) and (min_distance and type(min_distance) == "number" and (min_distance > 0 and min_distance < 6)) then
       	unit:base():sync_auto_recovery(min_distance)
	end
end
