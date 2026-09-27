local default_attributes_numbers = {30049, 2, 1, 1, 0, 1, 0, 1, nil, 0}

local _is_server_ok = NetworkMatchMakingSTEAM.is_server_ok
function NetworkMatchMakingSTEAM:is_server_ok(friends_only, room, attributes_list, is_invite)

    local function verify_mods(modlist)
        if modlist == "7d66a433be3a1fe2" then return modlist end
        if
            type(modlist) ~= "string"
            or modlist == "empty"
            or string.is_nil_or_empty(modlist)
        then
            return "7d66a433be3a1fe2"
        end

        local chunks = string.split(modlist, '|')
        for i = 1, #chunks, 2 do
            local folder = chunks[i]
            local name = chunks[i + 1]
            if not name or name == "" then
                name = folder
            end
            chunks[i + 1] = name
        end
        modlist = table.concat(chunks, '|')

        return modlist
    end

    for k, v in pairs(attributes_list.numbers or {}) do
		if type(v) ~= "number" then
			attributes_list.numbers[k] = default_attributes_numbers[k]
		end
	end

    attributes_list.mods = verify_mods(attributes_list.mods)

    return _is_server_ok(self, friends_only == true, room ,attributes_list, is_invite == true)
end
