local _is_server_ok = NetworkMatchMakingEPIC.is_server_ok
function NetworkMatchMakingEPIC:is_server_ok(friends_only, room, attributes_list, is_invite)
	for z, v in pairs(attributes_list.numbers) do
		if type(v) ~= "number" then
			attributes_list.numbers[z] = 0
		end
	end
	
	return _is_server_ok(self, friends_only, room, attributes_list, is_invite)
end
