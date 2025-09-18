local _add_server_job = CrimeNetGui.add_server_job
function CrimeNetGui:add_server_job(data)
	if not data then return end
	if not (tonumber(data.difficulty_id)) then
		data.difficulty_id = 2
	end
	if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then
    	data.mutators = false
  	end
  	if data.host_name and type(data.host_name) == "string" then
  		data.host_name = string.gsub(data.host_name, "\n", "")
  		if #data.host_name > 32 then
  			data.host_name = string.sub(data.host_name, 1, 32)
  		end	
  	end
	if data.num_plrs and tonumber(data.num_plrs) >= 4 then
		return
	end
	_add_server_job(self, data)
end

local _update_server_job = CrimeNetGui.update_server_job
function CrimeNetGui:update_server_job(data, i)
	if not data then return end
	if not (tonumber(data.difficulty_id)) then
		data.difficulty_id = 2
	end
	if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then
   		data.mutators = false
	end
	if data.host_name and type(data.host_name) == "string" then
		data.host_name = string.gsub(data.host_name, "\n", "")
		if #data.host_name > 32 then
			data.host_name = string.sub(data.host_name, 1, 32)
		end	
	end
	if data.num_plrs and tonumber(data.num_plrs) >= 4 then
		return
	end
	_update_server_job(self, data, i)
end
