local _is_server_ok = NetworkMatchMakingEPIC.is_server_ok
function NetworkMatchMakingEPIC:is_server_ok(friends_only, room, attributes_list, is_invite)
	local lobby = EpicMM:lobby(room.room_id)
	for i = 1, 8 do
		if type(attributes_list.numbers[i]) ~= "number" then return false end
	    if attributes_list.numbers[i] == nil then
	    	attributes_list.numbers[i] = 0
	    end
	end
	if attributes_list.numbers[5] >= 4 then
	   	return false
	end
	if not tonumber(attributes_list.numbers[2]) then
	   	attributes_list.numbers[2] = -1
	end
	return _is_server_ok(self, friends_only, room, attributes_list, is_invite)
end
