local default_attributes_numbers = {30049, 2, 1, 1, 0, 1, 0, 1, nil, 0}

local function verify_mods(modlist)
    --[[
	local chunks = string.split(attributes_list.mods, '|')
	for i = #chunks, 1, -1 do
		chunks[i] = utf8.clean(chunks[i])
	end
	attributes_list.mods = table.concat(chunks, '|')
]]
    if 
        type(modlist) ~= "string"
        or modlist == "empty"
        or string.is_nil_or_empty(modlist)
    then
        return "7d66a433be3a1fe2"
    end
    return modlist
end

local function verify_room(room)
    return room
    --[[
    if type(room) ~= "table" then return end

    local lobby = EpicMM and EpicMM:lobby(room.room_id) or DistributionMatchmaking:lobby_from_id(room.room_id)
    if type(lobby) ~= "userdata" then return end
    if type(lobby.key_value) ~= "function" then return end

    local acc_type = lobby:key_value("OWNER_ACCOUNT_TYPE") 
    if acc_type ~= "STEAM" and acc_type ~= "EPIC" then return end

    return room
    ]]
end

local function verify_attributes_list(attributes_list)
    if type(attributes_list) ~= "table" then return end	

    for k, v in pairs(attributes_list.numbers) do
		if type(v) ~= "number" then
			attributes_list.numbers[k] = default_attributes_numbers[k]
		end
	end

    attributes_list.mods = verify_mods(attributes_list.mods)

    return attributes_list
end

local function sanitize_is_server_ok(original, check_room)
    return function(self, friends_only, room, attributes_list, is_invite)
        if check_room then
            room = verify_room(room)
        end

        if not room then return end
        attributes_list = verify_attributes_list(attributes_list)
        if not attributes_list then return end

        return original(
            self,
            type(friends_only) == "boolean" and friends_only or false,
            room,
            attributes_list,
            type(is_invite) == "boolean" and is_invite or false
        )
    end 
end

local function sanitize_lobby_to_numbers(original)
    return function(self, lobby)
        if 
            type(lobby) == "userdata" 
            and type(lobby.key_value) == "function"
            and tonumber(lobby:key_value("level"))
            and tonumber(lobby:key_value("job_id"))
        then
            return original(self, lobby)
        end
        return default_attributes_numbers
    end
end

local function sanitize_server_job(original)
    return function (self, data, ...)
        if type(data) ~= "table" then return end

        if not tonumber(data.num_plrs) then
            data.num_plrs = 0
        end

        if (data.num_plrs >= 4 or data.num_plrs < 1) and not BigLobby then
	    	return
    	end

        if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then
            data.mutators = false
        end

        data.mods = verify_mods(data.mods)

        return original(self, data, ...)
    end
end

if RequiredScript:match("networkmatchmakingepic$") then

    NetworkMatchMakingEPIC.is_server_ok         = sanitize_is_server_ok(NetworkMatchMakingEPIC.is_server_ok, true)
    NetworkMatchMakingEPIC._lobby_to_numbers    = sanitize_lobby_to_numbers(NetworkMatchMakingEPIC._lobby_to_numbers)

elseif RequiredScript:match("networkmatchmakingsteam$") then

    NetworkMatchMakingSTEAM.is_server_ok        = sanitize_is_server_ok(NetworkMatchMakingSTEAM.is_server_ok, false)
    NetworkMatchMakingSTEAM._lobby_to_numbers   = sanitize_lobby_to_numbers(NetworkMatchMakingSTEAM._lobby_to_numbers)

elseif RequiredScript:match("crimenetmanager$") then

    CrimeNetGui.add_server_job                  = sanitize_server_job(CrimeNetGui.add_server_job)
    CrimeNetGui.update_server_job               = sanitize_server_job(CrimeNetGui.update_server_job)

end
