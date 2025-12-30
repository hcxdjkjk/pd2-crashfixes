local _is_server_ok = NetworkMatchMakingEPIC.is_server_ok
function NetworkMatchMakingEPIC:is_server_ok(friends_only, room, attributes_list, is_invite)
	for z, v in pairs(attributes_list.numbers) do
		if type(v) ~= "number" then
			attributes_list.numbers[z] = 0
		end
	end

	if type(attributes_list.mods) ~= "string" or attributes_list.mods == "empty" then
		attributes_list.mods = "7d66a433be3a1fe2"
	end
	
	return _is_server_ok(self, friends_only, room, attributes_list, is_invite)
end
