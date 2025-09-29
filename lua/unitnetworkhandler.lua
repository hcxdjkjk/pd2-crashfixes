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

function UnitNetworkHandler:set_armor(unit, percent, max_mul, sender)
    if not self._verify_character_and_sender(unit, sender) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then return end
	if not tonumber(percent) then percent = 100 end
	if not tonumber(max_mul) then max_mul = 1 end
    local character_data = managers.criminals:character_data_by_peer_id(self._verify_sender(sender):id())
    if character_data and character_data.panel_id then
        managers.hud:set_teammate_armor(character_data.panel_id, {
            current = percent * max_mul,
            total = 100 * max_mul,
            max = 100 * max_mul
        })
    else
        managers.hud:set_mugshot_armor(unit:unit_data().mugshot_id, percent / 100)
    end
end
    
function UnitNetworkHandler:set_health(unit, percent, max_mul, sender)
    if not self._verify_character_and_sender(unit, sender) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then return end
	if not tonumber(percent) then percent = 100 end
	if not tonumber(max_mul) then max_mul = 1 end
    local character_data = managers.criminals:character_data_by_peer_id(self._verify_sender(sender):id())
    if character_data and character_data.panel_id then
        managers.hud:set_teammate_health(character_data.panel_id, {
            current = percent * max_mul,
            total = 100 * max_mul,
            max = 100 * max_mul
        })
    else
        managers.hud:set_mugshot_health(unit:unit_data().mugshot_id, percent / 100)
    end
    if percent ~= 100 then
        managers.mission:call_global_event("player_damaged")
    end
end
