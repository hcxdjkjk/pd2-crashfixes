local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local default_attributes_numbers = {30049, 2, 1, 1, 0, 1, 0, 1, nil, 0}

local function verify_mods(modlist)
    if modlist == "7d66a433be3a1fe2" then 
        return modlist 
    end
    if type(modlist) ~= "string" or modlist == "empty" then 
        return "7d66a433be3a1fe2" 
    end
    return modlist
end

local _is_server_ok = NetworkMatchMakingSTEAM.is_server_ok
function NetworkMatchMakingSTEAM:is_server_ok(friends_only, room, attributes_list, is_invite)
    if type(attributes_list) ~= "table" then return false end
    if type(attributes_list.numbers) ~= "table" then return false end

    for k, v in pairs(attributes_list.numbers) do
		if type(v) ~= "number" then
			attributes_list.numbers[k] = default_attributes_numbers[k]
		end
	end

    if attributes_list.numbers[5] < 1 or (attributes_list.numbers[5] >= 4 and not BigLobby) then
        return false
    end

    attributes_list.mods = verify_mods(attributes_list.mods)

    return _is_server_ok(self, friends_only == true, room ,attributes_list, is_invite == true)
end
