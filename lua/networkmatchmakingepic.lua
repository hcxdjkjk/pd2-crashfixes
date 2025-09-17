local _is_server_ok = NetworkMatchMakingEPIC.is_server_ok
function NetworkMatchMakingEPIC:is_server_ok(friends_only, room, attributes_list, is_invite)
	for i = 1, 8 do
		if type(attributes_list.numbers[i]) ~= "number" then return false end
	    if attributes_list.numbers[i] == nil then
	    	attributes_list.numbers[i] = -1
	    end
	end
	if attributes_list.numbers[5] >= 4 then
	   	return false
	end
	return _is_server_ok(self, friends_only, room, attributes_list, is_invite)
end
