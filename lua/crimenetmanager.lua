function server_verify(data)
	if type(data) ~= "table" then return nil end
	if not data.id then return nil end
	if not data.room_id then return nil end
	if not data.difficulty_id then return nil end
	if not data.host_name or type(data.host_name) ~= "string" then data.host_name = " " end
	if not data.num_plrs then return nil end

	local lobby = EpicMM:lobby(data.room_id)
	if type(lobby) ~= "userdata" then return nil end
	if type(lobby.key_value) ~= "function" then return nil end

	local owner_account_type = lobby:key_value("owner_account_type")
	if (owner_account_type == "STEAM" or owner_account_type == "EPIC") then else return nil end

	if not tonumber(data.difficulty_id) then
		data.difficulty_id = 2
	end

	if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then
    	data.mutators = false
  	end

	data.host_name = string.gsub(data.host_name, "\n", "")
	if #data.host_name > 32 then
		data.host_name = string.sub(data.host_name, 1, 32)
	end

  	local owner_account_id = tostring(lobby:key_value("owner_account_id"))
  	if #owner_account_id == 32 then
  		if tostring(owner_account_id):match("^[0-9a-f]+$") then else return nil end
  	elseif #owner_account_id == 17 then
  		if not tonumber(owner_account_id) then return nil end
  	else return nil end

  	if tonumber(data.num_plrs) >= 4 then return nil	end
	
	return data
end

local _add_server_job = CrimeNetGui.add_server_job
function CrimeNetGui:add_server_job(data)
	local data_checked = server_verify(data)
	if not data_checked then return end
	_add_server_job(self, data_checked)
end

local _update_server_job = CrimeNetGui.update_server_job
function CrimeNetGui:update_server_job(data, i)
	local data_checked = server_verify(data)
	if not data_checked then return end
	_update_server_job(self, data_checked, i)
end
