local _is_server_ok = NetworkMatchMakingEPIC.is_server_ok
function NetworkMatchMakingEPIC:is_server_ok(friends_only, room, attributes_list, is_invite)
	for z, v in ipairs(attributes_list.numbers) do
		if type(v) ~= "number" then
			return false
		end
		if v == nil then
			attributes_list.numbers[z] = 0
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
